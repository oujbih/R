
#Elegant way to report missing values in a data.frame
apply(is.na(Janvier_DATA),2,sum)
#RandomForest 
DATA.train <- DATA.train %>% mutate_if(is.character, as.factor)

is.finite(c(1, NA, Inf, NaN, -Inf))
#[1]  TRUE FALSE FALSE FALSE FALSE

#color top
library(RColorBrewer)
n <- 60
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

qual_col_pals = RColorBrewer::brewer.pal.info[RColorBrewer::brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(RColorBrewer::brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))
pie(rep(1,n), col=sample(col_vector, n))

#RandomForest Plot importante variables
imp <- cbind.data.frame(Feature=rownames(rf$importance),rf$importance)
g <- ggplot(imp, aes(x=reorder(Feature, MeanDecreaseGini), y=MeanDecreaseGini))
g + geom_bar(stat = 'identity',fill=sample(col_vector, 14)) + xlab('les vaiaibles ')+ylab("L'importance")+coord_flip()

#ggplot
#https://www.r-graph-gallery.com/279-plotting-time-series-with-ggplot2.html
My_data_CPT %>% 
  ggplot(aes(as.Date(DATE),`CPT 400`)) +
  geom_line(color=colooor[1])+
  geom_point(color=colooor[2], size=2)  +
  geom_smooth()+xlab("")+
  scale_x_date(date_labels = "%d-%b",
               date_minor_breaks = "1 day",
               date_breaks = "2 day"
               #limit=c(as.Date("2020-01-01"),as.Date("2020-01-10"))
               )+
  # ylim(0,60)+
  theme(axis.text.x=element_text(angle=60, hjust=1))
ggsave(paste("CPT400",".png",sep = ""),path = "images",scale =3)


##SAVE DATA IN TO XLSX AND RDA
library(xlsx)
save(Model_data_CPT,file="CPT_DSP.Rda")
write.xlsx2(Model_data_CPT,"CPT_DSP.xlsx")

