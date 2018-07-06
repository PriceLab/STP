                                        #LISTS
#when making lists in r, use c before parenthesis ---> c(1, 2, 3)
fruit <- c('apple', 'grape', 'jelly')
fruit
#where python starts at 0, R starts at 1
fruit[1]
fruit[2]
fruit[3]

                                        #multiple lists

lists <- c()
rap <- c("kanye west", "jay z", "nas")
rock <- c("bob dylan", "beatles")
dj <- c("zedd", "tiesto")

#append the lists to the main list
append(rap, lists)
append(rock, lists)
append(dj, lists)
print(lists)
