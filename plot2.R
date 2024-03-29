###
# setwd("C:/Users/Dominic/ExploreAnalyzeData_Assignment-2")
# workingDir <- getwd()
# Source data-files have been un-zipped and placed in the root-directory
###

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total PM2.5_emissions decreased in Baltimore City, Maryland 
# from 1999 to 2008?
Baltimore.emissions <- NEI[NEI$fips=="24510",]

# group emissions by year
Baltimore.emissions.by.year <- aggregate(Emissions ~ year, Baltimore.emissions, sum)

png('plot2.png')
barplot(height=Baltimore.emissions.by.year$Emissions,
        names.arg=Baltimore.emissions.by.year$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*
                          'Maryland at various years'))
dev.off()
