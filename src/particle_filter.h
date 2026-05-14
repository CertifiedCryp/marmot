#pragma once
#include <vector>
#include <immer/vector.hpp>

class ParticleFilter {
public:
    ParticleFilter(int n = 64);
    void update(float spread_bps);
    float get_mu() const;
    float get_frac() const;
    float get_ess() const;

private:
    immer::vector<float> particles;
    immer::vector<float> weights;
    int n;
    float mu;
    float frac;
    float ess;
};
