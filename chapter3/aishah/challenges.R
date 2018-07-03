//1 ------ print 3 strings


ISB = c("aishah" , "omar" , "paul")
for (i in ISB){
    print(paste(i))
}



//2 ----- print a message for a variable less than 10 and a different one for
//       a varriable being greater than 10


x = 10
if (x < 10) {
    print("less than 10")
} else {
    print("equal or greater than 10")
}


//3 ----- print message if variable less than or equal to 10, if its greater than ten
//         but less than 25


y = 10
if (y <= 10) {
    print("less than or equal to 10")
} else if(y > 10){
    print("greater than 10")
} else if (y > 25){
    print("greater than 25")
    }


//4 ------ division operatorn

g= 3
h= 7
h %% g


// 5 ------ create a program that takes two variables, divides, and prints quotient


26%/% 8

//6 ----- assign 'age' to a number and create a program that prints different strings depending on what integer 'age' is

age = 16
adult = age + 5

if (age < adult){
    print("you're a teenager.")
} else {
    print("you're officially an adult!")
}
