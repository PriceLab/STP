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

 #creates the function that can later be called to run. it is a function of s, meaning when called,
#whatever is in the () will go through function as s
reverseString <- function(s)
{
    # check first: is s truly a string?
   #test to see if its truly a string or not when function is called
    #for loop goes through function and if its  not a character, a message will pop up
    if (!all(is.character(s))){
        msg <- sprintf("error in reverseString: argument is not a string")
        stop(msg)
        }

    #this function splits the string by "", which essentially splits
    # the string by each letter since there is no space in between the ""
    splitString <- strsplit(s, "")

    #this function changes the string into a list.
    #the [[1]] extracts each letter in the list and puts it into a list in order of original character
    list <- as.list(splitString) [[1]]

    #the rev function reverses every letter in the list. by using [[1]] and extracting each letter by letter
    #the rev function will go through each letter and send it to the end of ordering, which reverses the list
    revList <-  rev(list)

    #this line converts the reversed list back into a string and combining each item in the lists
    #by nothing since there's nothing in the "". this converts the list back into the string it was(reversed)
    listToString <- paste(revList, collapse = "")

    #this returns the entire function so that when it is called, itll print the results
    return
    (listToString)

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
   checkEquals(reverseString("for whom the bell tools"), "sloot lleb eht mohw rof")


} # test_reverseString
#------------------------------------------------------------------------------
