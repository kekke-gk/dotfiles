#!/usr/bin/python

from subprocess import call

YAOURT = 'yaourt --noconfirm -Syy '

def is_pkg_name(s):
    return not(s == '' or s == '\n' or s[0] == '#')

f = open('./archPkgList.md', 'r')
lines = f.readlines()
f.close()

pkg_names = [pkg_name.strip() for pkg_name in filter(is_pkg_name, lines)]

cmd = YAOURT + ' '.join(pkg_names)

call(cmd, shell=True)
