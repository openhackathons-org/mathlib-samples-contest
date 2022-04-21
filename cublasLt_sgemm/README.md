# cuBLASLt SGEMM Example

## Executive Summary

This example demonstrates how to use the cuBLASLt library to perform SGEMM. It is nearly a drop-in replacement for cublasSgemm. 
* It performs multiplications on input/output/compute types CUDA_R_32F.
* Computes the reference matrix, then performs matrix multiplication on the device, downloads the output matrix, and compares the answer.
* When ROW_MAJOR 1, the host reference output and cuBLASLt is calculate with row-major format. Otherwise, column-major format.

Note: This example computes a reference answer on the host side and can take awhile to process in N is large.

cuBLASLt is beneficial for users that need to add epligues to GEMM operations or need further customizations.

### Compile Instructions
```bash
nvcc -O3 -std=c++14 -lcublasLt cublasLt_sgemm.cu -o cublasLt_sgemm
```

### Hardware Dependencies
* This example has been tested with compute capability 6.0 and greater.

### Software Dependencies
* [cuBLASLt](https://docs.nvidia.com/cuda/cublas/index.html#using-the-cublasLt-api) (Requires CUDA Toolkit 10.1+)
* [Thrust](https://github.com/NVIDIA/thrust)
* C++ 11 (C++ 14 to remove Thrust warnings)

### APIs Used

#### CUDA Runtime
* [cudaMalloc](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__MEMORY.html#group__CUDART__MEMORY_1g37d37965bfb4803b6d4e59ff26856356)
* [cudaDeviceSynchronize](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g10e20b05a95f638a4071a655503df25d)
#### cuBLASLt
* [cublasLtCreate](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtCreate)
* [cublasLtMatmulDescCreate](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulDescCreate)
* [cublasLtMatmulDescSetAttribute](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulDescSetAttribute)
* [cublasLtMatrixLayoutCreate](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatrixLayoutCreate)
* [cublasLtMatrixLayoutSetAttribute](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatrixLayoutSetAttribute)
* [cublasLtMatmulPreferenceCreate](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulPreferenceCreate)
* [cublasLtMatmulPreferenceSetAttribute](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulPreferenceSetAttribute)
* [cublasLtMatmulAlgoGetHeuristic](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulAlgoGetHeuristic)
* [cublasLtMatmul](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmul)
* [cublasLtMatmulPreferenceDestroy](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulPreferenceDestroy)
* [cublasLtMatrixLayoutDestroy](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatrixLayoutDestroy)
* [cublasLtMatmulDescDestroy](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtMatmulDescDestroy)
* [cublasLtDestroy](https://docs.nvidia.com/cuda/cublas/index.html#cublasLtdestroy)

### Usage
```bash
./cublasLt_sgemm

cuBLASLt 1024x1024x1024 test running..
cuBLASLt SGEMM test passed.
```