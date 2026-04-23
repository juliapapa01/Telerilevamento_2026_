library(qrcode)
setwd("C:\\teleril")
url <- "https://github.com/juliapapa01"
 
qr <- qr_code(url)
 
png("github_profile_qr.png", width = 1000, height = 1000)
plot(qr)
dev.off()
