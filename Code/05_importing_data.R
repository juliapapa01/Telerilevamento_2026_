#importing data- drone images
library(terra)
library(viridis)
library(imageRy)
library(patchwork)
library(ggridges)
library(ggplot2)

setwd("C:/teleril")
getwd()
list.files()

#?rast- creates a spatial raster
gre=rast("DJI_20260409152942_0001_MS_G.tiff")
plot(gre)
gre=flip(gre)
plot(gre, col=mako(100))

red=rast("DJI_20260409152942_0001_MS_R.tiff")
red=flip(red)
plot(red, col=mako(100))

nir=rast("DJI_20260409152942_0001_MS_NIR.tiff")
nir=flip(nir)
plot(nir, col=mako(100))

stack=c(gre,red,nir)
plot(stack)

plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, r=3, g=2, b=1, stretch="hist")

#multiframe
par(mfrow=c(1,2))
plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, r=3, g=2, b=1, stretch="hist")

#ndvi
ndvi=im.ndvi(stack, 3, 2)
plot(ndvi)

#export data
writeRaster(ndvi, "ndvi.tif")

#importing data
ndvi.2=rast("ndvi.tif")
plot(ndvi.2)

par(mfrow=c(1,2))
plot(ndvi.2)
plot(ndvi)

#exporting a figure, not data
par(mfrow=c(2,2))
plot(gre)
plot(red)
plot(nir)
plot(ndvi)

png("fig1.png")
par(mfrow=c(2,2))
plot(gre)
plot(red)
plot(nir)
plot(ndvi)
dev.off()

pdf("fig1.pdf")
par(mfrow=c(2,2))
plot(gre)
plot(red)
plot(nir)
plot(ndvi)
dev.off()

#
p1=im.ggplot(ndvi)
p2=im.ridgeline(ndvi, scale=1)
p2
p1+p2

pdf("fig1.pdf")
p1=im.ggplot(ndvi)
p2=im.ridgeline(ndvi, scale=1)
p1+p2
dev.off()

png("fig1.png")
p1=im.ggplot(ndvi)
p2=im.ridgeline(ndvi, scale=1)
p1+p2
dev.off()

gregt=rast("https://raw.githubusercontent.com/ducciorocchini/Telerilevamento_2026/main/Drone/DJI_20260331174728_0001_MS_NIR.TIF")
plot(gregt)

