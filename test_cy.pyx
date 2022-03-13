cimport numpy
import numpy as np

def npsum(n):
    x  = np.array([0,0,0,0,0])
    for i in range(n):
        x  += np.array([1,1,1,1,1])
    return x

def fibon_py(n):
    a = b = 1
    result = []
    for i in range(n):
        result.append(a)
        a, b = b, a + b
    return result

cpdef fibon(int n):
    cdef int a = 1
    cdef int b = 1
    result = []
    for i in range(n):
        result.append(a)
        a, b = b, a + b
    return result