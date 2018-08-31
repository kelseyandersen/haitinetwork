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

library(usethis)

usethis::use_git()
usethis::use_github()
browse_github_pat()
cat("GITHUB_PAT=18dffc7330766760fb5429ead5c71112b1219375",
    file=file.path(normalizePath("~/"), ".Renviron"),
    append=TRUE)
Sys.getenv("GITHUB_PAT")
devtools::install_github('kelseyandersen/haitinetwork')
