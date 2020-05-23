  #How to control number of minor grid lines in ggplot2?
  grid_df %>% 
  as.data.frame() %>% 
  ggplot(aes(x = V1,y = V2))+
  geom_point(col ="red")+
  geom_point(col="green",aes(y=V3))+
  scale_x_continuous(minor_breaks = seq(0.1,1,0.01),
                     breaks =  seq(0.1,1,0.1),
                     labels = seq(0.1,1,0.1) )+
  # theme_bw() +
  theme(axis.text.x=element_text(size=rel(1.5), angle=90))

# Create graph for each column
graph <- lapply(names(factor),
    function(x) 
	ggplot(factor, aes(get(x))) +
		geom_bar() +
		theme(axis.text.x = element_text(angle = 90)))
