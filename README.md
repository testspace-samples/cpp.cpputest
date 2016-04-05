[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/CppUTest sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [CppUTest framework](https://cpputest.github.io).

***

[![Build Status](https://travis-ci.org/testspace-samples/cpp.cpputest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.cpputest)
[![Space Health](https://samples.testspace.com/projects/84/spaces/286/badge)](https://samples.testspace.com/projects/84/spaces/286 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/84/spaces/286/metrics/181/badge)](https://samples.testspace.com/projects/84/spaces/286/metrics#metric-181 "Line/Statement Coverage")

***

Build Examples provided by the CppUTest framework:

<pre>
cd cpputest/examples
make CPPUTEST_USE_GCOV=Y clean all_no_tests 
./CppUTestExamples_tests -o junit  -v
gcovr --root cpputest/examples --filter ".*examples.*" --exclude ".*AllTests.*" -x -o ${MYDIR}/coverage.xml
</pre>

Publish **`test results`** along with **`code coverage`**

<pre>
 testspace publish [Tests]cpputest_*.xml coverage.xml
</pre>

Checkout the [Space](https://samples.testspace.com/projects/cpp/spaces/cpputest). 

***

To fork this example using Travis requires:
  - Create an account at www.testspace.com
  - Travis Environment Variables:
    - `TESTSPACE_USER_TOKEN` set to the `value` defined as your [Access token](http://help.testspace.com/using-your-organization:user-settings).
    - `TESTSPACE_URL` set to `my-org-name.testspace.com/my-project/my-space`. Refer [here](http://help.testspace.com/reference:runner-reference#config) for more details. This example uses `samples.testspace.com/cpp/cpputest`.
  


