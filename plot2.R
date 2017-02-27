NEI <- readRDS("~/Downloads/project3/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/project3/Source_Classification_Code.rds")
baltimore<-subset(NEI, NEI$fips==24510)           #Subset Baltimore area
BaltimoreEmissions<-tapply(baltimore$Emissions, INDEX=baltimore$year, sum)   #Sum emissions per year
barplot(BaltimoreEmissions, main="Total Emissions in Baltimore, MD by Year",
        xlab="Year", ylab="Emissions")
