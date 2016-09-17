[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/CppUTest sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [CppUTest framework](https://cpputest.github.io).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/cpp.cpputest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.cpputest)
[![Run Status](https://api.shippable.com/projects/56ffcaa09d043da07b0991f0/badge?branch=master)](https://app.shippable.com/projects/56ffcaa09d043da07b0991f0)

***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/121/spaces/449/badge)](https://samples.testspace.com/projects/121/spaces/449 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/121/spaces/449/metrics/285/badge)](https://samples.testspace.com/spaces/449/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/projects/121/spaces/449/metrics/284/badge)](https://samples.testspace.com/spaces/449/schema/Code%20Coverage "Code Coverage (branches)")


***

Build Examples provided by the CppUTest framework:

<pre>
cd cpputest/examples
make CPPUTEST_USE_GCOV=Y clean all_no_tests 
./CppUTestExamples_tests -o junit  -v
gcovr --root ../.. --filter ".*examples.*" --exclude ".*AllTests.*" -x -o coverage.xml
</pre>

Publish **`test results`** along with **`code coverage`**

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace [Tests]cpputest_*.xml coverage.xml $TESTSPACE_TOKEN/$BRANCH_NAME
</pre>

Checkout the [Space](https://samples.testspace.com/projects/cpp.cpputest). 

***

To replicate this sample: 
  - Account at www.testspace.com.
  - CI Environment Variable called **TESTSPACE_TOKEN** required:
    -  `TESTSPACE_TOKEN` = `credentials@my-org-name.testspace.com/my-project`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project` based on your *subdomain* and *project* names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details. 
  