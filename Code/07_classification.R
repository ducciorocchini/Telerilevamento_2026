# Code for classifying data

library(terra)
library(imageRy)

# set wd
setwd("~/Downloads")
# C://utenteovveroio/Downloads/
getwd()

# listing files
im.list()

# import
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# classify
sunc <- im.classify(sun)
sunc <- im.classify(sun, seed=3)
sunc <- im.classify(sun, seed=42)

# import Grand Canyon data
can <- im.import("dolansprings_oli_2013088_canyon_lrg.jpg")

# classify grand canyon data
cancc <- im.classify(can, seed=42, num_clusters=4)

# classifying data out of R
list.files()

# import data
getwd()
dji <- rast("dji.jpg")
dji <- flip(dji)
plot(dji)

# classify data
djic <- im.classify(dji, num_clusters=2)

# Mato grosso examples
im.list()

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg") 
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")    

im.multiframe(2,1)
plot(m1992)
plot(m2006)

# classification
m1992c <- im.classify(m1992, seed=42, num_clusters=2)

# Assign labels
levels(m1992c) <- data.frame(
  value = c(1, 2),
  label = c("forest", "human")
)

m2006c <- im.classify(m2006, seed=42, num_clusters=2)

# Assign labels
levels(m2006c) <- data.frame(
  value = c(2, 1),
  label = c("forest", "human")
)

# Calculating frequencies
f1992 <- freq(m1992c) 

prop1992 <- f1992$count / ncell(m1992c)

perc1992 <- prop1992 * 100

# Calculating frequencies
f2006 <- freq(m2006c) 

prop2006 <- f2006$count / ncell(m2006c)

perc2006 <- prop2006 * 100

# Table
tabout <- data.frame(
  class=c("Forest","Human"),
  perc1992=c(83, 17),
  perc2006=c(45, 55)
  )
