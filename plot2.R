# open the RDS files
NEI <- readRDS("/home/ljubo/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("/home/ljubo/Desktop/Source_Classification_Code.rds")

# prepare the data to be plotted
data <- NEI[NEI$fips == "24510",]
data <- aggregate((data$Emissions)/10^3 ~ data$year, FUN="sum")

#prepare for generating the png file
png(filename="~/Desktop/ExData_Plotting2/plot2.png", 
    units="px", 
    width=480, 
    height=480,
    pointsize=8,
    res=150)

# using the base plotting system, visualize the results
barplot(data$`(data$Emissions)/10^3`,data$`data$year`, col="red", main="Total PM2.5 emissions in the Baltimore City", names.arg=data$`data$year`, ylab="Total PM2.5 Emissions from all sources (in million tonnes)", xlab="Year")

dev.off()