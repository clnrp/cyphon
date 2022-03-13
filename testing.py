import timeit
import test
import test_cy

tpy = timeit.timeit('''test.fibon(5000)''',setup='import test',number=100)
tcy0 = timeit.timeit('''test_cy.fibon(5000)''',setup='import test_cy', number=100)
tcy1 = timeit.timeit('''test_cy.fibon_py(5000)''',setup='import test_cy', number=100)
print(tpy, tcy0, tcy1)