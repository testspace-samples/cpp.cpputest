#!/bin/bash

# System prerequisites 
sudo apt-get install wget unzip python make g++
sudo apt-get install automake autoconf libtool
sudo pip install gcovr 

# Download framework
rm -rf cpputest
wget --no-check-certificate -O cpputest-3.7.1.zip https://github.com/cpputest/cpputest.github.io/blob/master/releases/cpputest-3.7.1.zip?raw=true
unzip cpputest-3.7.1.zip
mv cpputest-3.7.1 cpputest
rm cpputest-3.7.1.zip

# Build (i) library (ii) examples
cd cpputest/cpputest_build
autoreconf .. -i
../configure
make
cp -R ./lib ../

cd ../examples
make CPPUTEST_USE_GCOV=Y clean all_no_tests 

# Analysis


# Test
rm -rf cpputest_*.xml
./CppUTestExamples_tests -o junit -v
gcovr --root ../.. --filter ".*examples.*" --exclude ".*AllTests.*" -x -o coverage.xml


# Publish
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace [Tests]cpputest_*.xml coverage.xml master.c9