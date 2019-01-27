# open the RDS files
NEI <- readRDS("/home/ljubo/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("/home/ljubo/Desktop/Source_Classification_Code.rds")

# prepare the data to be plotted
data <- aggregate((NEI$Emissions)/10^6 ~ NEI$year, FUN="sum")

#prepare for generating the png file
png(filename="~/Desktop/ExData_Plotting2/plot1.png", 
    units="px", 
    width=480, 
    height=480,
    pointsize=8,
    res=150)

# using the base plotting system, visualize the results
barplot(data$`(NEI$Emissions)/10^6`,data$`NEI$year`, col="red", main="Total PM2.5 emissions in the USA", names.arg=data$`NEI$year`, ylab="Total PM2.5 Emissions from all sources (in million tonnes)", xlab="Year")

dev.off()