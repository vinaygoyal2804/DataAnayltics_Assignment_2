#Question 1
library(RJSONIO)
library(rjson)

js<-'[{"name": null, "release_date_local": null, "title": "3 (2011)",
"opening_weekend_take": 1234, "year": 2011,
"release_date_wide": "2011-09-16", "gross": 59954}]'

#Assigning JSON to a variable js
js <- fromJSON(js)
#Converting null values to NA
js <- lapply(js, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})
#Calling the result
do.call("rbind", js)

#Question 2
library(purrr)
library(tidyverse)
library(jsonlite)

#Defining my directory
path <- "C:/Desktop/JSONFILES"
files <- dir(path, pattern = "*.json")

#Transfering all the files into 1 dataframe
data <- files %>%
  map_df(~fromJSON(file.path(path, .), flatten = TRUE))

#Question 3

#Creating a Dataset
dataset <- c(4,7,9,1,10,15,18,19,3,16,10,16,12,22,2,23,16,17)

#Makibng Bins
a<- data.frame(dataset, bin=cut(dataset, c(1,4,9,17,23), include.lowest=TRUE))




