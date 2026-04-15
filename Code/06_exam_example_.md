# Ice spread: questo è il titolo della presentazione da fare all'esame

<img width="275" height="183" alt="download" src="https://github.com/user-attachments/assets/2faf1aeb-6d5c-4113-947c-f1f5425a5d30" />

In questa riga scrivo l'intro alle mie analisi.

## Immagine satellitare da internet: dati di input

L'immagine è stata scaricata da Earth Observatory:
https://science.nasa.gov/earth/earth-observatory/contours-of-the-james-bay-lowlands/

L'immagine è stata scaricata da [Earth Observatory](
https://science.nasa.gov/earth/earth-observatory/contours-of-the-james-bay-lowlands/)

Pacchetti usati in R:

``` r
library(terra) # package to manage spatial data
library(imageRy) # package for RS didactics
```

Importazione dei dati tramite `setwd()`:
``` r
setwd("~/Desktop/")
getwd()
list.files()
```

Dati importati via `rast()`:
``` r
ice <- rast("ISS074-E-417243.jpg")
```

## Plottaggio delle singole bande

Le singole bande sono state plottate usando un ultiframe:
``` r
im.multiframe(2,1)
plot(ice[[1]])
plot(ice[[2]])
```

Questo l'output del plottaggio:

<img width="480" height="480" alt="prime_due_band" src="https://github.com/user-attachments/assets/88e14ce4-b8a4-462e-9a65-54507ad2724f" />

> Nota:l'immagine è già stata analizzata da Earth Observatory

Se vogliamo inserire un elenco puntato è sufficiente usare il +:
+ punto dell'elenco
+ punto dell'elenco
+ punto dell'elenco

Istogframmi per la mia immagine:
``` r
im.multiframe(3,1)
hist(values(ice[[1]]), main="Istogramma Red", col="red")
hist(values(ice[[2]]), main="Istogramma Green", col="green")
hist(values(ice[[3]]), main="Istogramma Blue", col="blue")
```
Output:

<img width="480" height="480" alt="ist" src="https://github.com/user-attachments/assets/79c029d7-33ed-484c-8cfc-45c11148e76f" />


