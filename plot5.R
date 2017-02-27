NEI <- readRDS("~/Downloads/project3/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/project3/Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
baltimore<- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
baltimoreOnRoad <- aggregate(baltimore[, 'Emissions'], by=list(baltimore$year), sum)
colnames(baltimoreOnRoad) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
ggplot(data=baltimoreOnRoad, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year),stat="identity") + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

