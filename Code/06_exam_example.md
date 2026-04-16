# Titolo del progetto d'esame

L'area di studio bla bla bla bla bla blabla bla blabla bla blabla bla blabla bla bla

## Pacchetti utilizzati
Per quresto esame bla bla bla pacchetti:

```r
library(terra) #bla bla bla
library(imageRy) #...
```

## Importazione dei dati
I dati sono stati scaricati da - link a dati- https://science.nasa.gov/earth/earth-observatory/eyeing-the-richat-structure/

oppure: [Earth Observatory](https://science.nasa.gov/earth/earth-observatory/eyeing-the-richat-structure/)

codice- selzioniamo la wd:

setwd(C:\\teleril)
getwd()
list.files()

per importare i dati è stata usata la funz `rast` del pacchetto `terra


```
richat=rast("richatstructure_oli_20260306.jpg")
richat=flip(richat)
plot(richat)
```
trascino immagine richatpng
<img width="480" height="480" alt="figura" src="https://github.com/user-attachments/assets/55b6e1ad-6543-4268-9fcd-d07864e95a30" />


## Analisi esplorativa
<img width="480" height="480" alt="figura2" src="https://github.com/user-attachments/assets/5f4e13e7-5711-42e5-a83b-1b73ee5a85b9" />

plottaggio delle singole bande 

```
png("figura2.png")
par(mfrow=c(2,1))
plot(richat[[1]])
plot(richat[[2]])
dev.off()
```

istogrammi
```
par(mfrow=c(2,2))
hist(richat[[1]], main="Istogramma Banda 1", col="red")
hist(richat[[2]], main="Istogramma Banda 2", col="green")
hist(richat[[3]], main="Istogramma Banda 3", col="blue")
```
<img width="480" height="480" alt="figura3" src="https://github.com/user-attachments/assets/09dbe0e3-16e5-45a4-93dc-7bb2dea32335" />










