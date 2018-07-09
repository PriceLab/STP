# capitalization.R
#----------------------------------------------------------------------------------------------------
library(RUnit)
#----------------------------------------------------------------------------------------------------
runTests <- function()
{
   test_capitalizeWord()

} # runTests
#----------------------------------------------------------------------------------------------------
capitalizeWord <- function(word)
{
   if(!all(is.character(word))){
      msg <- sprintf("error in capitalizeWord: argument is not of type character")
      stop(msg)
      }

  if(nchar(word) == 0)
     return(word)

   if(nchar(word) == 1)
      return(toupper(word))

   firstChar <- toupper(substr(word, 1, 1))
   remainingChars <- substr(word, 2, nchar(word))
   return(paste(firstChar, remainingChars, sep=""))

} # capitalizeWord
#----------------------------------------------------------------------------------------------------
test_capitalizeWord <- function()
{
   print("--- test_capitalizeWord")
   result <- capitalizeWord("abcde")
   checkEquals(result, "Abcde")

   checkEquals(capitalizeWord(""), "")
   checkEquals(capitalizeWord("z"), "Z")
   checkEquals(capitalizeWord("Z"), "Z")

   checkEquals(capitalizeWord("9abcde"), "9abcde")

} # test_capitalizeWord
#----------------------------------------------------------------------------------------------------
