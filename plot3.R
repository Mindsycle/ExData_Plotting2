# open the RDS files
NEI <- readRDS("/home/ljubo/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("/home/ljubo/Desktop/Source_Classification_Code.rds")

# prepare the data to be plotted
data <- NEI[NEI$fips == "24510",]
data <- aggregate((data$Emissions)/10^3 ~ data$year+data$type, FUN="sum")


# load the ggplot2 library, and plot away
library(ggplot2)
# create the plot
ggplot(data=data, aes(x=factor(data$`data$year`),y=data$`(data$Emissions)/10^3`,fill=data$`data$type`)) + geom_col() + labs(title="Baltimore City Total PM2.5 across years",x="Year",y="Total PM2.5 Emissions (in thousand tonnes)", fill = "Type of Measurement") + theme_bw()
# explort the plot as PNG
ggsave("/home/ljubo/Desktop/ExData_Plotting2/Plot3.png", width=20, height=20,scale=0.8,units="cm")
