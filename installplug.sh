#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)

read -p "module name: " name 
git clone --depth 1 https://github.com/$name $script_dir/pack/plugins/start/$name

