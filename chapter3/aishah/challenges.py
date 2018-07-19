# 1 ------ print 3 strings

ISB = ["aishah", "omar", "paul"]
for n in ISB:
    print(n)


# 2 ----- print a message for a variable less than 10 and a different one for
#       a varriable being greater than 10
x = 10
if x < 10:
    print ("x is less than 10")
elif x >= 10:
    print ("x is greater or equal to 10")

# 3 ----- print message if variable less than or equal to 10, if its greater than ten
#         but less than 25
y = 10
if y <=  10:
    print ("y is less than or equal to 10")
elif y > 10 and y<= 25:
    print ("y is between 10 and 25")
else:
    print("y is greater than 25")


#4 ------ division operatorn 
14 % 4


# 5 ------ create a program that takes two variables, divides, and prints quotient
x = 100
y = 4
x // y



#6 ----- assign 'age' to a number and create a program that prints different strings depending on what integer 'age' is
age = 16
adult = age + 5

if adult < age:
    print("you're a teenager")
else:
    print("you're officially an adult!")
