#!/bin/bash

cd=$(pwd)

for d in  tvb-library tvb-framework tvb-data tvb-documentation;
do
	export PYTHONPATH=$cd/$d:$PYTHONPATH
done

source $1/bin/activate

