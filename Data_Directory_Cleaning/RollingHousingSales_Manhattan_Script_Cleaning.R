# Author: Jack K. Rasmus-Vorrath
# Code modeled on pages 49-50 of O'Neil and Schutt
# Cf. http://www1.nyc.gov/site/finance/taxes/property-rolling-sales-data.page


setwd("C://Users//jkras//Desktop//R_Projects//RollingHousingSalesNYC")

library(plyr)

# read csv file
mh <- read.csv("rollingsales_manhattan.csv",skip=4,header=TRUE)

## Check the data
head(mh)
summary(mh)
str(mh) # Very handy function!
#Compactly display the internal structure of an R object.


# Clean/format the data with regular expressions
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
## We create a new variable that is a "clean' version of sale.price.
## And sale.price.n is numeric, not a factor.

mh$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", mh$SALE.PRICE))
count(is.na(mh$SALE.PRICE.N))

names(mh) <- tolower(names(mh)) # make all variable names lower case

## Get rid of leading digits
mh$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", mh$gross.square.feet))
mh$land.sqft <- as.numeric(gsub("[^[:digit:]]","", mh$land.square.feet))
mh$year.built <- as.numeric(as.character(mh$year.built))
