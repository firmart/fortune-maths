#!/usr/bin/env python3

"""
Pandoc filter to convert latex file to native ansi-escaped colored text
to print on terminal.
"""

from pandocfilters import *
from colorama import Fore, Back, Style

ITALIC = '\x1b[3m'

def ascii(key, value, format, meta):
  if key == 'Header' and value[0] >= 1:
    return Plain([Str(Fore.BLUE + Style.BRIGHT)] + value[2] + [Str(Style.RESET_ALL)])
  elif key == 'Strong':
    return [Str(Style.BRIGHT + Fore.RED)] + value + [Str(Style.RESET_ALL)]
  elif key == 'Code':
    return Str(ITALIC + Fore.YELLOW + value[1] + Style.RESET_ALL)


if __name__ == "__main__":
  toJSONFilter(ascii)
