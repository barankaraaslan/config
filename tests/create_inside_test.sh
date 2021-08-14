#!/bin/bash

function init_test() {
    mkdir -p test/var/config
    mkdir -p test/home/randusername
}

function clean() {
    rm -rf test/

    rm -rf test/home/randusername/dummy_package
    rm -rf test/var/config/dummy_package

    rm -rf test/cloned
}

function run() {
    ../config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --create 
    ../config dummy_package --work_tree=test/ --config_home=test/home/randusername --stat_home=test/var/config --inside clone . `pwd`/test/cloned

    test -f test/cloned/var/config/dummy_package/stats.ini && echo "Test Passed" || echo "Test Failed"

}
