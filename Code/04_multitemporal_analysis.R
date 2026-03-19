# Code for performing multitemporal analysis with satellite imagery

library(terra)
library(imageRy)
library(viridis)

im.list()

EN_01 <- im.import("EN_01.png")
EN_01 <- flip(EN_01)
plot(EN_01)

EN_13 <- im.import("EN_13.png")
EN_13 <- flip(EN_13)
plot(EN_13)

# Exercise: plot the two images one on top of the other
im.multiframe(2,1)
plot(EN_01)
plot(EN_13)

# Differencing
ENdif <- EN_01[[1]] - EN_13[[1]] 
dev.off()
plot(ENdif)

# Greenland example

# Exercise: import all the greenland data and create a stack
g2000 <- im.import("greenland.2000.tif")
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")
sg <- c(g2000, g2005, g2010, g2015)

gr <- im.import("greenland")

im.multiframe(1,2)
plot(gr[[1]], col=plasma(100))
plot(gr[[4]], col=plasma(100))


dif <- gr[[4]] - gr[[1]]
dev.off()
plot(dif)

# RGB
im.plotRGB(gr, r=1, g=2, b=4)


