# Assume normal distribution of bank angles, say between 0 and 10°.
# How would this affect SW during calibration?
# 

bank <- seq(0, 15, 0.5)

sw <- gsdOblique2(f = 28, phi = (bank + 15) * pi/180)
sw$ratio <- sw$stripwidth / min(sw$stripwidth)
plot(sw$ratio ~ bank, cex = 0.4)
