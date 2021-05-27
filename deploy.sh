#!/bin/sh

./apply.sh > chest/programs.jsonnet
~/bld/go-jsonnet/jsonnet chest/apply-values.jsonnet -c  -S -m /
