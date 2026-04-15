# Script to import data from a computer or GitHub

library(terra)
library(imageRy)
library(viridis)
library(ggplot2)
library(patchwork)

setwd("~/Desktop/")
# c://blablabla/lknlnln

# get the directory
getwd()

# list oall the files inside the dir
list.files()

rgb <- rast("DJI_20260331174728_0001_D.JPG")
plot(rgb)

gre <- rast("DJI_20260331174728_0001_MS_G.TIF")

red <- rast("DJI_20260331174728_0001_MS_R.TIF")

nir <- rast("DJI_20260331174728_0001_MS_NIR.TIF")

stack <- c(gre, red, nir)
plot(stack)

plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, r=3, g=2, b=1, stretch="hist")

# without stretch declaration
im.plotRGB(stack, r=3, g=2, b=1)

plotRGB(stack, 2, 3, 1, stretch="lin")
plotRGB(stack, 2, 1, 3, stretch="lin")

# NDVI
ndvi <- im.ndvi(stack, 3, 2)

plot(ndvi, col=magma(100))
plot(ndvi, col=plasma(20))

# save the data
writeRaster(ndvi, "ndvi.tif")

# imagine that a researcher is using your data: reimporting files 
ndvi2 <- rast("ndvi.tif")
plot(ndvi2)

# save a plot
im.multiframe(2,2)
plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, 2, 3, 1, stretch="lin")
plotRGB(stack, 2, 1, 3, stretch="lin")
plot(ndvi)

png("figura_per_tesi.png")
im.multiframe(2,2)
plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, 2, 3, 1, stretch="lin")
plotRGB(stack, 2, 1, 3, stretch="lin")
plot(ndvi)
dev.off()

# patchwork
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(stack, scale=1, palette="viridis")
p1 + p2

png("grafico_statistico.png")
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(stack, scale=1, palette="viridis")
p1 + p2
dev.off()

pdf("grafico_statistico.pdf")
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(stack, scale=1, palette="viridis")
p1 + p2
dev.off()

# import from Git
# link to the data
nirgit <- rast("https://raw.githubusercontent.com/ducciorocchini/Telerilevamento_2026/main/Drone/DJI_20260331174728_0001_MS_NIR.TIF")

#### Importing satellite data

getwd()

list.files()

sat <- rast("ISS074-E-417243.jpg")
sat <- flip(sat)
plot(sat)


