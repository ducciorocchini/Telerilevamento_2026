# packages needed
# in case they are not installed a check is done
# automatic installation is then performed 
pkgs <- c("terra", "imageRy", "ggridges", "ggplot2", "viridis", "patchwork")
invisible(lapply(pkgs, function(p) {
  if (!require(p, character.only = TRUE)) install.packages(p)
  library(p, character.only = TRUE)
}))

# importing data
p1 <- rast("p1.png")
p2 <- rast("p2.png")

# plotting in the tidyverse thanks to functions of 
# imageRy applied to raster data 
plot1 <- im.ggplotRGB(p1, 1, 2, 3)
plot2 <- im.ggplotRGB(p2, 1, 2, 3)
plot3 <- im.ridgeline(p1, scale=2)
plot4 <- im.ridgeline(p2, scale=2)

# coupling plots by the patchwork package
plot1 + plot2 + plot3 + plot4
