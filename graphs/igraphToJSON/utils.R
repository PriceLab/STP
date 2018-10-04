# utils.R:  utilitiy functions using igraph
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
igraphToDataFrames <-  function(igraph)
{
    node.names <- get.vertex.attribute(igraph)$name

    tbl.nodes <- data.frame(id=node.names,
                            stringsAsFactors=FALSE)
    tbl <- data.frame()
    for (name in node.names){
        new.row <- list(node.names=name, count=4)
        tbl <- rbind(tbl, new.row,stringsAsFactors=FALSE)
        }

    edgesAsDataFrame <- as_data_frame(igraph)

    for (i in edgesAsDataFrame){
        edgesSource <- edgesAsDataFrame$from
        edgesTarget <- edgesAsDataFrame$to
        tbl.edges <- data.frame(source=c(edgesSource),
                                target=c(edgesTarget),
                                stringsAsFactors=FALSE)
        }

    return(list(tbl.nodes=tbl.nodes, tbl.edges=tbl.edges))

} # igraphToDataFrame
#----------------------------------------------------------------------------------------------------
#function creates nodes based on 4 parameters
#noaSpec = Node Attribute Specification
#edaSpec = Edge Attribute Specification
createTestIgraph <- function(numberOfNodes=0, numberOfEdges=0, noaSpec=list(), edaSpec=list())
{
    g <- graph_from_literal()

    if(numberOfNodes == 0)
        return(g)

    node.names <- paste("node-", 1:numberOfNodes, sep="")

    g <- g + vertices(node.names)

    for(i in seq_len(length(noaSpec))){
        noa.name <- names(noaSpec)[i]
        noa.type <- noaSpec[[i]]

        if(noa.type == "logical"){
            noa.values <- generateRandomLogicals(numberOfNodes)
            g <- set.vertex.attribute(g, noa.name, seq_len(numberOfNodes), noa.values)
            } # if logical
        if(noa.type == "character"){
            random.string <- round(runif(length(noaSpec),0,99))
            noa.string <- makeRandomString(random.string)
            g <- set.vertex.attribute(g, noa.name, seq_len(numberOfNodes), noa.string)
            } # if character
        if(noa.type == "numeric"){
            noa.length <- length(numberOfNodes)
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

    for (i in seq_len(length(edaSpec))){
          edge.name <- names(edaSpec)[i]
          edge.type <- edaSpec[[i]]

        if(edge.type == "logical"){
            edge.values <- generateRandomLogicals(numberOfEdges)
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), edge.values)
            } # if logical
        if(edge.type == "character"){
            random.edge <- round(runif(length(edaSpec),0,99))
            edge.string <- makeRandomString(random.edge)
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), edge.string)
            } # if character
        if(edge.type == "numeric"){
            edge.length <- length(numberOfEdges)
            random.edge.num <- round(runif(edge.length,0,99))
            g <- set.edge.attribute(g, edge.name, seq_len(numberOfEdges), random.edge.num)
            } # if numeric
         } # for

    return(g)

}# createTestIgraph
#----------------------------------------------------------------------------------------------------

