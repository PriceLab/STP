# utils.R:  utilitiy functions using igraph
#------------------------------------------------------------------------------------------------------------------------
# retun an igraph instance with the specified number of nodes, edges and attributes
# name nodes in the style "node1", "node2", ...
# name edges similarly: "edge1", "edge2"
# create edges by randomly choosing pairs of nodes to connect:
#   nodes <- paste("node", 1:5, sep="")
#   nodePairs <- nodes[sample(length(nodes), 2)]
#   nodeAttribues and edgeAttributes will each be a simple list of named attributes to create,
#     each with a random value, for instance
#          edge.attribute.1 <- 100 * runif(1)   # a numeric attribute
                                        #          edge.attribute.2 <- LETTERS[sample(1:26, 1)]
#------------------------------------------------------------------------------------------------------------------------
library(igraph)
#----------------------------------------------------------------------------------------------------
makeRandomString <- function(length)
{
    uppercaseLowercase <- c(letters, LETTERS)
    random <- sample(uppercaseLowercase,length, replace=TRUE)
    randomString <- paste(random, collapse="")

    return(randomString)
}
#----------------------------------------------------------------------------------------------------
makeRandomStrings <- function(list)
{
    vector <- lapply(list, makeRandomString)
    listOfStrings <- unlist(vector)

    return(listOfStrings)
}
#----------------------------------------------------------------------------------------------------
createTestGraph <- function(numberOfNodes=0, numberOfEdges=0, nodeAttributes=list(), edgeAttributes=list())
{
    g <- graph_from_literal()

    if(numberOfNodes == 0)
        return(g)

    node.names <- paste("node-", 1:numberOfNodes, sep="")

    g <- g + vertices(node.names)

    if (numberOfEdges > 0){
        edge.names <- paste("edge-",1:numberOfEdges, sep="")
        for (i in 1:numberOfEdges){
            howManyNodes <- length(node.names)
            sampledNodes <- sample(howManyNodes, 2, replace = TRUE, prob= NULL)
            addEdges <- edges(sampledNodes)
            g <- g + addEdges
            }  # for i
        } # if

    if (length(nodeAttributes)>0){
        if (nodeAttributes[[1]]=="numeric"){
            noa.length <- length(nodeAttributes)
            random.num <- round(runif(noa.length,0,99))
            V(g)$age <- random.num
            } # if numeric
        if (nodeAttributes[[1]]=="character"){
            string.length <- length(nodeAttributes)
            random.string <- round(runif(string.length,0, 99))
            noa.string <- makeRandomString(random.string)
            V(g)$string <- noa.string
            } # if character
    }# if

    return(g)
}
#----------------------------------------------------------------------------------------------------

