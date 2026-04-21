# Classifying remotely sensed data
# https://zenodo.org/records/19660762

library(terra)
library(imageRy)
library(ggplot2)
# install.packages("patchwork")
library(patchwork)


im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sunc <- im.classify(sun, num_clusters=3)

# 1st class in my case = high energy
# 2nd class in my case = medium energy
# 3rd class in my case = low energy

#---- Matogrosso example

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m1992 <- flip(m1992)
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m2006 <- flip(m2006)

im.multiframe(1,2)
plot(m1992)
plot(m2006)

m1992c <- im.classify(m1992, num_clusters=2)
# in my case!:
# forest = class1
# human = class2

# m1992c <- as.factor(m1992c)

# Assign labels
levels(m1992c) <- data.frame(
  value = c(1, 2),
  label = c("forest", "human")
)

# im.barplot() -> copy/paste from imageRy
im.barplot(m1992c)

m2006c <- im.classify(m2006, num_clusters=2)
# in my case!:
# forest = class2
# human = class1

# m2006c <- as.factor(m2006c)

# Assign labels
levels(m2006c) <- data.frame(
  value = c(2, 1),
  label = c("forest", "human")
)

# barplot
im.barplot(m2006c)

# patchwork
p1 <- im.barplot(m1992c, perc=T)
p2 <- im.barplot(m2006c, perc=T)
p1 + p2

# percentages
p1 <- im.barplot(m1992c, perc=T, rescale=T)
p2 <- im.barplot(m2006c, perc=T, rescale=T)
p1 + p2
