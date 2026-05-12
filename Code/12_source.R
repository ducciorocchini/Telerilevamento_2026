setwd("~/Desktop")

source("im.kernel.txt")

library(imageRy)

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
im.kernel(sun)
