# First R script

2 + 3

# oggetti e assegnazione
michele <- 2 + 3
michele

tecla <- 4 + 6

# tutte le operzioni
michele + tecla
michele ^ tecla
michele / tecla

# arrays o vettori
sonia <- c(10, 8, 3, 1, 0)   # funzione e argomenti
giorgia <- c(3, 10, 20, 50, 100)

plot(giorgia, sonia)
plot(giorgia, sonia, col="blue", pch=19)
plot(giorgia, sonia, col="blue", pch=19, cex=2)
plot(giorgia, sonia, col="blue", pch=19, cex=2, xlab="pollution", ylab="numero di delfini")

# installazione pacchetti
# CRAN
install.packages("terra")
library(terra)

# GitHUb
install.packages("devtools") # remotes
library(devtools)  # remotes
install_github("ducciorocchini/imageRy")
library(imageRy)
im.list()



