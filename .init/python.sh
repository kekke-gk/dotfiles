#!/usr/bin/sh

pkg_names=( numpy scipy matplotlib ipython )
cmd="pip install ""$(IFS=" " ; echo "${pkg_names[*]}")"
eval $cmd
