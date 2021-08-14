#!/bin/bash

function init_test() {
    mkdir -p test/var/config
    mkdir -p test/home/randusername
}

function clean() {
    rm -rf test/
}

function run() {
    ../config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --create 
    ../config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --save_stat

    test -s test/var/config/dummy_package/stats.ini && echo "Test Passed" || echo "Test Failed"
}
