# R code for visualizing multispectral data

library(terra)  #spatial data
library(imageRy)  #satellite images
im.list()
#install viridis package
install.packages("viridis")
library(viridis)

#sentinel2 (Copernicus) bands
# https://gisgeography.com/sentinel-2-bands-combinations/

b2=im.import("sentinel.dolomites.b2.tif")
plot(b2)

#changing colours
cl=colorRampPalette(c("red", "gold1", "darkslategray3"))(100)
plot(b2,col=cl)

#fewer nuances
cl=colorRampPalette(c("red", "gold1", "darkslategray3"))(3)
plot(b2,col=cl)

#using viridis to change colours
plot(b2, col=inferno(100))
plot(b2, col=mako(100))

#grayscale
cl=colorRampPalette(c("dark gray","gray","light gray"))(100)
plot(b2,col=cl)

#par
par(mfrow=c(1,2))
plot(b2, col=inferno(100))
plot(b2,col=cl)
dev.off()
#alternative
im.multiframe(1,2)
plot(b2, col=inferno(100))
plot(b2,col=cl)

#
library(terra)  #spatial data
library(imageRy)  #satellite images
library(viridis)
b2=im.import("sentinel.dolomites.b2.tif")
plot(b2)

#importing band 3 -Green
im.list()
b3=im.import("sentinel.dolomites.b3.tif")
plot(b3, col=rocket(100))

#importing band 4-Red
b4=im.import("sentinel.dolomites.b4.tif")
plot(b4, col=magma(100))

#importing band 8 -NIR
b8=im.import("sentinel.dolomites.b8.tif")
plot(b8, col=magma(100))

#excercise- multiframe with 4 bands
par(mfrow=c(2,2))
cl2=colorRampPalette(c("blue2","blue","cadetblue1"))(100)
plot(b2,col=cl2)
cl3=colorRampPalette(c("chartreuse4","chartreuse3","chartreuse"))(100)
plot(b3,col=cl3)
cl4=colorRampPalette(c("firebrick4","firebrick3","firebrick1"))(100)
plot(b4,col=cl4)
cl8=colorRampPalette(c("orchid4","orchid3","orchid1"))(100)
plot(b8,col=cl8)

#comparing 
plot(b2, col=magma(100))
plot(b3, col=magma(100))
plot(b4, col=magma(100))
plot(b8, col=magma(100))

