library(qrcode)
 
url <- "https://github.com/ducciorocchini"
 
qr <- qr_code(url)
 
png("github_profile_qr.png", width = 1000, height = 1000)
plot(qr)
dev.off()
