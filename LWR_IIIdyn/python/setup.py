from distutils.core import setup, Extension

import os
import glob

import sys
from Cython.Distutils import build_ext


if __name__ == "__main__":
	setup(
            cmdclass = {'build_ext': build_ext},
            name='LWR_IIIdyn',
            version='1.0',
            description='LWR_IIIdyn',
            ext_modules=[
                Extension(
                    "LWR_IIIdyn",
                    language="c",
                    sources=["LWR_IIIdyn.pyx",
			     "../src_gen/lbrTransformations.c", 
			     "../src_gen/lbrBodyJacobians.c",
			     "../src_gen/lbrZeroJacobians.c",],
                    extra_compile_args=[
					"-I/usr/lib/python2.6/site-packages/numpy/core/include",
                                        "-I../include"
                        ],

                    )
                ])


