### Oblique geometry calculator II
### HLF 20180809
### What is the GSD (cm resolution of a digital camera) at different focal lengths (zoom), angle from vertical, and height above ground?

### Initial work-through ----
# Camera data -----
f <- 35 # Focal length in mm
Sw <- 23.2 # Sensor width in mm
Sh <- 15.4 # Sensor height in mm
Pw <- 6016 # Sensor pixel width in pixels
Ph <- 4000 # Sensor pixel height in pixels

## Positioning data -----
h <- 450 / 3.28 # Height AGL in m
phi <- 45 * pi / 180 # Inclination angle in radians from vertical (0°)

gsdOblique <- function(Sw, f, Sh, phi, h, Pw) {
  ## Angle of view ----
  a.h <- 2 * atan((Sw / 2) / f) # horizonal angle of view°
  a.v <- 2 * atan((Sh / 2) / f) # vertical angle of view°
  
  ## Strip width ----
  # w.1 - From zero (under aircraft) to inside edge of image
  # w.2 - From zero to outside edge
  # w.0 - width of image on ground
  
  w.1 <- tan((phi - (a.v / 2))) * h 
  w.2 <- tan((phi + (a.v / 2))) * h
  w.0 <- w.2 - w.1
  
  ## GSD at various angles ----
  ## (calculated from field of view)
  # h.1 <- dist from lens to bottom of field of view
  # h.2 <- dist from lens to top of FOV
  # v.1 <- width of FOV bottom
  # v.2 <- width of FOV top
  
  h.1 <- sqrt(h^2 + w.1^2)
  h.2 <- sqrt(h^2 + w.2^2)
  
  v.1 <- 2 * (tan(a.h/2)) * h.1 # inner frame width
  v.2 <- 2 * (tan(a.h/2)) * h.2 # outer frame width
  
  gsd.1 <- v.1 / Pw # GSD lower edge of image
  gsd.2 <- v.2 / Pw # GDS upper edge of image
  
  return(data.frame(gsd.inner = gsd.1, gsd.outer = gsd.2))
}
