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

# Push content

## Requires TESTSPACE_TOKEN = $ACCESS_TOKEN:@samples.testspace.com. 

BRANCH_NAME=`git symbolic-ref --short HEAD`
GIT_URL=`git remote show origin -n | grep Fetch\ URL: | sed 's/.*URL: //'`
REPO_SLUG=`echo ${GIT_URL#*github.com?} | sed 's/.git//'`

curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/${REPO_SLUG/\//:}/${BRANCH_NAME}#c9.Build

