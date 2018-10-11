# given an igraph with zero or more nodes, add a random integer attribute, of the specified name
# to each node in the graph
#------------------------------------------------------------------------------------------------------------------------
addNodeAttributesToGraph(igraph, attributeName, nodeNames, noaValues)
{
   # all nodeNames actually the names of node in the igraph?
   # length (nodeNames) == length(noaValues)?

} # addNodeAttributesToGraph
#------------------------------------------------------------------------------------------------------------------------
test_addNodeAttributesToGraph(igraph, attributeName, nodeNames, noaValues)
{
   printf("--- test_addNodeAttributesToGraph")

     # make a 5 node, 0 edge graph, no node attributes
   node.names <- LETTERS[1:5]
   g <- graph_from_literal() + vertices(node.names)

   sizes <- c(10, 20, 30, 40, 50)
   g.noa <- addNodeAttributesToGraph(g, "size", node.names, sizes)

      # tests
   # does the nade attribute "size" truly exist on the graph's nodes?
   # does node A have size 10?  B has 20?  C 30, D 40, E 50?

} # test_addNodeAttributesToGraph
#------------------------------------------------------------------------------------------------------------------------