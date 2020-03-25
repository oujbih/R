
#Elegant way to report missing values in a data.frame
apply(is.na(Janvier_DATA),2,sum)
#RandomForest 
DATA.train <- DATA.train %>% mutate_if(is.character, as.factor)

is.finite(c(1, NA, Inf, NaN, -Inf))
#[1]  TRUE FALSE FALSE FALSE FALSE
