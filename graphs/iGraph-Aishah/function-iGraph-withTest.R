#---------------------------------------------------------------------------------------------------------------------------
                                        #function of x
library(igraph)
plotfunction <- function(x){
    g1 <- sample_pa(n= x, power= 1, m=1, directed=FALSE)
    plot(g1, vertex.color="skyblue",
         vertex.frame.color="#555555",
         vertex.label.color="black",
         vertex.size=30)
    }

                                        #unit testing
#check to see if input 'x' is numerical, if not: error message

if (is.numeric(x) == TRUE){
    plotfunction(x)
} else {
    print("Error! Enter a numerical value")
    }


