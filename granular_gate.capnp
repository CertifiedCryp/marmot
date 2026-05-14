@0x8f3e2c1a9b7d4e5f;

# granular_gate.capnp
# Unified Cap'n Proto schema for the entire resonance pipeline
# Replaces rkyv + pickle + JSON sidecars
# Used by: granular_gate (Rust), process-compose health checks, Marmot ingestion, rustnet metrics

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("granular");

struct Timestamp {
  unixMs @0 :UInt64;
}

struct Pulse {
  # From on-chain CoulterCounter contract via EigenDA
  blobIndex @0 :UInt64;
  commitment @1 :Data;          # 32 bytes
  proof @2 :Data;               # KZG proof
  timestamp @3 :Timestamp;
  venuesHash @4 :Data;          # keccak of all venue microdata
  resonanceHint @5 :UInt8;      # 0-100 from on-chain pre-filter
  decodedTicks @6 :List(ProbeTick);
}

struct ProbeTick {
  venue @0 :Text;
  timestamp @1 :Timestamp;
  midPrice @2 :Float64;
  spreadBps @3 :Float32;
  toxicity @4 :Float32;
  coherence @5 :Float32;        # HOM3642 multi-scale
  flowImbalance @6 :Float32;
  orderflowHint @7 :Float32;
}

struct ParticleFilterState {
  particles @0 :List(Float32);
  weights @1 :List(Float32);
  n @2 :UInt16;
  mu @3 :Float32;               # posterior mean (bps)
  fracPositive @4 :Float32;
  ess @5 :Float32;              # Effective Sample Size
  ciLow @6 :Float32;
  ciHigh @7 :Float32;
  lastUpdate @8 :Timestamp;
}

struct GranularSignal {
  canonicMid @0 :Float64;
  direction @1 :Int8;           # 1 = buy canonic, -1 = sell
  resonanceLock @2 :Float32;    # 0.0 - 1.0  (target > 0.92 for 100% harmonic)
  pfMuBps @3 :Float32;
  pfFrac @4 :Float32;
  uvToxicity @5 :Float32;
  bellmanExitMs @6 :Float32;
  submarineMode @7 :Text;       # HUNT | CONVERGE | SCATTER | HOLD
  sizeMult @8 :Float32;
  timestamp @9 :Timestamp;
  confidence @10 :Float32;
  venuesProcessed @11 :UInt8;
}

struct NetworkMetrics {
  # From rustnet
  processName @0 :Text;
  connections @1 :UInt32;
  retransmits @2 :UInt32;
  jitterMs @3 :Float32;
  rxRate @4 :Float32;
  txRate @5 :Float32;
  toxicityScore @6 :Float32;    # derived from retransmits + jitter
  timestamp @7 :Timestamp;
}

struct ResonanceDecision {
  fire @0 :Bool;
  resonanceLock @1 :Float32;
  reason @2 :Text;
  pfState @3 :ParticleFilterState;
  network @4 :NetworkMetrics;
  timestamp @5 :Timestamp;
}

struct Regime {
  regime @0 :Text;              # resonant | neutral | toxic
  confidence @1 :Float32;
  ess @2 :Float32;
  recommendation @3 :Text;      # HUNT | HOLD
  timestamp @4 :Timestamp;
}
