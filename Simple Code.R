library(tidyverse)
library(ggplot2)
#load somestuff
dat <- read.csv("archive/Final Dataset.arff", header=FALSE, comment.char = "@")
head(dat)
View(dat)
df <- dat[1:345, c('V3','V4','V5','V6','V7','V12')]
names(df) <- c('Category','Risk_Category', 'Probability','Magnitude_Risk','Impact','Priority')
head(df)
#check what's up with the data
sapply(df, function(x) sum(is.na(x)))
adf <- df[!(df$Category=="" | df$Risk_Category=="" | df$Probability=="" | df$Magnitude_Risk=="" | df$Impact=="" | df$Priority==""), ]
adf$Priority
#normal cleaning
adf <- adf[!(adf$Priority=="Schedule"), ]
adf <- adf[!(adf$Priority=="Medium"), ]
adf <- adf[!(adf$Priority=="moderate"), ]
adf <- adf[!(adf$Priority=="'Planning and Control'"), ]
adf <- adf[!(adf$Priority=="'Very Low'"), ]
adf <- adf[!(adf$Priority=="Low"), ]
# must remember how to clean more easily
min(adf$Priority)
max(adf$Priority)
#now they work. 
adf$Priority <- as.numeric(adf$Priority)
#let's check the graphic
plot(density(adf$Priority))
