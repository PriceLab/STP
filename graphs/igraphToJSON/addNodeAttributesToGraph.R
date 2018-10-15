# given an igraph with zero or more nodes, add a random integer attribute, of the specified name
# to each node in the graph
library(igraph)
library(RUnit)
#------------------------------------------------------------------------------------------------------------------------
addNodeAttributesToGraph <- function(igraph, attributeName, nodeNames, noaValues)
{
    graph.out <- set.vertex.attribute(igraph, attributeName, nodeNames, noaValues)

    return(graph.out)

} # addNodeAttributesToGraph
#------------------------------------------------------------------------------------------------------------------------
test_addNodeAttributesToGraph <- function()
{
   printf("--- test_addNodeAttributesToGraph")
   # make a 5 node, 0 edge graph, no node attributes
   node.names <- LETTERS[1:5]
   g <- graph_from_literal() + vertices(node.names)

   sizes <- c(10, 20, 30, 40, 50)
   g.noa <-addNodeAttributesToGraph(g, "size", node.names, sizes)

   for(i in V(g.noa)){
       checkTrue(get.vertex.attribute(g.noa)$name[i] == node.names[i],
                 get.vertex.attribute(g.noa)$size[i] == sizes[i])
       } #for i

   noa.size <- get.vertex.attribute(g.noa, "size")
   checkEquals(length(noa.size),5)

   noa.letters <- get.vertex.attribute(g.noa, "name")
   checkEquals(length(noa.letters),5)

} # test_addNodeAttributesToGraph
#------------------------------------------------------------------------------------------------------------------------
