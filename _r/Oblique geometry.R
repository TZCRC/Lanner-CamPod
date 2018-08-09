### GSD oblique
### 20171201 HLF
### ### Examining pixel size geometry for normal RSO setup 
# distance ~ tan(Ø) * AGL

strip <- data.frame(deg = seq(38.4, 65.4, length.out = 25))
agl <- 109 # m
pixels <- 4016 # Portrait or landscape?

strip$dist <- tan(strip$deg*pi/180) * agl
strip$inc <- NA
for (i in 2:NROW(strip)) { strip$inc[i] <- strip$dist[i] - strip$dist[i - 1]}

strip$px <- pixels / NROW(strip)
strip$gsd <- strip$inc/strip$px

plot(strip$gsd * 100 ~ strip$deg, xlab = 'Degrees from vertical', ylab = 'cm resolution', ylim = c(0, 8), cex = 0.7)
abline(h = 2.5, col = 'green', lwd = 2, lty = 2)

# 45° angle
strip <- data.frame(deg = seq(31.5, 58.5, length.out = 25))
agl <- 109 # m
pixels <- 4016 # Portrait or landscape?

strip$dist <- tan(strip$deg*pi/180) * agl
strip$inc <- NA
for (i in 2:NROW(strip)) { strip$inc[i] <- strip$dist[i] - strip$dist[i - 1]}

strip$px <- pixels / NROW(strip)
strip$gsd <- strip$inc/strip$px

plot(strip$gsd * 100 ~ strip$deg, xlab = 'Degrees from vertical', ylab = 'cm resolution', ylim = c(0, 8), cex = 0.7)
abline(h = 2.5, col = 'green', lwd = 2, lty = 2)
