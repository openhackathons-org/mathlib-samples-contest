/* Includes, system */
#include <cstdio>

/* Includes, cuda & thrust */
#include <cublasLt.h>
#include <thrust/device_vector.h>
#include <thrust/host_vector.h>

// *************** FOR ERROR CHECKING *******************
#ifndef CUDA_RT_CALL
#define CUDA_RT_CALL(call)                                                                         \
    do {                                                                                           \
        cudaError_t err_ = (call);                                                                 \
        if (err_ != cudaSuccess) {                                                                 \
            std::printf("CUDA RT Error %d at %s:%d\n", err_, __FILE__, __LINE__);                  \
            throw std::runtime_error("CUDA RT Error");                                             \
        }                                                                                          \
    } while (0)
#endif // CUDA_RT_CALL

#ifndef CUBLAS_CALL
#define CUBLAS_CALL(call)                                                                          \
    do {                                                                                           \
        cublasStatus_t err_ = (call);                                                              \
        if (err_ != CUBLAS_STATUS_SUCCESS) {                                                       \
            std::printf("CUBLAS Error %d at %s:%d\n", err_, __FILE__, __LINE__);                   \
            throw std::runtime_error("CUBLAS Error");                                              \
        }                                                                                          \
    } while (0)
#endif // CUBLAS_CALL
// *************** FOR ERROR CHECKING *******************

#define ROW_MAJOR 1

/* Host implementation of a simple version of sgemm */
void simple_sgemm(int const &m, int const &n, int const &k, float const &alpha, float const *A,
                  float const *B, float const &beta, float *C) {

    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            float prod = 0;

            for (int l = 0; l < k; ++l) {
#if ROW_MAJOR
                prod += A[l + i * k] * B[j + l * n];
#else
                prod += A[l * m + i] * B[j * k + l];
#endif
            }
#if ROW_MAJOR
            C[j + i * m] = alpha * prod + beta * C[j + i * m];
#else
            C[j * m + i] = alpha * prod + beta * C[j * m + i];
#endif
        }
    }
}

void LtSgemm(cublasLtHandle_t ltHandle, cublasOperation_t transa, cublasOperation_t transb,
             int const &m, int const &n, int const &k, float const *alpha, float const *A,
             int const &lda, float const *B, int const &ldb, float const *beta, float *C,
             int const &ldc, void *workspace, size_t workspaceSize) {

    cublasLtMatmulDesc_t operationDesc = nullptr;
    cublasLtMatrixLayout_t Adesc = nullptr, Bdesc = nullptr, Cdesc = nullptr;
    cublasLtMatmulPreference_t preference = nullptr;

    int returnedResults = 0;
    cublasLtMatmulHeuristicResult_t heuristicResult = {};

#if ROW_MAJOR
    cublasLtOrder_t rowOrder = CUBLASLT_ORDER_ROW;
#endif

    // Create operation descriptor; see cublasLtMatmulDescAttributes_t
    // for details about defaults; here we just set the transforms for
    // A and B.
    CUBLAS_CALL(cublasLtMatmulDescCreate(&operationDesc, CUBLAS_COMPUTE_32F, CUDA_R_32F));
    CUBLAS_CALL(cublasLtMatmulDescSetAttribute(operationDesc, CUBLASLT_MATMUL_DESC_TRANSA, &transa,
                                               sizeof(transa)));
    CUBLAS_CALL(cublasLtMatmulDescSetAttribute(operationDesc, CUBLASLT_MATMUL_DESC_TRANSB, &transb,
                                               sizeof(transa)));

    // Create matrix descriptors. Not setting any extra attributes.
    CUBLAS_CALL(cublasLtMatrixLayoutCreate(&Adesc, CUDA_R_32F, transa == CUBLAS_OP_N ? m : k,
                                           transa == CUBLAS_OP_N ? k : m, lda));
    CUBLAS_CALL(cublasLtMatrixLayoutCreate(&Bdesc, CUDA_R_32F, transb == CUBLAS_OP_N ? k : n,
                                           transb == CUBLAS_OP_N ? n : k, ldb));
    CUBLAS_CALL(cublasLtMatrixLayoutCreate(&Cdesc, CUDA_R_32F, m, n, ldc));

#if ROW_MAJOR
    CUBLAS_CALL(cublasLtMatrixLayoutSetAttribute(Adesc, CUBLASLT_MATRIX_LAYOUT_ORDER, &rowOrder,
                                                 sizeof(rowOrder)));
    CUBLAS_CALL(cublasLtMatrixLayoutSetAttribute(Bdesc, CUBLASLT_MATRIX_LAYOUT_ORDER, &rowOrder,
                                                 sizeof(rowOrder)));
    CUBLAS_CALL(cublasLtMatrixLayoutSetAttribute(Cdesc, CUBLASLT_MATRIX_LAYOUT_ORDER, &rowOrder,
                                                 sizeof(rowOrder)));
#endif

    // Create preference handle; In general, extra attributes can be
    // used here to disable tensor ops or to make sure algo selected
    // will work with badly aligned A, B, C. However, for simplicity
    // here we assume A,B,C are always well aligned (e.g., directly
    // come from cudaMalloc)
    CUBLAS_CALL(cublasLtMatmulPreferenceCreate(&preference));
    CUBLAS_CALL(cublasLtMatmulPreferenceSetAttribute(preference,
                                                     CUBLASLT_MATMUL_PREF_MAX_WORKSPACE_BYTES,
                                                     &workspaceSize, sizeof(workspaceSize)));

    // We just need the best available heuristic to try and run matmul.
    // There is no guarantee that this will work. For example, if A is
    // badly aligned, you can request more (e.g. 32) algos and try to
    // run them one by one until something works.
    CUBLAS_CALL(cublasLtMatmulAlgoGetHeuristic(ltHandle, operationDesc, Adesc, Bdesc, Cdesc, Cdesc,
                                               preference, 1, &heuristicResult, &returnedResults));

    if (returnedResults == 0)
        throw std::runtime_error("!!!! Unable to find any suitable algorithms");

    CUBLAS_CALL(cublasLtMatmul(ltHandle, operationDesc, alpha, A, Adesc, B, Bdesc, beta, C, Cdesc,
                               C, Cdesc, &heuristicResult.algo, workspace, workspaceSize, 0));

    // Descriptors are no longer needed as all GPU work was already
    // enqueued.
    CUBLAS_CALL(cublasLtMatmulPreferenceDestroy(preference));
    CUBLAS_CALL(cublasLtMatrixLayoutDestroy(Cdesc));
    CUBLAS_CALL(cublasLtMatrixLayoutDestroy(Bdesc));
    CUBLAS_CALL(cublasLtMatrixLayoutDestroy(Adesc));
    CUBLAS_CALL(cublasLtMatmulDescDestroy(operationDesc));
}

