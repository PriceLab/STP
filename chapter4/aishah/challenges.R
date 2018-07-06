#1 ------write function that takes number as input and returns it squared
squared <- function(x){
    return(x * x)
}
print(squared(2))

#2---- write a program with 2 functions-- first one takes an int
#and returns the int by 2. second one returns an integer * 4.
#call the first function, save the number, then pass to the second one

divideBy2 <- function(x){
    return (x/2)
    }
y = divideBy2(18)


multiplyBy4 <- function(u){
    return (u *4)
}
print(multiplyBy4(y))


#3----a function that can convert a string to a float
toFloat <- function(a){
    return (as.double(a))
}
print(fltdbl("10.8"))
