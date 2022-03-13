from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules = cythonize('test_cy.pyx'))

# python setup.py build_ext --inplace
# /usr/bin/python3.8 setup.py build_ext --inplace