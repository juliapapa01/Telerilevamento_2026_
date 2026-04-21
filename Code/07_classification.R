#code for classifying data
library(terra)
library(imageRy)

im.list()

#importing
sun=im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plot(sun)

?im.classify

#classify
sunc=im.classify(sun)
sunc=im.classify(sun, seed=3)
sunc=im.classify(sun, seed=42)

#importing Grand Canyon data
can=im.import("dolansprings_oli_2013088_canyon_lrg.jpg")
plot(can)

#classifying Grand Canyon data
canc=im.classify(can, num_clusters=4, seed=42)

#mato grosso example
im.list()

m2006=im.import("matogrosso_ast_2006209_lrg.jpg")
m1992=im.import("matogrosso_l5_1992219_lrg.jpg")
par(mfrow=c(1,2))
plot(m2006)
plot(m1992)

#classification
m1992c=im.classify(m1992, seed=42, num_clusters=2)

# Assign labels- 2 livelli a cui assegno le etichette (rinomina)
levels(m1992c) <- data.frame(
  value = c(1, 2),
  label = c("forest", "human")
)
plot(m1992c)

m2006c=im.classify(m2006, seed=42, num_clusters=2)
# Assign labels- 2 livelli a cui assegno le etichette (rinomina)
levels(m2006c) <- data.frame(
  value = c(2, 1),
  label = c("forest", "human")
)
plot(m2006c)

#pixel percentage in the two classes
#frequencies
f1992=freq(m1992c)
prop1992=f1992$count/ncell(m1992c)

#percentages
perc1992=prop1992*100

f2006=freq(m2006c)
prop2006=f2006$count/ncell(m2006c)
perc2006=prop2006*100

#table
tabout=data.frame(
  class=c("forest","human"),
         perc1992=c(83, 17),
         perc2006=c(45, 55)
         )






