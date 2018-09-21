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
makeRandomString <- function(list)
{
    randomString <- function(length)
    {
        uppercaseLowercase <- c(letters, LETTERS)
        random <- sample(uppercaseLowercase,length, replace=TRUE)
        randomString <- paste(random, collapse="")
        return(randomString)
        }

    vector <- lapply(list, randomString)
    listOfStrings <- unlist(vector)

    return(listOfStrings)

} # makeRandomString
#----------------------------------------------------------------------------------------------------
generateRandomLogicals <- function(amount)
{
    x <- round(runif(amount,0,1))
    x.TorF <- as.logical(x)
    return(x.TorF)

} # generateRandomLogicals
#----------------------------------------------------------------------------------------------------
createTestGraph <- function(numberOfNodes=0, numberOfEdges=0, nodeAttributes=list(), edgeAttributes=list())
{
    g <- graph_from_literal()

    if(numberOfNodes == 0)
        return(g)

    node.names <- paste("node-", 1:numberOfNodes, sep="")

    g <- g + vertices(node.names)

    for(i in seq_len(length(nodeAttributes))){
        noa.name <- names(nodeAttributes)[i]
        noa.type <- nodeAttributes[[i]]

        if(noa.type == "logical"){
            noa.values <- generateRandomLogicals(numberOfNodes)
            g <- set.vertex.attribute(g, noa.name, seq_len(numberOfNodes), noa.values)
            } # if logical
        if(noa.type == "character"){
            random.string <- round(runif(length(nodeAttributes),0,99))
            noa.string <- makeRandomString(random.string)
            g <- set.vertex.attribute(g, noa.name, seq_len(numberOfNodes), noa.string)
            } # if character
        if(noa.type == "numeric"){
            noa.length <- length(nodeAttributes)
            random.num <- round(runif(noa.length,0,99))
            g <- set.vertex.attribute(g, noa.name, seq_len(numberOfNodes), random.num)
            } # if numeric
         } # for

    edge.names <- paste("edge-",1:numberOfEdges, sep="")

    for (i in seq_len(numberOfEdges)){
            howManyNodes <- length(node.names)
            sampledNodes <- sample(howManyNodes, 2, replace = TRUE, prob= NULL)
            addEdges <- edges(sampledNodes)
            g <- g + addEdges
            g <- set_edge_attr(g, "name", seq_len(numberOfEdges), edge.names)
            } # for i

    for (i in seq_len(length(edgeAttributes))){
          edge.name <- names(edgeAttributes)[i]
          edge.type <- edgeAttributes[[i]]

        if(edge.type == "logical"){
            edge.values <- generateRandomLogicals(numberOfEdges)
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), edge.values)
            } # if logical
        if(edge.type == "character"){
            random.edge <- round(runif(length(edgeAttributes),0,99))
            noa.string <- makeRandomString(random.edge)
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), random.edge)
            } # if character
        if(edge.type == "numeric"){
            edge.length <- length(edgeAttributes)
            random.edge.num <- round(runif(edge.length,0,99))
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), random.edge.num)
            } # if numeric
          }

    return(g)

}# createTestGraph
#----------------------------------------------------------------------------------------------------

