library(terra)
library(imageRy)

setwd("C:\\teleril")
getwd()
list.files()

richat=rast("richatstructure_oli_20260306.jpg")
richat=flip(richat)
plot(richat)

png("figura.png")
plot(richat)
dev.off()

png("figura2.png")
par(mfrow=c(2,1))
plot(richat[[1]])
plot(richat[[2]])
dev.off()

#da chat gpt istogrammi bande
png("figura3.png")
par(mfrow=c(2,2))
hist(richat[[1]], main="Istogramma Banda 1", col="red")
hist(richat[[2]], main="Istogramma Banda 2", col="green")
hist(richat[[3]], main="Istogramma Banda 3", col="blue")
dev.off()
#possibile anche ciclo for 


