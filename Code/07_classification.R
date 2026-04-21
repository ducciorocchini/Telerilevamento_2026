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







