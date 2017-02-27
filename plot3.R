
NEI <- readRDS("~/Downloads/project3/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/project3/Source_Classification_Code.rds")
baltimore<-subset(NEI, NEI$fips==24510)    ##subset Baltimore area
baltimore$year <- factor(baltimore$year, levels=c('1999', '2002', '2005', '2008')) ##factor the 
##data by the year

## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 

ggplot(data=baltimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') 
