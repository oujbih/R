#https://briatte.github.io/ggcorr/
library(GGally)
ggcorr(Fevrier_DATA,
       nbreaks = 6,
       hjust = 0.9,
       label = TRUE,
       label_size = 3,
       layout.exp = 1,
       color = "grey50")

ggsave("cor.png",path = "R/",width =11,height = 6)
