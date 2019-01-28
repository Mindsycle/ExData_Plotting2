# open the RDS files
NEI <- readRDS("/home/ljubo/Desktop/summarySCC_PM25.rds")
SCC <- readRDS("/home/ljubo/Desktop/Source_Classification_Code.rds")

# prepare the data to be plotted
coal <- grepl("coal",SCC$Short.Name,ignore.case=TRUE)
comb <- grepl("comb",SCC$Short.Name,ignore.case=TRUE)
CC <- (coal & comb)
newSCC <- SCC[CC,]$SCC
data <- NEI[NEI$SCC %in% newSCC,]
data <- aggregate((data$Emissions)/10^6 ~ data$year, FUN="sum")


# load the ggplot2 library, and plot away
library(ggplot2)
# create the plot
ggplot(data=data, aes(x=factor(data$`data$year`),y=data$`(data$Emissions)/10^6`)) + geom_col(fill="red") + labs(title="Coal-Combustion related PM2.5 Emissions in the USA",x="Year",y="Total PM2.5 Emissions (in million tonnes)")
# explort the plot as PNG
ggsave("/home/ljubo/Desktop/ExData_Plotting2/Plot4.png", width=20, height=20,scale=0.8,units="cm")
