#!/bin/bash
rm -rf test/
mkdir -p test/var/config
mkdir -p test/home/randusername

rm -rf test/home/randusername/dummy_package
rm -rf test/var/config/dummy_package
./config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --create 

rm -rf test/cloned
./config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --inside clone . `pwd`/test/cloned