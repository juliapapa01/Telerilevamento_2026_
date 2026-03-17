library(terra)
library(imageRy)
library(viridis)

im.list()
#importing data
mato1992=im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992=flip(mato1992)

#l1=NIR , l2=red , l3=green
im.plotRGB(mato1992, 1, 2, 3)

#NIR on top of the green component of the RGB scheme
im.plotRGB(mato1992, 2, 1, 3)
#blue
im.plotRGB(mato1992, 2, 3, 1)

#2006 image
mato2006=im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006=flip(mato2006)
im.plotRGB(mato2006, 1, 2, 3)

#multiframe
par(mfrow=c(1,2))
im.plotRGB(mato2006, 1, 2, 3)
im.plotRGB(mato1992, 1, 2, 3)

plotRGB(mato1992, 1,2,3, stretch="hist")
plotRGB(mato2006, 1,2,3, stretch="hist")

im.plotRGB(mato1992, 2, 1, 3)
im.plotRGB(mato2006, 2, 1, 3)

#DVI
dvi1992=mato1992[[1]]-mato1992[[2]]
plot(dvi1992)
#8 bit
NIR-red=255-0=255 #max DVI
NIR-red=0-255=-255 #min DVI
#range= -255, 255

#min and max DVI for an image composed by data at 4 bit
#range= -15, 15

#NDVI
#8 bit
(255-0)/(255+0)=1 #max NDVI
(0-255)/(0+255)=-1 #min NDVI
#4 bit
(15-0)/(15+0)=1 #max NDVI
(0-15)/(0+15)=-1 #min NDVI

#dvi 2006
dvi2006=mato2006[[1]]-mato2006[[2]]

#comparing ndvi
ndvi1992=dvi1992/(mato1992[[1]]+mato1992[[2]])
ndvi2006=dvi2006/(mato2006[[1]]+mato2006[[2]])
par(mfrow=c(1,2))
plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

#dvi by imageRy
dvi1992=im.dvi(mato1992, 1, 2) #levels 1 and 2
dvi2006=im.dvi(mato2006, 1, 2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

#ndvi via imageRy
ndvi1992=im.ndvi(mato1992, 1, 2)
ndvi2006=im.ndvi(mato2006, 1, 2)
plot(ndvi1992, col=mako(100))
plot(ndvi2006, col=mako(100))

#multiframe
par(mfrow=c(2,2))
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))
plot(ndvi1992, col=magma(100))
plot(ndvi2006, col=magma(100))


