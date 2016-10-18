library('RUnit')

source("bin/common_functions.R")

test.suite <- defineTestSuite("example",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

sink("results/Unit_test_results.txt")
test.result <- runTestSuite(test.suite)
printTextProtocol(test.result)
sink()



