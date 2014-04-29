#!/bin/bash

cd=$(pwd)

for d in geodesic library framework data extra;
do
	export PYTHONPATH=$cd/$d:$PYTHONPATH
done

source $1/bin/activate

