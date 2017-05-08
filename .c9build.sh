#!/bin/bash

# System prerequisites 
#sudo apt-get install wget unzip python make g++
#sudo apt-get install automake autoconf libtool
sudo pip install gcovr 

# Download framework
CPPUTEST_HOME=$PWD/cpputest-3.8
rm -rf $CPPUTEST_HOME
wget https://github.com/cpputest/cpputest/releases/download/v3.8/cpputest-3.8.zip
unzip cpputest-3.8.zip
rm cpputest-3.8.zip

# Build library
pushd $CPPUTEST_HOME/cpputest_build
autoreconf .. -i
../configure
make SILENCE=@
cp -R ./lib ../
popd

# Build examples
rm -f build.log
# (i) building with coverage (ii) preserving STDOUT while saving to a log file (iii) preserving the original exit code
make -C $CPPUTEST_HOME/examples CPPUTEST_USE_GCOV=Y clean all_no_tests |& tee build.log ; test ${PIPESTATUS[0]} -eq 0

# Analysis
# using the build.log

# Test
rm -f cpputest_*.xml
$CPPUTEST_HOME/examples/CppUTestExamples_tests -o junit -v
rm -f coverage.xml
gcovr --root ./ --filter ".*/ApplicationLib/.*" -x -o coverage.xml

# Download and configure the Testspace client
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin
CI=true testspace config url samples.testspace.com
testspace -v

# Push content

testspace build.log{issues} [Tests]cpputest_*.xml coverage.xml 

