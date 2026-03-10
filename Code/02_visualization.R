# R code for visualizing multispectral data

library(terra)  #spatial data
library(imageRy)  #satellite images
im.list()
#install viridis package
install.packages("viridis")
library(viridis)
library(ggplot2)
install.packages("patchwork")
library(patchwork)
#no install.packages("GGally")
# library(GGally)

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

#stack
sentinel=c(b2,b3,b4,b8)
plot(sentinel, col=inferno(100))

#print
b2
names(sentinel)
plot(sentinel$"file15c85ee6d7c")

#subset
#layer1=b2, layer2=b3, layer3=b4, layer4=b8
plot(sentinel[[4]])
plot(sentinel[[2]])
b2=im.import("sentinel.dolomites.b2.tif")
b3=im.import("sentinel.dolomites.b3.tif")
b4=im.import("sentinel.dolomites.b4.tif")
b8=im.import("sentinel.dolomites.b8.tif")
im.ggplot(b8)
p1=im.ggplot(b8)
p2=im.ggplot(b4)
p1+p2

#multiframe:
#1 par(mfrow=c(1,2))
#2 im.multiframe(1,2)
#3 stack
#4 ggplot2 patchwork

#RGB plotting
#stack
sentinel=c(b2, b3, b4, b8)

#1=b2 blue
#2=b3 green
#3=b4 red
#4=b8 NIR
#3 filters and 4 bands
par(mfrow=c(1,2))
im.plotRGB(sentinel, r=3, g=2, b=1) #natural colours
im.plotRGB(sentinel, r=4, g=3, b=2) #false colours

plot(sentinel[[4]])
im.plotRGB(sentinel, r=4, g=3, b=2)

#NIR on green
im.plotRGB(sentinel, r=3, g=4, b=2)

#NIR on blue component of the RGB scheme
im.plotRGB(sentinel, r=3, g=2, b=4)

#plot the four elements of rgb in a single multiframe
par(mfrow=c(2,2))
im.plotRGB(sentinel, r=3, g=2, b=1) 
im.plotRGB(sentinel, r=4, g=3, b=2)
im.plotRGB(sentinel, r=3, g=4, b=2)
im.plotRGB(sentinel, r=3, g=2, b=4)

#positioning of visible bands
par(mfrow=c(1,2)) 
im.plotRGB(sentinel, r=4, g=3, b=2) 
im.plotRGB(sentinel, r=4, g=2, b=3)

pairs(sentinel) 

#simplifying the function
im.plotRGB(sentinel, 4, 2, 3)

#plotRGB() from terra
plotRGB(sentinel, 4,2,3, stretch="lin")
plotRGB(sentinel, 4,2,3, stretch="hist")
