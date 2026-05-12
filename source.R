setwd("C:\\teleril")
 
list.files()
# [15]

source("kernel.txt")
library(imageRy)
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

kernsd = im.kernel(sun[[1]], stat="sd")
