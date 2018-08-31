library(tidyverse)
install.packages("tmap")
library(rgdal)
library(rgeos)
library(igraph)
library(tmap)
haiti <- readOGR(dsn = "shape", layer = "gadm36_HTI_1")
plot(haiti)

join <- read.csv("haiticsv.csv")


haiti@data <- full_join(haiti@data, join, by = "NAME_1")

tmap::qtm(shp = haiti, fill = "Incidence", fill.palette = "RdYlGn") 
