NEI <- readRDS("~/Downloads/project3/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/project3/Source_Classification_Code.rds")
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),] ##subset the SCC data by instances
## of coal.
NEI.coal <- merge(x=NEI, y=SCC.coal, by='SCC') ##merge the SCC coal data into NEI
Emission.sum <- aggregate(NEI.coal[, 'Emissions'], by=list(NEI.coal$year), sum)
## get the total Emissions for the year
colnames(Emission.sum) <- c('Year', 'Emissions')
##combustion-related emissions in the US from 1999 - 2008
ggplot(data=Emission.sum, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

