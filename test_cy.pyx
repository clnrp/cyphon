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