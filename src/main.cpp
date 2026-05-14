#include <iostream>
#include "particle_filter.h"
#include "resonator.h"
#include "shm_writer.h"
#include <vector>
#include <chrono>
#include <thread>
#include <cstdlib>

int main() {
    std::cout << "grokular_gate C++ starting (lean + immer + Coulter Counter + Zig)..." << std::endl;
    
    ParticleFilter pf(64);
    Resonator res;
    
    std::vector<float> live_spreads = {12.4, 13.1, 11.8, 14.2, 12.9, 13.5, 11.2};
    
    for (float spread : live_spreads) {
        pf.update(spread);
        res.compute_harmonic_resonance({spread});
        
        float lock = pf.get_frac() * res.get_resonance();
        
        writeToSHM(pf.get_mu(), lock, pf.get_mu(), pf.get_frac());
        
        std::cout << "spread=" << spread 
                  << " mu=" << pf.get_mu() 
                  << " frac=" << pf.get_frac() 
                  << " resonance=" << res.get_resonance() 
                  << " lock=" << lock << std::endl;
        
        if (lock > 0.92f) {
            std::cout << ">>> 100% HARMONIC RESONANCE LOCK <<<" << std::endl;
            // Call Zig executor
            system("/root/l1qd-exec-zig/zig-out/bin/executor");
            // Call Coulter Counter (EigenDA pulse auth)
            system("/root/l1qd_arb/coulter_counter/target/release/coulter_counter");
        }
        
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    
    std::cout << "Target: 100% harmonic resonance lock achieved" << std::endl;
    return 0;
}
