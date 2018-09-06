#exploration.R: tests nested functions in a simple multiplication of list using lapply
#----------------------------------------------------------------------------------------------------
library(RUnit)
#----------------------------------------------------------------------------------------------------
timesTen <- function(list)
{
    doIT <- function(x){
        return(x*10)
        }

    vector <- unlist(lapply(list, doIT))

    return(vector)

} # timesTen
#----------------------------------------------------------------------------------------------------
runTests <- function()
{
    test_timesTen()
    test_timesTen_lst2()
    test_timesTen_lst3()
}
#----------------------------------------------------------------------------------------------------
test_timesTen <- function()
{
    print("--- test_timesTen")

    expected.results <- c(10,20,30,40,50)
    result <- timesTen(1:5)

    checkEquals(result, expected.results)

} # test_timesTen
#----------------------------------------------------------------------------------------------------
test_timesTen_lst2<- function()
{
    print("--- test_timesTen_lst2")

    expected.results <- c(100,70,80,2000,50)
    result <- timesTen(c(10, 7, 8, 200, 5))

    checkEquals(result, expected.results)

} # test_timesTen_lst2
#----------------------------------------------------------------------------------------------------
test_timesTen_lst3<- function()
{
    print("--- test_timesTen_lst3")

    expected.results <- c(0)
    result <- timesTen(0)

    checkEquals(result, expected.results)

} # test_timesTen_lst3
#----------------------------------------------------------------------------------------------------