void calculate(int const &m, int const &n, int const &k) {

    float alpha = 1.0f, beta = 0.0f;
    int lda = k, ldb = n, ldc = n;
    void *d_workspace = nullptr;

    size_t sizeA = m * k;
    size_t sizeB = k * n;
    size_t sizeC = m * n;
    size_t workspaceSize = 4096;

    float error_norm = 0.0f;
    float ref_norm = 0.0f;
    float diff = 0.0f;

    cublasLtHandle_t handle;

    /* Initialize cuBLASLt */
    CUBLAS_CALL(cublasLtCreate(&handle));

    /* Allocate device memory for workspace */
    CUDA_RT_CALL(cudaMalloc((void **)&d_workspace, workspaceSize));

    /* Initialize CUBLAS */
    printf("cuBLASLt %dx%dx%d test running..\n", m, n, k);

    /* Allocate host memory for the matrices */
    thrust::host_vector<float> h_A(sizeA, 0.0f);
    thrust::host_vector<float> h_B(sizeB, 0.0f);
    thrust::host_vector<float> h_C(sizeC, 0.0f);
    thrust::host_vector<float> h_C_ref(sizeC, 0.0f);

    /* Fill the matrices with test data */
    /* Assume square matrices */
    for (int i = 0; i < m * m; i++) {
        h_A[i] = rand() / static_cast<float>(RAND_MAX);
        h_B[i] = rand() / static_cast<float>(RAND_MAX);
    }

    /* Allocate device memory for the matrices */
    thrust::device_vector<float> d_A(h_A);
    thrust::device_vector<float> d_B(h_B);
    thrust::device_vector<float> d_C(sizeC, 0.0f);

    /* Retrieve raw pointer for device data */
    float *d_A_ptr = thrust::raw_pointer_cast(&d_A[0]);
    float *d_B_ptr = thrust::raw_pointer_cast(&d_B[0]);
    float *d_C_ptr = thrust::raw_pointer_cast(&d_C[0]);

    /* Performs operation using plain C code */
    simple_sgemm(m, n, k, alpha, h_A.data(), h_B.data(), beta, h_C_ref.data());

    LtSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, &alpha, d_A_ptr, lda, d_B_ptr, ldb, &beta,
            d_C_ptr, ldc, d_workspace, workspaceSize);

    CUDA_RT_CALL(cudaDeviceSynchronize());

    /* Allocate host memory for reading back the result from device memory */
    h_C = d_C;

    /* Check result against reference */
    for (int i = 0; i < m * m; i++) {
        diff = h_C_ref[i] - h_C[i];
        error_norm += diff * diff;
        ref_norm += h_C_ref[i] * h_C_ref[i];
    }

    error_norm = static_cast<float>(sqrt(static_cast<double>(error_norm)));
    ref_norm = static_cast<float>(sqrt(static_cast<double>(ref_norm)));

    if (fabs(ref_norm) < 1e-7)
        throw std::runtime_error("!!!! reference norm is 0\n");

    /* Shutdown */
    CUBLAS_CALL(cublasLtDestroy(handle));

    if (error_norm / ref_norm < 1e-4f)
        printf("cuBLASLt SGEMM test passed.\n");
    else
        throw std::runtime_error("!!!! cuBLASLt SGEMM test failed.\n");
}

/* Main */
int main(int argc, char **argv) {

    // Compute square matrices
    calculate(1024, 1024, 1024);

    return (EXIT_SUCCESS);
}