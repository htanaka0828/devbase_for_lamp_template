#!/bin/bash

pushd .
cd ../lib/rdb/
./all.sh
cd ../sample_web/
./all.sh
cd ../nginx/
./all.sh
popd
