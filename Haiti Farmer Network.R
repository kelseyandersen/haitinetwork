amat <- matrix(ncol = 300, nrow = 300)
amat[1:100,1:100] <- matrix(runif(10000) < .01, ncol = 100) ## north to north
amat[101:200,101:200] <- matrix(runif(10000) < .1, ncol = 100) ## south to south
amat[201:300,201:300] <- matrix(runif(10000) < .1, ncol = 100) ## southwest to southwest
###
amat[1:100,101:200] <- matrix(runif(10000) < 0.0000001, ncol = 100) ## north to south 
amat[101:200, 1:100] <- matrix(runif(10000) < 0.000001, ncol = 100) ## south to north
amat[201:300, 1:100] <- matrix(runif(10000) < .0001, ncol = 100) ## sw to north 
amat[1:100,201:300] <- matrix(runif(10000) < .0001, ncol = 100) ## North to SW farmers
amat[201:300,101:200] <- matrix(runif(10000) < .001, ncol = 100) ## SW to S farmers
amat[101:200,201:300] <- matrix(runif(10000) < .001, ncol = 100) ## S to SW farmers
amat2 <- amat*1
library(igraph)
amat3 <- graph_from_adjacency_matrix(amat2)
V(amat3)$size <- 3
colrs <- c(rep("red", 100), rep("yellow", 100), rep("blue", 100))
V(amat3)$color <- colrs
new.layout <- layout_with_fr(amat3)
plot(amat3, edge.arrow.size = .2, vertex.label.cex = .1, layout = new.layout)
amat3 <- set_vertex_attr(amat3, "Region", index = V(amat3), Region)


