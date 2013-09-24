#!/bin/bash
set -e
set -x
sudo apt-get update && sudo apt-get install -y git libxml2-dev libxslt1-dev libpq-dev python-pip libsqlite3-dev && sudo apt-get -y build-dep python-mysqldb
cd ~
git clone git://github.com/openstack-dev/devstack.git && cd devstack
mv samples/localrc .
