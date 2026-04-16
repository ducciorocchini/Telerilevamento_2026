library(terra)
library(imageRy)

setwd("~/Desktop/")
# c://blablabla/lknlnln

getwd()

list.files() 

richat <- rast("richatstructure_oli_20260306.jpg")
richat <- flip(richat)

png("figura.png")
plot(richat)
dev.off()

png("bande.png")
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
dev.off()

# Da chatGPT

png("istogrammi_bande.png", width=1200, height=800)
par(mfrow=c(2,2))   # imposta una griglia 2x2, una casella resterà vuota se hai 3 bande

hist(values(richat[[1]]),
     main="Istogramma banda 1",
     xlab="Valori digitali",
     col="grey")

hist(values(richat[[2]]),
     main="Istogramma banda 2",
     xlab="Valori digitali",
     col="grey")

hist(values(richat[[3]]),
     main="Istogramma banda 3",
     xlab="Valori digitali",
     col="grey")

dev.off()


# Ciclo for

png("istogrammi_bande_colorati.png", width=1200, height=800)
par(mfrow=c(2,2))

colori <- c("red", "green", "blue")

for(i in 1:nlyr(richat)) {
  hist(richat[[i]],
       main=paste("Istogramma banda", i),
       xlab="Valori digitali",
       col=colori[i],
       border="white")
}

dev.off()
