
NEI <- readRDS("~/Downloads/project3/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/project3/Source_Classification_Code.rds")
pollutant <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
pollutant$x<-pollutant$x/1000 
barplot(pollutant$x, names.arg=pollutant$Group.1, 
            main=expression('Total Emission of PM'[2.5]),
            xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
