                                        # reverseString.R
#------------------------------------------------------------------------------
library(RUnit)
#------------------------------------------------------------------------------
runTests <- function()
{
   test_reverseString()

} # runTests
#------------------------------------------------------------------------------
# hint: make (indirect) use of base R's list reversal function "rev"
reverseString <- function(s)
{
    # check first: is s truly a string?
    if (!all(is.string(s))){
        msg <- sprintf("error in reverseString: argument is not a string")
        stop(msg)
        }


    splitString <- strsplit(s, "")
    list <- as.list(splitString) [[1]]
    revList <-  rev(list)
    listToString <- paste(revList, collapse = "")
    return (listToString)

} # reverseString
#------------------------------------------------------------------------------
test_reverseString <- function()
{
   print("--- test_reverseString")
   result <- reverseString("abcde")
   checkEquals(result, "edcba")

   checkException(reverseString(99), silent=TRUE)

   checkEquals(reverseString(""), "")
   checkEquals(reverseString("z"), "z")
   checkEquals(reverseString("for whom the bell tools"), "sllot lleb eht mohw rof")


} # test_reverseString
#------------------------------------------------------------------------------
