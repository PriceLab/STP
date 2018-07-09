#---------STRING MANIPULATION

author <- "maria"
author[1]


                                        #upper and lowercasing strings
toupper("we hold these truths")
tolower("FOUR SCORE AND...")

                                        #splitting text
strsplit("hello,yes!", ",")


                                        #joining text
words <-  ["the", "fox", "jumped", "."]



#replace function
equ <- ( "all animals are equal")
y <- gsub("a", "@", equ)
print(y)


#finding an index in a string
 gregexpr( pattern = 'e', "the bee")
