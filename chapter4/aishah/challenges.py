 #1 ------write function that takes number as input and returns it squared
def func1(x):
   return x ** 2

print(func1(2))

#2---- write a program with 2 functions-- first one takes an int
#and returns the int by 2. second one returns an integer * 4.
#call the first function, save the number, then pass to the second one

def divide(x):
    return x/2
    
y = divide(2)
print(int(y))


def multp(u):
    return u *4

print(multp(y))


#3----a function that can convert a string to a float 
def convert(g):
    return float(g)

c = convert("3.3")
print(c)


