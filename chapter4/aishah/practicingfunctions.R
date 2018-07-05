                                        #this is to practice creating function calls, returns, defining


                                        #example 1
sum <- function(x, y){
    x + y
    }

sq = sum(5, 5)
print(sq)



                                        #ex2
                                        #finding length of a string
nchar("aishah")

                                        #converting to string
toString(100)

                                        #user input
#---------------------check code--------------------------
readage <- function(){
    age <- readline(prompt="enter your age")
    return(as.integer(age))
}

if (readage < 21) {
    print("wow, youre young")
} else {
    print("wow, youre old")
}
#-----------------------------check code-----------------



