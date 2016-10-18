

test.calc_spread_as_expected <- function()
{
library(testthat)  
library(RUnit)
  test_that("Test if function calculate the difference between col1 and col2 and returns just one row which has least diff",
            {
              
            testcols<-c("colno", "col1","col2")
            
            expectedcols <- c("colno", "col1","col2","spread")
  
            testdf=data.frame(c(1:3),c(1,2,3),c(3,2,1))
            expected=data.frame(list(1,1,3,-2))
            colnames(testdf) <- testcols
            colnames(expected) <- expectedcols
            
            Actual<-spread(testdf,"col1","col2")
            Actual <- as.data.frame(Actual)
            
            result<-checkEquals(Actual,expected)
            if(!result){print("Fail")}
            }   ) 
}

test.Fail_when_NULL <- function()
{
  
  testcols<-c("colno", "col1","col2")
  testdf=data.frame(c(1:3),c(1,2,3),c(3,2,1))
  colnames(testdf) <- testcols
  
  test_that("Fails when Null parameter is passed",
  checkException(spread(testdf,"",""),silent=TRUE)
  )
}


test.Fail_Incorrect_Param <- function()
{
  
  testcols<-c("colno", "col1","col2")
  testdf=data.frame(c(1:3),c(1,2,3),c(3,2,1))
  colnames(testdf) <- testcols
test_that("Fails when wrong parameter is passed",
          checkException(spread(testdf,"col1","xx"),silent = TRUE)
)

}

test.exception_when_Param_is_Num <- function()
{
  
  testcols<-c("colno", "col1","col2")
  testdf=data.frame(c(1:3),c(1,2,3),c(3,2,1))
  colnames(testdf) <- testcols
test_that("Exception when Numeric parameter is passed",
          {
            results <- capture.output(spread(testdf,1,"col2"))
            print(results)
          checkIdentical(results[[1]],"Argument cannot be a number")
  
          }
)
}

test.load_file <- function()
{
  
  fn= "test.txt"
  colnames= "test"
  checkException(loadfile(fn,test),silent = TRUE)
}