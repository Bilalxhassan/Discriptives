getwd()
setwd("C:/Users/Bilal/OneDrive/Desktop/Study folder/Data Analytics/assignment1")

library(tidyverse)
library(openxlsx)
library(readxl)
library (ggcorrplot)
library (stargazer)



#### Data ####
data <- read.xlsx("oecdwheat.xlsx")
head(data)

Discriptives <- data%>% select(Production,Imports, Consumption,Exports,Endingstocks,Areaharvested,Feed,Food,Otheruse,Yield,Humanconsumptionpercapita,directemmissions)%>%
      stargazer(type = "html",out="discriptives.html")



g <- data %>% filter(Consumption>0,years==1990 | years==2022) %>%
     ggplot(aes(x=Production,y=Consumption)) +geom_point(aes(col=as.factor(years))) +
     scale_color_manual("years",Value=c("1990"="Lightblue","2022"="darkblue")) + 
     labs(title="Production vs. Consumption", subtitle = "Comparison b/w year 1990 and 2022",
     x="Production", y="Consumption") + theme_classic()
     
  pdf(file = "Plot.pdf")
  g
  dev.off()
  
  
  g <- data %>% filter(Consumption>0,years==1990 | years==2022) %>%
    ggplot(aes(x=Production,y=Consumption)) +geom_point(aes(col=as.factor(years))) + 
    labs(title="Production vs. Consumption", subtitle = "Comparison b/w year 1990 and 2022",
         x="Production", y="Consumption") + theme_classic()
  
  
  
  g <- data %>%  ggplot(aes(x=Production,y=Consumption)) +geom_point(aes(col=as.factor(years))) + 
    labs(title="Production vs. Consumption", subtitle = "Comparison b/w year 1990 to 2030",
         x="Production", y="Consumption") + theme_classic()
  
  pdf(file = "Plot.pdf")
  g
  dev.off()