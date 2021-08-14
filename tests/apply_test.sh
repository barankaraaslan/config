#!/bin/bash

function init_test() {
    mkdir -p env/var/config
    mkdir -p env/home/randusername
}

function clean() {
    rm -rf env/
}

function run() {
    ../config dummy_package --work_tree=env/ --config_home=env/home/randusername --stat_home=env/var/config --create 
    ../config dummy_package --work_tree=env/ --config_home=env/home/randusername --stat_home=env/var/config --save_stat

    prev_mod=$(stat -c "%a" env/var/config/dummy_package/stats.ini)
    chmod g+w env/var/config/dummy_package/stats.ini

    ../config dummy_package --work_tree=env/ --config_home=env/home/randusername --stat_home=env/var/config --apply_stat

    test $(stat -c "%a" env/var/config/dummy_package/stats.ini) = $prev_mod  && echo "Test Passed" || echo "Test Failed"
}
