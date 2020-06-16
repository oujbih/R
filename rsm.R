library(rsm)
CR <- coded.data (ChemReact, x1~(Time-85)/5, x2~(Temp-175)/5)
CR.rs2 <- rsm (Yield ~ Block + SO(x1,x2), data=CR)
summary(CR.rs2)
persp(
    CR.rs2
  , x1 ~ x2
  , col = rainbow(50)
  , ticktype = "simple"
  , contour = ("colors")
  )

contour(CR.rs2, ~ x1 + x2, image = TRUE,  at = summary(CR.rs2)$canonical$xs)
