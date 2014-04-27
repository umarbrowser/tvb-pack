#!/bin/sh

echo "updating all submodule origins to github user name $1"

sed -i s,https://github.com/the-virtual-brain,git@github.com:$1,g .gitmodules
