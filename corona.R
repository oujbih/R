#########################################
# OUJBIH ABDERRAHIM              ########
# 21/03/2020                     ########
# EMI                            ########
#########################################

# importation des packages----------------------------------------------------------
library(readxl)
library(ggplot2)
library(dplyr)
library(forecast)
library(smooth)
#reader data

My_data <- read_excel("D:/bibio/R/excel/corona.xlsx")

My_data %>% 
  ggplot(aes(as.Date(DATE),Nombre,color=etat,label=Nombre,group=etat)) +
  geom_line(color="#2FFF40")+
  geom_point(color="#E140FF", size=2)  +
  geom_text(hjust = 1.8)+
  xlab("")+ylab("Nombre")+
  scale_x_date(date_labels = "%d-%b",
               date_minor_breaks = "1 day",
               date_breaks = "2 day"
               #limit=c(as.Date("2020-01-01"),as.Date("2020-01-10"))
  )+
  # ylim(0,60)+
  theme(axis.text.x=element_text(angle=60, hjust=1))

tmp <- ma(My_data$Nombre,order=3,h=7)

ourModel <- sma(My_data$Nombre,order=7,h=7)

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))

#arima 
corona_ts <- ts(My_data$Nombre,frequency = 30)

fit<-auto.arima(corona_ts, seasonal=TRUE)
pacf(resid(fit))
fcast <- forecast(fit, h=12)
plot(fcast)
fcast$mean
