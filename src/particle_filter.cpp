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
    std::random_device rd;
    std::mt19937 gen(rd());
    std::normal_distribution<float> process_noise(0.0f, 0.8f);
    std::normal_distribution<float> meas_noise(0.0f, 1.2f);

    // Predict
    for (int i = 0; i < n; ++i) {
        particles = particles.set(i, particles[i] + process_noise(gen));
    }

    // Update weights
    float sum_w = 0.0f;
    for (int i = 0; i < n; ++i) {
        float err = (particles[i] - spread_bps) / 1.2f;
        float w = std::exp(-0.5f * err * err);
        weights = weights.set(i, weights[i] * w);
        sum_w += weights[i];
    }

    // Normalize
    for (int i = 0; i < n; ++i) {
        weights = weights.set(i, weights[i] / (sum_w + 1e-12f));
    }

    // Effective Sample Size
    float sum_sq = 0.0f;
    for (int i = 0; i < n; ++i) sum_sq += weights[i] * weights[i];
    ess = 1.0f / (sum_sq + 1e-12f);

    // Systematic resampling if ESS low
    if (ess < 0.5f * n) {
        std::vector<float> cumsum(n);
        cumsum[0] = weights[0];
        for (int i = 1; i < n; ++i) cumsum[i] = cumsum[i-1] + weights[i];

        std::vector<float> new_particles(n);
        float u = std::uniform_real_distribution<float>(0, 1.0f / n)(gen);

        int idx = 0;
        for (int i = 0; i < n; ++i) {
            float u_i = u + i / (float)n;
            while (u_i > cumsum[idx] && idx < n-1) idx++;
            new_particles[i] = particles[idx];
        }

        particles = immer::vector<float>(new_particles.begin(), new_particles.end());
        weights = immer::vector<float>(n, 1.0f / n);
        ess = 1.0f;
    }

    // Stats
    mu = 0.0f;
    frac = 0.0f;
    for (int i = 0; i < n; ++i) {
        mu += particles[i] * weights[i];
        if (particles[i] > 0) frac += weights[i];
    }
}

float ParticleFilter::get_mu() const { return mu; }
float ParticleFilter::get_frac() const { return frac; }
float ParticleFilter::get_ess() const { return ess; }
