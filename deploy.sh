#!/bin/sh

./apply.sh > ~/.config/chest/programs.jsonnet
~/bld/go-jsonnet/jsonnet chest/apply-values.jsonnet -c  -S -m /
