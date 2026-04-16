# Questo sarà il titolo del mio progetto di esame

La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio La'rea di studio 

Ho scelto la Mauritania perché....

<p align="center">
  <img src="https://github.com/user-attachments/assets/bfc8a930-c532-46ba-8d7a-b2afc4578402" width="800">
</p>

## Pacchetti utilizzati

Per questo esame blablabla p'acchetti:

``` r
library(terra) # pacchetto per ....
library(imageRy) # per multiframe e altro 
```

## Importazione dei dati
I dati sono stati scaricati da Earth Observatory: https://science.nasa.gov/earth/earth-observatory/eyeing-the-richat-structure/

Oppure posso scrivere così: [Earth Observatory](https://science.nasa.gov/earth/earth-observatory/eyeing-the-richat-structure/)

Il codice utilizzato è ilseguente; prima di tutto selezionniamo la working dirtectory:

``` r
setwd("~/Desktop/")
# c://blablabla/lknlnln

getwd()

list.files() 
```

per importare i dati è stata utilizzata la funzione `rast()` del pacchetto `terra`:

``` r
richat <- rast("richatstructure_oli_20260306.jpg")
richat <- flip(richat)
plot(richat)
```

<img width="480" height="480" alt="figura" src="https://github.com/user-attachments/assets/24999062-b873-476c-af85-64911d85cf28" />

## Analisi esplorativa

Prima di tuto blablabla plottaggio di singole bande:

``` r
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
```

<img width="480" height="480" alt="bande" src="https://github.com/user-attachments/assets/0bc2a4e7-3730-4775-9a26-e61c2573ec45" />

Siccome sono pigro, ho usato un ciclo for:

``` r
par(mfrow=c(2,2))

colori <- c("red", "green", "blue")

for(i in 1:nlyr(richat)) {
  hist(richat[[i]],
       main=paste("Istogramma banda", i),
       xlab="Valori digitali",
       col=colori[i],
       border="white")
}
```
<img width="1200" height="800" alt="istogrammi_bande_colorati" src="https://github.com/user-attachments/assets/a9131ee4-2735-4a98-9210-53b272ca0cef" />
