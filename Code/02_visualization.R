# R code for visualizing multispectral data

library(terra) 
library(imageRy)
# install.packages("devtools")
# intsall.packages("viridis")
library(devtools)
# install_github("ducciorocchini/imageRy")
library(viridis)
library(ggplot2)
# install.packages("patchwork")
library(patchwork)
library(GGally)

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

b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

p1 <- im.ggplot(b8)
p2 <- im.ggplot(b4)

p1 + p2

# Multiframe:
# 1. par(mfrow=c(1,2))
# 2. im.multiframe(1,2)
# 3. stack
# 4. ggplot2 patchwork

# RGB plotting
sentinel <- c(b2, b3, b4, b8)

# 1=b2 blue
# 2=b3 green
# 3=b4 red
# 4=b8 nir

# 3 filters and 4 bands
im.plotRGB(sentinel, r=3, g=2, b=1) # natural colors 
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors

im.multiframe(1,2)
# 3 filters and 4 bands
im.plotRGB(sentinel, r=3, g=2, b=1) # natural colors 
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors

plot(sentinel[[4]])
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors

# NIR on green
im.plotRGB(sentinel, r=3, g=4, b=2) # false colors

# Exercise: NIR on top of the blue component of the RGB scheme
im.plotRGB(sentinel, r=3, g=2, b=4) # false colors

# Plot the four manners of RGB in a single multiframe
im.multiframe(2,2)
im.plotRGB(sentinel, r=3, g=2, b=1) # natural colors 
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors
im.plotRGB(sentinel, r=3, g=4, b=2) # false colors
im.plotRGB(sentinel, r=3, g=2, b=4) # false colors

# Positioning of visible bands
im.multiframe(1,2)
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors
im.plotRGB(sentinel, r=4, g=2, b=3) # false colors

pairs(sentinel)
ggpairs(sentinel)

# simplifying the function
im.plotRGB(sentinel, 4, 2, 3) # false colors

# plotRGB() from terra
plotRGB(sentinel, 4, 2, 3) 
plotRGB(sentinel, 4, 2, 3, stretch="lin") 
plotRGB(sentinel, 4, 2, 3, stretch="hist") 




