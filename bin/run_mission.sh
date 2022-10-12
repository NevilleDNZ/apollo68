#!/bin/sh
opt=""
#opt="--backtrace"
while [ "$1" ]; do
  case "$1" in 
    (-*)opt="$opt $1"; echo OPT=$1 1>&2; shift;;
    (*) break;;
  esac
done
algol68g-full $opt apollo68.a68 -- "$@"
