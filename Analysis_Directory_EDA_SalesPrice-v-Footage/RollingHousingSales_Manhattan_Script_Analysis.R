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


## do a bit of exploration to make sure there's not anything
## weird going on with sale prices
attach(mh)
hist(sale.price.n) 
detach(mh)

## keep only the actual sales

mh.sale <- mh[mh$sale.price.n!=0,]
plot(mh.sale$gross.sqft,mh.sale$sale.price.n)
plot(log10(mh.sale$gross.sqft),log10(mh.sale$sale.price.n))
