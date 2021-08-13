#!/bin/bash

sudo mkdir -p -m 777 /var/config

rm -rf ~/dummy_package
rm -rf /var/config/dummy_package
./config dummy_package --create

rm -rf test/
./config dummy_package --inside clone . `pwd`/test/