#!/usr/bin/env python

# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    '-Wall',
    '-Wextra',
    '-Wno-char-subscripts',
    '-Wformat=2',
    '-Wfloat-equal',
    '-Dmoskupols',
    '-std=gnu++14',
    '-x',
    '-c++',
]

def FlagsForFile( filename, **kwargs ):
    return {
        'flags': flags,
        'do_cache': True
    }
