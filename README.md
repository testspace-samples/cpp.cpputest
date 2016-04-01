[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/CppUTest sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [CppUTest framework](https://cpputest.github.io).

***

[![Build Status](https://travis-ci.org/testspace-samples/cpp.cpputest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.cpputest)
[![Space Health](http://munderseth.stridespace.com/projects/262/spaces/805/badge)](http://munderseth.stridespace.com/projects/262/spaces/805 "Test Cases")
[![Space Metric](http://munderseth.stridespace.com/projects/262/spaces/805/metrics/159/badge)](http://munderseth.stridespace.com/projects/262/spaces/805/metrics#metric-159 "Line/Statement Coverage")


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

Checkout the [sample](http://munderseth.stridespace.com/projects/cpp/spaces/cpputest.example). 

***

To fork this example using Travis requires:
  - Account at www.testspace.com (use `Open`)
  - Travis Environment Variables:
    - The `TESTSPACE_USER_TOKEN` *Name* is set to the *Value* defined as your [Access token](http://help.testspace.com/using-your-organization:user-settings).
    - The `TESTSPACE_URL` *Name* is set to `my-org-name.testspace.com/my-project/my-space`. Refer [here](http://help.testspace.com/reference:runner-reference#config) for more details. This example uses `samples.testspace.com/cpp/cpputest.example`.
  


