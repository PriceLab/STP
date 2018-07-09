                                        #1-------- print every character in "camus"
word <- "camus"
word_split <-  strsplit(word, "")       ##strsplit = splits string by "", which seperates each letter
for (letter in word_split){
    print(letter)
    }


                                        #use a method to make first letter in the sentence capitalized

library(RUnit)

    #capitalizes start of every word
    capitalizeWord <-  function(x){
        splitwords <- strsplit(x, " ")[[1]]
        #this line splits the word so that each word can be capitalized at the start
        capEachWord <-  paste(toupper(substr(splitwords, 1, 1)), substr(splitwords, 2, nchar(x)), sep = "")

        print(capEachWord)
    }
    capitalizeWord("apples are red, sometimes green.")





    #capitalize start of sentence
      capitalizeSentence <-  function(x){
          cap1stword <-  paste(toupper(substr(x, 1, 1)), substr(x, 2, nchar(x)), sep = "")
          print(cap1stword)


      }

    capitalizeSentence("apples are red, sometimes green")




                                        #using Pauls code

capitalizeWord <- function(word){
    if (!all(is.character(word))){
        msg <- sprintf("wrror in capitalizing")
        stop(msg)
    }
    if (nchar(word)==0)
        return(word)
    if (nchar(word) ==1)
        return(toupper(word))

    firstChar <- toupper(substr(word, 1,1))
    remainingChars <- substr(word, 2, nchar(word))
    return (paste(firstChar, remainingChars, sep="")




  #create a method that takes "what now? who now? where now?" and makes it into a list

makeIntoList <- function(n){
    splitByQuestionMark <-  strsplit(n, "?  ")
    print(splitByQuestionMark)

}

makeIntoList("what now? who now? where now? ")





s= "what? who? when?"
strsplit(s, "? ")
