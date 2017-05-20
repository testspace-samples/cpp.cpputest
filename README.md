[![Testspace](https://www.testspace.com/img/Testspace.png)](https://www.testspace.com)

***

## C++/CppUTest sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [CppUTest framework](https://cpputest.github.io): 
  * Using a Testspace Project that is `connected` with this GitHub Repo
  * Using 3 Online CI services for demonstration purposes only
  * Can review the Results at [testspace-samples:cpp.cpputest](https://samples.testspace.com/projects/testspace-samples:cpp.cpputest)  
  * Refer to our [Getting Started](https://help.testspace.com/getting-started) help articles for more information

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/cpp.cpputest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.cpputest)
[![CircleCI](https://circleci.com/gh/testspace-samples/cpp.cpputest.svg?style=svg)](https://circleci.com/gh/testspace-samples/cpp.cpputest)
[![Run Status](https://api.shippable.com/projects/56ffcaa09d043da07b0991f0/badge?branch=master)](https://app.shippable.com/projects/56ffcaa09d043da07b0991f0)

***
Publishing Results using www.testspace.com.

[![Space Health](https://samples.testspace.com/spaces/829/badge?token=623ebd46c0696b0d7ef47baee4e01be2834fa1ab)](https://samples.testspace.com/spaces/829 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/829/metrics/822/badge?token=a41267220195fefd74c9b41670de90d08ee8b7f2)](https://samples.testspace.com/spaces/829/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/spaces/829/metrics/820/badge?token=fa04ef73f740f3a71306a5d715dea7db81d4f279)](https://samples.testspace.com/spaces/829/schema/Static%20Analysis "Static Analysis (issues)")



***

Download and configure the Testspace client 

<pre>
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | tar -zxvf- -C $HOME/bin
testspace config url samples.testspace.com
</pre>

Build Examples provided by the CppUTest framework

<pre>
make -C $CPPUTEST_HOME/examples CPPUTEST_USE_GCOV=Y clean all_no_tests |& tee build.log ; test ${PIPESTATUS[0]} -eq 0
$CPPUTEST_HOME/examples/CppUTestExamples_tests -o junit  -v
gcovr --root ./ --filter ".*examples/ApplicationLib/.*" -x -o coverage.xml
</pre>

Push Content using Testspace client 

<pre>
testspace build.log{lint} [Tests]cpputest_*.xml coverage.xml
</pre> 




