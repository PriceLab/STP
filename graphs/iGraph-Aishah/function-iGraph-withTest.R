#---------------------------------------------------------------------------------------------------------------------------
                                        #function of x
library(igraph)
createGraph <- function(x, y){

    g1 <- sample_pa(n= x,power =1, m=y, directed=FALSE)
    plot(g1, vertex.color="skyblue",
         vertex.frame.color="#555555",
         vertex.label.color="black",
         vertex.size=30)
    }

                                        #unit testing
#check to see if input 'x' is numerical, if not: error message

if (is.numeric(x)== TRUE && is.numeric(y) == TRUE){
    createGraph(x,y)
    print(paste("Number of nodes:", x))
    print(paste("Number of edges:", y))


} else {
    print("Error! Enter a numerical value")
    }


