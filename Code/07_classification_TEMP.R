#code for classifying data

library(terra)
setwd("C:\\teleril")
list.files()
#import
tagl=rast("tagliam.jpg")
tagl=flip(tagl)
plot(tagl)

#classifying
taglc=im.classify(tagl, num_clusters=2)
taglc=im.classify(tagl, num_clusters=5)
