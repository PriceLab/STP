#test_utils.R: tests for the 3 utilitiy functions, using igraph
library(RUnit)
library(igraph)
#----------------------------------------------------------------------------------------------------
source("utils.R")
#----------------------------------------------------------------------------------------------------
runTests <- function()
{
   test_createEmptyTestGraph()
   test_1NodeTestGraph()
   test_15NodeTestGraph()
   test_4Node2EdgesTestGraph()
   test_graphWithNodeNumericAttributes()
   test_charactersAttribute()
   test_makeRandomString()
   test_randomLogicals()
   test_randomLogicals_monteCarlo()
   test_logicalAttribute()
   test_edge_numericAttribute()
   test_edge_characterAttribute()
   test_edge_logicalAttribute()
   test_twoNoa_twoEda()
   test_threeNoa_twoEda()
   test_igraphToDataFrames_2nodes_1edge()
   test_igraphToDataFrames_5nodes_5edges()
   test_igraphToDataFrames_1node_nodeAttributes()
   test_igraphToDataFrame_3nodes_1edges_orphanNode()
   test_igraphToDataFrame_12nodes_5edges_orphanNodes()

} # runTests
#----------------------------------------------------------------------------------------------------
test_createEmptyTestGraph <- function()
{
    print("--- test_createEmptyGraph")

    g <- createTestIgraph()        # an empty graph, always a good place to start

    checkEquals(length(V(g)), 0)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_1NodeTestGraph <- function()
{
    print("--- test_1NodeTestGraph")

    g <- createTestIgraph(1)        # 1 node graph

    checkEquals(length(V(g)), 1)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_15NodeTestGraph <- function()
{
    print("--- test_15NodeTestGraph")

    g <- createTestIgraph(15)        # 15 node graph

    checkEquals(length(V(g)), 15)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_4Node2EdgesTestGraph <- function()
{
    print("--- test_4Node2EdgesTestGraph")

    g <- createTestIgraph(4,2)        # 4 node 2 edge graph

    checkEquals(length(V(g)), 4)
    checkEquals(length(E(g)), 2)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_graphWithNodeNumericAttributes <- function()
{
   print("--- test_graphWithNodeNumericAttributes")

   g <- createTestIgraph(1, 0, noaSpec=list(age="numeric"))

   checkEquals(length(V(g)), 1)
   age.noa <- vertex_attr(g, "age")
   checkEquals(length(age.noa), 1)

   checkTrue(is.numeric(age.noa))

} # test_addNodeAttributes
#----------------------------------------------------------------------------------------------------
test_charactersAttribute <- function()
{
    print("--- test_charactersAttribute")

    g <- createTestIgraph(4, 0, noaSpec=list(string="character"))

    checkEquals(length(V(g)), 4)
    string.noa <- vertex_attr(g, "string")
    checkEquals(length(string.noa), 4)

} # test_samplingLetters
#----------------------------------------------------------------------------------------------------
test_makeRandomString <- function()
{
    print("--- test_makeRandomString")

    requested.lengths <- c(2,6,4,1,7)
    random.strings <- makeRandomString(requested.lengths)
    checkEquals(length(random.strings), 5)
    actual.lengths <- unlist(lapply(random.strings, nchar))
    checkEquals(actual.lengths, requested.lengths)

} # test_makeRandomString
#----------------------------------------------------------------------------------------------------
test_randomLogicals <- function()
{
    print("--- test_randomLogicals")

    set.seed(29)
    random.logical <- generateRandomLogicals(50)
    true.elements <- which(random.logical)
    checkTrue(length(true.elements) >  20)
    checkTrue(length(true.elements) < 30)

} # test_randomLogicals
#----------------------------------------------------------------------------------------------------
test_randomLogicals_monteCarlo <- function()
{
    print("--- test_randomLogicals_monteCarlo")

    max.repititions <- 10
    results <- vector(mode="numeric", length= max.repititions)
    set.seed(67)

    for (i in 1:max.repititions){
        random.logical <- generateRandomLogicals(200)
        results[i] <- mean(round(runif(n=200, min=1, max=200)))
        } # for i

    average_results <- mean(results)

    checkTrue(average_results < 110)
    checkTrue(average_results > 90)

} # test_randomLogicals_montecarlo
#----------------------------------------------------------------------------------------------------
test_logicalAttribute <- function()
{
    print("--- test_logicalAttribute")

    g <- createTestIgraph(4, 0, noaSpec=list(logical="logical"))
    checkEquals(length(V(g)), 4)
    logical.noa <- vertex_attr(g, "logical")
    checkEquals(length(logical.noa), 4)

} # test_logicalAttribute
#----------------------------------------------------------------------------------------------------
test_edge_logicalAttribute <- function()
{
    print("--- test_edge_logicalAttribute")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical"), edaSpec=list(TF="logical"))

    checkEquals(length(E(g)), 4)
    logical.edge <- edge_attr(g, "TF")
    checkEquals(length(logical.edge), 4)

    checkTrue(is.logical(logical.edge))

} # test_edge_logicalAttribute
#----------------------------------------------------------------------------------------------------
test_edge_characterAttribute <- function()
{
    print("--- test_edge_characterAttribute")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical"), edaSpec=list(letters="character"))

    checkEquals(length(E(g)), 4)
    character.edge <- edge_attr(g, "letters")
    checkEquals(length(character.edge), 4)

    checkTrue(is.character(character.edge))

} # test_edge_characterAttribute
#----------------------------------------------------------------------------------------------------
test_edge_numericAttribute <- function()
{
    print("--- test_edge_numericAttribute")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical"), edaSpec=list(numbers="numeric"))

    checkEquals(length(E(g)), 4)
    num.edge <- edge_attr(g, "numbers")
    checkEquals(length(num.edge), 4)

    checkTrue(is.numeric(num.edge))

} # test_edge_characterAttribute
#----------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------
test_edge_twoTypeAttribute <- function()
{
    print("--- test_edge_twoTypeAttribute")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical"), edaSpec=list(numbers="numeric", age="character"))

    checkEquals(length(E(g)), 4)
    num.edge <- edge_attr(g, "numbers")
    character.edge <- edge_attr(g, "age")
    checkEquals(length(num.edge), 4)
    checkEquals(length(character.edge), 4)

    checkTrue(is.character(character.edge))
    checkTrue(is.numeric(num.edge))

} # test_edge_twoTypeAttribute
#----------------------------------------------------------------------------------------------------
test_edge_threeTypeAttribute <- function()
{
    print("--- test_edge_threeTypeAttribute")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical"),
                         edaSpec=list(numbers="numeric", age="character",TF="logical"))

    checkEquals(length(E(g)), 4)
    num.edge <- edge_attr(g, "numbers")
    character.edge <- edge_attr(g, "age")
    logical.edge <- edge_attr(g, "TF")

    checkEquals(length(num.edge), 4)
    checkEquals(length(character.edge), 4)
    checkEquals(length(logical.edge), 4)

    checkTrue(is.character(character.edge))
    checkTrue(is.numeric(num.edge))
    checkTrue(is.logical(logical.edge))

} # test_edge_threeTypeAttribute
#----------------------------------------------------------------------------------------------------
test_twoNoa_twoEda <- function()
{
    print("--- test_twoNoa_twoEda")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical",num="numeric"),
                         edaSpec=list(numbers="numeric", age="character"))

    checkEquals(length(E(g)), 4)
    checkEquals(length(V(g)), 8)
    logical.node <- vertex_attr(g, "logical")
    num.node <- vertex_attr(g, "num")
    num.edge <- edge_attr(g, "numbers")
    character.edge <- edge_attr(g, "age")

    checkEquals(length(num.node), 8)
    checkEquals(length(logical.node), 8)
    checkEquals(length(num.edge), 4)
    checkEquals(length(character.edge), 4)

    checkTrue(is.character(character.edge))
    checkTrue(is.numeric(num.edge))
    checkTrue(is.logical(logical.node))
    checkTrue(is.numeric(num.node))

} # test_twoNoa_twoEda
#----------------------------------------------------------------------------------------------------
test_threeNoa_twoEda <- function()
{
    print("--- test_threeNoa_twoEda")

    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical",num="numeric", name= "character"),
                         edaSpec=list(numbers="numeric", age="character"))

    checkEquals(length(E(g)), 4)
    checkEquals(length(V(g)), 8)
    logical.node <- vertex_attr(g, "logical")
    num.node <- vertex_attr(g, "num")
    character.node <- vertex_attr(g, "name")
    num.edge <- edge_attr(g, "numbers")
    character.edge <- edge_attr(g, "age")

    checkEquals(length(num.node), 8)
    checkEquals(length(logical.node), 8)
    checkEquals(length(character.node), 8)
    checkEquals(length(num.edge), 4)
    checkEquals(length(character.edge), 4)

    checkTrue(is.character(character.edge))
    checkTrue(is.numeric(num.edge))
    checkTrue(is.logical(logical.node))
    checkTrue(is.numeric(num.node))
    checkTrue(is.character(character.node))

} # test_threeNoa_twoEda
#----------------------------------------------------------------------------------------------------
test_igraphToDataFrames_2nodes_1edge <- function()
{
   ig21 <- createTestIgraph(numberOfNodes=2, numberOfEdges=1)
   result <- igraphToDataFrames(ig21)
   checkEquals(names(result), c("tbl.nodes", "tbl.edges"))

   tbl.nodes <- result$tbl.nodes
   tbl.edges <- result$tbl.edges

   checkEquals(as.list(tbl.nodes)$id, get.vertex.attribute(ig21)$name)
   checkEquals (c(as.list(tbl.edges)$source, as.list(tbl.edges)$target),
                c(as_data_frame(ig21)$from, as_data_frame(ig21)$to))

} # test_igraphToDataFrames_2nodes_1edge
#----------------------------------------------------------------------------------------------------
test_igraphToDataFrames_5nodes_5edges <- function()
{
    ig55 <- createTestIgraph(numberOfNodes=5, numberOfEdges=5)
    result <- igraphToDataFrames(ig55)
    checkEquals(names(result), c("tbl.nodes", "tbl.edges"))

    tbl.nodes <- result$tbl.nodes
    tbl.edges <- result$tbl.edges

    checkEquals(as.list(tbl.nodes)$id, get.vertex.attribute(ig55)$name)
    checkEquals(tbl.edges$source, as_data_frame(ig55)$from)
    checkEquals(tbl.edges$target, as_data_frame(ig55)$to)

} # test_igraphToDataFrames_5nodes_5edges
#----------------------------------------------------------------------------------------------------
test_igraphToDataFrames_1node_nodeAttributes <- function()
{
    ig2noa <- createTestIgraph(numberOfNodes=1, noaSpec=list(age="numeric"))
    result <- igraphToDataFrames(ig2noa)
    checkEquals(names(result), c("tbl.nodes", "tbl.edges"))

    checkEquals(length(V(ig2noa)), 1)
    num.node <- vertex_attr(ig2noa, "age")
    checkEquals(length(num.node), 1)

    checkTrue(is.numeric(num.node))

} # test_igraphToDataFrames_1node_nodeAttributes
#----------------------------------------------------------------------------------------------------
test_igraphToDataFrame_3nodes_1edges_orphanNode <- function()
{
    igOrphanNode <- createTestIgraph(numberOfNodes=3, numberOfEdges=1)
    result <- igraphToDataFrames(igOrphanNode)
    checkEquals(names(result), c("tbl.nodes", "tbl.edges"))

    totalNodes <- result$tbl.nodes$id
    nodesInEdges <- unique(c(result$tbl.edges$source, result$tbl.edges$target))
    checkDifference <- setdiff(totalNodes, nodesInEdges)

    checkEquals(length(checkDifference), 1)

} # test_igraphToDataFrame_10nodes_5edges_orphanNode
#----------------------------------------------------------------------------------------------------
test_igraphToDataFrame_12nodes_5edges_orphanNodes <- function()
{
    set.seed(37)
    igOrphanNodes <- createTestIgraph(numberOfNodes=12, numberOfEdges=5)
    result <- igraphToDataFrames(igOrphanNodes)
    checkEquals(names(result), c("tbl.nodes", "tbl.edges"))

    totalNodes <- result$tbl.nodes$id
    nodesInEdges <- unique(c(result$tbl.edges$source, result$tbl.edges$target))
    checkDifference <- setdiff(totalNodes, nodesInEdges)
    printf("delta: %d", length(checkDifference))
    #checkEquals(length(checkDifference), 6)

} # test_igraphToDataFrame_12nodes_5edges_orphanNodes
#----------------------------------------------------------------------------------------------------
bug <- function()
{
    g <- createTestIgraph(8, 4, noaSpec=list(logical="logical",num="numeric", name= "character"),
                         edaSpec=list(numbers="numeric", age="character"))

} # bug
#----------------------------------------------------------------------------------------------------

