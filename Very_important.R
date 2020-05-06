#
#Elegant way to report missing values in a data.frame
apply(is.na(Janvier_DATA),2,sum)
colSums(is.na(Boston))
str(data)
dplyr::mutate_all
####### realy important 
mutate(!!new_col_name :=blabla ) #you can use also mutate_
#library path
.libPaths() 
#RandomForest 
DATA.train <- DATA.train %>% mutate_if(is.character, as.factor)
# column name
colnames(dataframe)
names(df)[names(df) == 'old.var.name'] <- 'new.var.name'
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
#geom_text angle 
geom_text(nudge_y = 1,angle=60)
ggsave(paste("CPT400",".png",sep = ""),path = "images",scale =3)
ggsave(paste("suivi des perforance des cyclone",".png",sep = ""),path = "images",width =11,height = 6)

##SAVE DATA IN TO XLSX AND RDA
library(xlsx)
save(Model_data_CPT,file="CPT_DSP.Rda")
write.xlsx2(Model_data_CPT,"CPT_DSP.xlsx")

#log2(0.5)=-1 car ln(0.5)=-ln(2)

#: Remove the NA observations dplyr
na.omit()
#TODO 
#creat cv like is one https://www.seas.upenn.edu/~xuanyizh/
#Install multiple packages 
install.packages(c("caret", "glmnet", "randomForest", "ggplot2", "RhpcBLASctl"))
install.packages("xgboost", repos=c("http://dmlc.ml/drat/", getOption("repos")), type="source")

#load data 
data(Boston, package = "MASS")

#RandomForst
DATA.test <- rbind(DATA.train[1, ] , DATA.test)
DATA.test <- DATA.test[-1,]
DATA.testmp_regression$Qualité.y <- factor(DATA.testmp_regression$Qualité.y, levels = levels(DATA.traintmp$Qualité.y))
#Opposite of %in%
'%ni%' <- Negate('%in%')

#R squared in randomforest
#R^2 = ESS/TSS = 1 - RSS/TSS.

Moyenne <- mean(DATA.traintmp_regression$X40µm)
mutate(diff = Train-Predict,
                          diff2= Train-Moyenne,
                          a = diff^2,
                          b = diff2^2)


#Include other file in r 
source("name.R")
source("Function.R",encoding = "UTF-8")
unlink(".RData") 
 
#add 1 day in R
as.difftime(1, units="days")

#correlation 
library(corrplot)
corrplot::corrplot(cor)
corrplot::corrplot(cor,method = "number")

#remplace Na with lag 
 zoo::na.locf(m)

#ungroup after grouping 
%>% ungroup()
##decision tree

##Dashboard ------------
https://github.com/puikinsh/adminpro
https://themeselection.com/bootstrap-4-admin-template-github/
https://github.com/Appsilon/semantic.dashboard
https://github.com/yanyachen/MLmetrics
argonDash #https://rinterface.github.io/argonDash/


chooseSliderSkin("Nice") #cool
#TODO 
#graphique visualition 
#model test 



# impute missing data
library(mice) # not tested 

#overfitting #not fond 

#R and all package version 
print(paste("R", getRversion()))
print("-------------")
for (package_name in sort(loadedNamespaces())) {
    print(paste(package_name, packageVersion(package_name)))
}

#https://www.ecb.europa.eu/pub/pdf/scpwps/ecbwp1550.pdf for frequency problem
#neuralnet
DATA.traintmp_regression %>% 
  select_if(is.numeric) %>% 
  colnames()
maxs_train <- apply( DATA.traintmp_regression, 2, max) 
mins_train <- apply( DATA.traintmp_regression, 2, min)
scaled_train <- as.data.frame(scale(DATA.traintmp_regression, center = mins_train, scale = maxs_train - mins_train))

#Run python in R -https://rstudio.github.io/reticulate/articles/calling_python.html
library(reticulate)
py_run_file("name.py")
source_python("name.py")
#remove all variables from current working environment
rm(list=ls()) #all
rm(list=lsf.str()) #only function


#duplicated
duplicated
nrow(My_data_CPT_HG[duplicated(My_data_CPT_HG$X40µm),])
