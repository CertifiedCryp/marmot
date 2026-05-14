#include "resonator.h"
#include <vector>
#include <cmath>
#include <algorithm>

void Resonator::compute_harmonic_resonance(const std::vector<float>& spreads) {
    // Simple CPU resonance calculation (we can improve later)
    resonance = 0.85f; // placeholder for now
}

float Resonator::get_resonance() const { return resonance; }
