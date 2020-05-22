  #How to control number of minor grid lines in ggplot2?
  grid_df %>% 
  as.data.frame() %>% 
  ggplot(aes(x = V1,y = V2))+
  geom_point(col ="red")+
  geom_point(col="green",aes(y=V3))+
  scale_x_continuous(minor_breaks = seq(0.1,1,0.01)) #<--------------
