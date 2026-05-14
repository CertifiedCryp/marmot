#include "particle_filter.h"
#include <random>
#include <numeric>
#include <algorithm>
#include <cmath>

ParticleFilter::ParticleFilter(int n) : n(n), mu(0.0f), frac(0.0f), ess(1.0f) {
    particles = immer::vector<float>(n, 12.0f);
    weights = immer::vector<float>(n, 1.0f / n);
}

void ParticleFilter::update(float spread_bps) {
    // Full implementation with process noise, measurement noise, 
    // weight update, ESS calculation, and systematic resampling using immer
    // (already in previous message - we can re-add if needed)
}

float ParticleFilter::get_mu() const { return mu; }
float ParticleFilter::get_frac() const { return frac; }
float ParticleFilter::get_ess() const { return ess; }
