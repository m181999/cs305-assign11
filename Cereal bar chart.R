
#installing google API package 'googleVis'
install.packages("googleVis")
library(googleVis)
suppressPackageStartupMessages (library (googleVis))

#reading CSV file
cereal = read.csv("/Users/michellemeyers/Desktop/CS 315/Data/cereal.csv", header = TRUE)
head(cereal)

#defining gvisBarChart function
barplt = gvisBarChart(cereal, xvar = "name", yvar = c("calories"),
                      options = list(orientation = "horizontal", width = 1400,
                                     height = 500,title = "Calories in Cereal",
                                     legend = "none",
                                     hAxis = "{title :'Cereal',titleTextStyle :{color:'black'}}",
                                     vAxis = "{title : 'Calories', ticks : [0,10, 20, 30, 40,50,60,70,80,90,100,110,120,130,140],titleTextStyle :{color: 'black'}}",
                                     bar = "{groupWidth: '50%'}"))

plot(barplt)