// src/main.rs
// Proper granular_gate v0.5 - Live Pulse reader version

use capnp::message::Builder;
use capnp::serialize;
use std::fs::File;
use std::io::{Read, Write};
use rand::Rng;

mod granular_gate_capnp {
    include!(concat!(env!("OUT_DIR"), "/granular_gate_capnp.rs"));
}

use granular_gate_capnp::{pulse, granular_signal};

const NUM_PARTICLES: usize = 512;
const RESONANCE_THRESHOLD: f32 = 0.89;
const MIN_PF_MU_BPS: f32 = 8.0;

#[derive(Clone, Copy)]
struct Particle {
    value: f32,
    weight: f32,
}

struct ParticleFilter {
    particles: Vec<Particle>,
}

impl ParticleFilter {
    fn new(initial_spread: f32) -> Self {
        let mut particles = Vec::with_capacity(NUM_PARTICLES);
        for _ in 0..NUM_PARTICLES {
            particles.push(Particle {
                value: initial_spread,
                weight: 1.0 / NUM_PARTICLES as f32,
            });
        }
        Self { particles }
    }

    fn update(&mut self, observed_spread: f32) {
        for p in &mut self.particles {
            p.value += rand::thread_rng().gen_range(-1.2..1.2);
        }

        let mut total_weight = 0.0;
        for p in &mut self.particles {
            let error = p.value - observed_spread;
            p.weight *= (-0.5 * (error * error) / 2.5).exp();
            total_weight += p.weight;
        }

        if total_weight > 0.0 {
            for p in &mut self.particles {
                p.weight /= total_weight;
            }
        }

        let mut new_particles = Vec::with_capacity(NUM_PARTICLES);
        let step = 1.0 / NUM_PARTICLES as f32;
        let mut cumulative = 0.0;
        let mut u = rand::thread_rng().gen_range(0.0..step);
        let mut idx = 0;

        for _ in 0..NUM_PARTICLES {
            while cumulative < u && idx < NUM_PARTICLES {
                cumulative += self.particles[idx].weight;
                idx += 1;
            }
            if idx > 0 {
                new_particles.push(self.particles[idx - 1]);
            }
            u += step;
        }
        self.particles = new_particles;
    }

    fn get_stats(&self) -> (f32, f32) {
        let mut weighted_sum = 0.0;
        let mut positive_weight = 0.0;
        for p in &self.particles {
            weighted_sum += p.value * p.weight;
            if p.value > 0.0 {
                positive_weight += p.weight;
            }
        }
        (weighted_sum, positive_weight)
    }
}

fn try_read_latest_pulse() -> Option<f32> {
    let path = "/dev/shm/pulse.capnp";
    if let Ok(mut file) = File::open(path) {
        let mut buffer = Vec::new();
        if file.read_to_end(&mut buffer).is_ok() {
            if let Ok(message) = serialize::read_message(&buffer[..], Default::default()) {
                if let Ok(pulse_reader) = message.get_root::<pulse::Reader>() {
                    if let Ok(ticks) = pulse_reader.get_decoded_ticks() {
                        if let Some(tick) = ticks.iter().next() {
                            return Some(tick.get_spread_bps());
                        }
                    }
                }
            }
        }
    }
    None
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("granular_gate (live) starting...");

    let observed_spread_bps: f32 = match try_read_latest_pulse() {
        Some(spread) => {
            println!("Using live spread from Pulse: {:.2} bps", spread);
            spread
        }
        None => {
            println!("No live Pulse found, using simulated spread");
            14.5
        }
    };

    let mut pf = ParticleFilter::new(observed_spread_bps);
    pf.update(observed_spread_bps);

    let (pf_mu, pf_frac) = pf.get_stats();
    let resonance_lock = if pf_mu > MIN_PF_MU_BPS && pf_frac > 0.88 { 0.93 } else { 0.65 };

    println!(
        "PF mu: {:.2} | frac: {:.3} | resonance_lock: {:.3}",
        pf_mu, pf_frac, resonance_lock
    );

    let mut message = Builder::new_default();
    let mut signal = message.init_root::<granular_signal::Builder>();

    signal.set_canonic_mid(0.0);
    signal.set_direction(1);
    signal.set_resonance_lock(resonance_lock);
    signal.set_pf_mu_bps(pf_mu);
    signal.set_pf_frac(pf_frac);
    signal.set_uv_toxicity(1.0 - pf_frac);
    signal.set_bellman_exit_ms(42.0);
    signal.set_submarine_mode(if resonance_lock > RESONANCE_THRESHOLD { "HUNT" } else { "HOLD" });
    signal.set_size_mult(if resonance_lock > RESONANCE_THRESHOLD { 1.4 } else { 0.6 });
    signal.set_confidence(resonance_lock);

    let mut ts = signal.reborrow().init_timestamp();
    ts.set_unix_ms(0);

    let mut buffer = Vec::new();
    serialize::write_message(&mut buffer, &message)?;

    let mut file = File::create("/dev/shm/granular_signal.capnp")?;
    file.write_all(&buffer)?;

    println!("GranularSignal written to /dev/shm/granular_signal.capnp");

    Ok(())
}
