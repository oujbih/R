
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
pie(rep(1,n), col=sample(col_vector, n))
