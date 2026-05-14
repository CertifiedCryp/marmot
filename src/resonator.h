#pragma once
#include <vector>

class Resonator {
public:
    void compute_harmonic_resonance(const std::vector<float>& spreads);
    float get_resonance() const;

private:
    float resonance = 0.0f;
};
