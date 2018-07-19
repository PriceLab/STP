#practice containers example by example in book
#-----NOTES-------

#containers are like filing cabenets


#LISTS--------

# ex1
fruit = ['apple' , 'grapes' , 'jelly']
fruit
fruit[0]
fruit[1]
fruit[2]

#nxt few codes allow for user input
guess = input("guess a fruit")
if guess in fruit:
    print("you guessed it!")
else:
    print("oop, wrong!")



#------multiple lists-------

lists = []
rap = ["kanye west", "jay z", "nas"]
rock = ["bob dylan", "beatles"]
dj = ["zedd", "tiesto"]

#append the lists to the main list
lists.append(rap)
lists.append(rock)
lists.append(dj)
print(lists)
