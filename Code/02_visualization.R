# R code for visualizing multispectral data

install.packages("devtools")
library(devtools)
install_github("ducciorocchini/imageRy")

library(terra) # package for using spatial data
library(imageRy) # package devoted to satellite images

im.list()

# Sentinel-2 bands
# https://gisgeography.com/sentinel-2-bands-combinations/

b2 <- im.import("sentinel.dolomites.b2.tif")
