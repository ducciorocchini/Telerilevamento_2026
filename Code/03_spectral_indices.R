library(terra)
library(imageRy)
library(viridis)

# listing files
im.list()

# importing data
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 <- flip(mato1992)

# l1=NIR l2=red l3=green
im.plotRGB(mato1992, 1, 2, 3)

# Exercise: put NIR on top pof the green component of the RGB scheme
im.plotRGB(mato1992, 2, 1, 3)

# NIR ontop of the blue
im.plotRGB(mato1992, 3, 2, 1)

# Exercise: import the image from 2006
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 <- flip(mato2006)
im.plotRGB(mato2006, 1, 2, 3)

# Exercise: make a multiframe with the two images, one beside the other
im.multiframe(1,2)
im.plotRGB(mato1992, 1, 2, 3)
im.plotRGB(mato2006, 1, 2, 3)

plotRGB(mato1992, 1,2,3, stretch="hist")
plotRGB(mato2006, 1,2,3, stretch="hist")

im.plotRGB(mato1992, 2, 1, 3)
im.plotRGB(mato2006, 2, 1, 3)

im.plotRGB(mato1992, 2, 3, 1)
im.plotRGB(mato2006, 2, 3, 1)

# DVI
# l1=NIR l2=red l3=green
dvi1992 <- mato1992[[1]] - mato1992[[2]]

# 8 bit
# NIR - red = 255 - 0 = 255 max DVI
# NIR - red = 0 - 255 = -255 min DVI

# range = -255, 255

# Exercise: calculate min and max of DVI for an image composed by data at 4 bit
4 bit = 2^4 = 16
# NIR - red = 15 - 0 = 15 max DVI
# NIR - red = 0 - 15 = -15 min DVI

# NDVI

(NIR- red)/(NIR + red)

# 8 bit
# NIR - red = (255 - 0) / (255 + 0) = 1 max NDVI
# NIR - red = (0 - 255) / (0 + 255) = -1 min NDVI

# 4 bit
# NIR - red = (15 - 0) / (15 + 0) = 1 max NDVI
# NIR - red = (0 - 15) / (0 + 15) = -1 min NDVI

# dvi2006
dvi2006 <- mato2006[[1]] - mato2006[[2]]

# ndvi

ndvi1992 <- dvi1992 / (mato1992[[1]] + mato1992[[2]])
ndvi2006 <- dvi2006 / (mato2006[[1]] + mato2006[[2]])

im.multiframe(1,2)
plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

# DVI by imageRy
dvi1992 = im.dvi(mato1992, 1, 2)
dvi2006 = im.dvi(mato2006, 1, 2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

# NDVI via imageRy
ndvi1992 = im.ndvi(mato1992, 1, 2)
ndvi2006 = im.ndvi(mato2006, 1, 2)
plot(ndvi1992, col=mako(100))
plot(ndvi2006, col=mako(100))

# Exercise: plot DVIs and NDVIs for the two dates in two rows and columns
im.multiframe(2, 2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))
plot(ndvi1992, col=magma(100))
plot(ndvi2006, col=magma(100))





