# R code for visualizing multispectral data

library(terra) 
library(imageRy)
# install.packages("devtools")
# intsall.packages("viridis")
library(devtools)
# install_github("ducciorocchini/imageRy")
library(viridis)

im.list()

# Sentinel-2 bands
# https://gisgeography.com/sentinel-2-bands-combinations/

b2 <- im.import("sentinel.dolomites.b2.tif")

# Changing colors
cl <- colorRampPalette(c("lightsalmon", "yellow", "mediumpurple1"))(100)
plot(b2, col=cl)

# Small number of nuances
cl <- colorRampPalette(c("lightsalmon", "yellow", "mediumpurple1"))(3)
plot(b2, col=cl)

# Using viridis to change colors
plot(b2, col=inferno(100))
plot(b2, col=mako(100))

# Exercise: assign a greycolor palete to the image
cl <- colorRampPalette(c("dark gray", "gray", "light gray"))(100)
plot(b2, col=cl)

# par
par(mfrow=c(1,2))
plot(b2, col=inferno(100))
plot(b2, col=cl)

dev.off()

# im.multiframe
im.multiframe(1,2)
plot(b2, col=inferno(100))
plot(b2, col=cl)

# Importing band 3

b3 <- im.import("sentinel.dolomites.b3.tif")

# Exercise: change the ramp palette according to the viridis package
plot(b3, col=plasma(100))

# Importng band 4
b4 <- im.import("sentinel.dolomites.b4.tif")

# Importng band 8
b8 <- im.import("sentinel.dolomites.b8.tif")

im.multiframe(2,2)

# Exercise: multiframe with the four bands, legends: in line with the wavelength
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(b2, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(b3, col=clg)

clr <- colorRampPalette(c("#8B1A1A", "red", "pink"))(100)
plot(b4, col=clr)

cln <- colorRampPalette(c("goldenrod3", "goldenrod2", "goldenrod"))(100)
plot(b8, col=cln)

plot(b2, col=inferno(100))
plot(b3, col=inferno(100))
plot(b4, col=inferno(100))
plot(b8, col=inferno(100))

sentinel <- c(b2, b3, b4, b8)
plot(sentinel)
plot(sentinel, col=inferno(100))

plot(sentinel$sentinel.dolomites.b8)

# layer1=b2, layer2=b3, layer3=b4, layer4=b8
plot(sentinel[[4]])
plot(sentinel[[2]])


# stack
# sist rife






