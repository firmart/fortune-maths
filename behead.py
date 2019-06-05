#!/usr/bin/env python3

"""
Pandoc filter to convert all level 2+ headers to paragraphs with
emphasized text.
"""

from pandocfilters import *
from colorama import Fore, Back, Style

def behead(key, value, format, meta):
  if key == 'Header' and value[0] == 1:
    return Plain([Str(Fore.BLUE + Style.BRIGHT)] + value[2] + [Str(Style.RESET_ALL)])
  if key == 'Strong':
    return [Str(Style.BRIGHT + Fore.RED)] + value + [Str(Style.RESET_ALL)]

if __name__ == "__main__":
  toJSONFilter(behead)
