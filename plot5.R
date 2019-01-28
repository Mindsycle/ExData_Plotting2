# open the RDS files
NEI <- readRDS("/home/ljubo/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("/home/ljubo/Desktop/Source_Classification_Code.rds")

# prepare the data to be plotted
motor <- grepl("motor",SCC$Short.Name,ignore.case=TRUE)
vehicle <- grepl("vehicle",SCC$Short.Name,ignore.case=TRUE)
mv <- (motor & vehicle)
newSCC <- SCC[mv,]$SCC
data <- NEI[NEI$SCC %in% newSCC,]
data <- data[data$fips == "24510",]
data <- aggregate((data$Emissions) ~ data$year, FUN="sum")


# load the ggplot2 library, and plot away
library(ggplot2)
# create the plot
ggplot(data=data, aes(x=factor(data$`data$year`),y=data$`(data$Emissions)`)) + geom_col(fill="gray") + labs(title="Motor Vehicle related PM2.5 Emissions in Baltimore City",x="Year",y="Total PM2.5 Emissions (in tonnes)") + theme_light()
# explort the plot as PNG
ggsave("/home/ljubo/Desktop/ExData_Plotting2/Plot5.png", width=20, height=20,scale=0.8,units="cm")
