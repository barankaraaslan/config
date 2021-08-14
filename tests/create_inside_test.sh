#!/bin/bash

function init_test() {
    mkdir -p env/var/config
    mkdir -p env/home/randusername
}

function clean() {
    rm -rf env/

    rm -rf env/home/randusername/dummy_package
    rm -rf env/var/config/dummy_package

    rm -rf env/cloned
}

function run() {
    ../config dummy_package --work_tree=env/ --config_home=env/home/randusername --stat_home=env/var/config --create 
    ../config dummy_package --work_tree=env/ --config_home=env/home/randusername --stat_home=env/var/config --inside clone . `pwd`/env/cloned

    test -f env/cloned/var/config/dummy_package/stats.ini && echo "Test Passed" || echo "Test Failed"

}
