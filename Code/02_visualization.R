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




