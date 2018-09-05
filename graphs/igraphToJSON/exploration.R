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
}
#----------------------------------------------------------------------------------------------------
test_timesTen <- function()
{
    printf("--- test_timesTen")

    expected.results <- c(10,20,30,40,50)
    result <- timesTen(1:5)

    checkEquals(result, expected.results)
} # tests times 10
#----------------------------------------------------------------------------------------------------
