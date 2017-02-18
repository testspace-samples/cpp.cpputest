[![Testspace](http://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

***

## C++/CppUTest sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [CppUTest framework](https://cpputest.github.io).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/cpp.cpputest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.cpputest)
[![CircleCI](https://circleci.com/gh/testspace-samples/cpp.cpputest.svg?style=svg)](https://circleci.com/gh/testspace-samples/cpp.cpputest)
[![Run Status](https://api.shippable.com/projects/56ffcaa09d043da07b0991f0/badge?branch=master)](https://app.shippable.com/projects/56ffcaa09d043da07b0991f0)

***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/spaces/829/badge)](https://samples.testspace.com/spaces/829 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/829/metrics/820/badge)](https://samples.testspace.com/spaces/829/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/spaces/829/metrics/820/badge)](https://samples.testspace.com/spaces/829/schema/Static%20Analysis "Static Analysis (issues)")

***

Build Examples provided by the CppUTest framework:

<pre>
make -C $CPPUTEST_HOME/examples CPPUTEST_USE_GCOV=Y clean all_no_tests |& tee build.log ; test ${PIPESTATUS[0]} -eq 0
$CPPUTEST_HOME/examples/CppUTestExamples_tests -o junit  -v
gcovr --root ./ --filter ".*examples/ApplicationLib/.*" -x -o coverage.xml
</pre>

Push Content using **Testspace client**: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/$GITHUB_ORG:$REPO_NAME/$BRANCH_NAME#$BUILD_NUMBER
</pre> 

Checkout the published [Test Content](https://samples.testspace.com/projects/testspace-samples:cpp.cpputest). Note that the `.testspace.txt` file contains the [set of files](http://help.testspace.com/how-to:publish-content#publishing-via-content-list-file) to publish. 

***

To replicate this sample: 
  - Setup account at www.testspace.com.
  - Create a Environment variable called `TESTSPACE_TOKEN`
     - `TESTSPACE_TOKEN` = `credentials@Your-Org-Name.testspace.com`
     - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials)
     - To [use Testspace with a CI system](http://help.testspace.com/how-to:add-to-ci-workflow), store `TESTSPACE_TOKEN` as a secure environment variable
 
