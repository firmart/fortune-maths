#!/usr/bin/python3
'''
Convert "tex" files into "dat" files for fortune.
This script requires python3 >= 3.6
Copyright (C) 2018 Mo Zhou <cdluminate@gmail.com>
'''
from typing import *
import glob
import os


def delComment(lines: List[str], result: List[str], state: bool = False) -> List[str]:
    '''
    delete comments from the given list. Note, it only deletes the
    first consecutive lines which starts with % . Any line starts with %
    after that won't be changed.
    '''
    if not lines:
        return result
    else:
        if not state:
            if lines[0].startswith('%'):
                return delComment(lines[1:], result, False)
            else:
                return delComment(lines[1:], result + [lines[0]], True)
        else:
            return delComment(lines[1:], result + [lines[0]], True)


def tex2dat(src: str) -> None:
    '''
    Read "tex" and do preprocessing. :src: refers to source file path.
    '''
    dest = src.replace('.tex', '.dat')
    with open(src, 'r') as fsrc, open(dest, 'w') as fdest:
        fdest.writelines([os.path.basename(src).replace('.tex', '') +'\n']+ delComment(fsrc.readlines(), [], False) + ['%\n'])
    print(f'{__file__}: Converted {src} -> {dest}')


if __name__ == '__main__':

    texs = glob.glob('./**/**.thm.*.tex', recursive=True)
    print(f'{__file__}: Found {len(texs)} tex files')
    for tex in texs:
        tex2dat(tex)
