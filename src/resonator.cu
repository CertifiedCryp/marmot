#include "resonator.h"
#include <cuda_runtime.h>
#include <cufft.h>
#include <vector>
#include <cmath>

__global__ void resonance_kernel(float* data, float* power, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n / 2) {
        float real = data[2 * idx];
        float imag = data[2 * idx + 1];
        power[idx] = real * real + imag * imag;
    }
}

void Resonator::compute_harmonic_resonance(const std::vector<float>& spreads) {
    int n = spreads.size();
    if (n == 0) return;

    // Pad to power of 2
    int fft_size = 1;
    while (fft_size < n) fft_size *= 2;

    std::vector<float> padded(fft_size * 2, 0.0f);
    for (int i = 0; i < n; ++i) {
        padded[2 * i] = spreads[i];
    }

    cufftComplex* d_data;
    cudaMalloc(&d_data, fft_size * sizeof(cufftComplex));
    cudaMemcpy(d_data, padded.data(), fft_size * sizeof(cufftComplex), cudaMemcpyHostToDevice);

    cufftHandle plan;
    cufftPlan1d(&plan, fft_size, CUFFT_C2C, 1);
    cufftExecC2C(plan, d_data, d_data, CUFFT_FORWARD);

    float* d_power;
    cudaMalloc(&d_power, (fft_size / 2) * sizeof(float));
    resonance_kernel<<<(fft_size / 2 + 255) / 256, 256>>>( (float*)d_data, d_power, fft_size);

    std::vector<float> power(fft_size / 2);
    cudaMemcpy(power.data(), d_power, (fft_size / 2) * sizeof(float), cudaMemcpyDeviceToHost);

    // Find fundamental + harmonic strength
    float total = 0.0f, fundamental = 0.0f;
    for (int i = 0; i < fft_size / 2; ++i) total += power[i];
    for (int i = 1; i < 6 && i < fft_size / 2; ++i) fundamental += power[i];

    resonance = (total > 1e-8f) ? (fundamental / total) : 0.0f;

    cufftDestroy(plan);
    cudaFree(d_data);
    cudaFree(d_power);
}

float Resonator::get_resonance() const { return resonance; }
