#!/bin/bash

source $1

echo 'initializing'
init_test
echo 'running'
run
echo 'cleaning'
clean