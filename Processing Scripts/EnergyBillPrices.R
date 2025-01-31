library(readxl)
library(plyr)
library(dplyr)
library(tidyverse)
library(data.table)

print("EnergyBillPrices")


###Electricity


#Load Source Data
library(readxl)
ElectricityAverageBill <- read_excel("Data Sources/Energy Bills/ElectricityAverageBill.xlsx", 
                                     sheet = "2.2.2", skip = 7)


#Keep Only useful Columns
ElectricityAverageBill <- select(ElectricityAverageBill,
                         Year,
                         "Prepayment: Scotland (pounds)",
                         "Standard credit: Scotland (pounds)",
                         "Direct debit: Scotland (pounds)")

#Rename Columns
names(ElectricityAverageBill) <- c("Year", "Prepayment", "Standard Credit", "Direct Debit")

#Export to CSV
write_csv(ElectricityAverageBill, "Output/Energy Bills/ElectricityAverageBill.csv")


### Electricity Regional ###

ElectricityRegionAverageBill <- read_excel("Data Sources/Energy Bills/ElectricityRegionAverageBill.xlsx", 
                                   sheet = "2.2.3 (Time Series)", skip = 10)


#Keep useful columns
ElectricityRegionAverageBill <- select(ElectricityRegionAverageBill,
                               Year,
                               Region,
                               "Prepayment: Bill (Pounds)",  
                               "Credit: Bill (Pounds)",
                               "Direct debit: Bill (Pounds)",
                               "Overall: Bill (Pounds)" 
)

#Rename Columns
names(ElectricityRegionAverageBill) <- c("Year", "Region", "Prepayment", "Standard Credit", "Direct Debit", "Total")

#Melt into tidy format
ElectricityRegionAverageBill <- melt(ElectricityRegionAverageBill, id.vars = c("Region", "Year"))

#Export to CSV
write_csv(ElectricityRegionAverageBill, "Output/Energy Bills/ElectricityRegionAverageBill.csv")





















### GAS ###

#Load Source Data
GasAverageBill <- read_excel("Data Sources/Energy Bills/GasAverageBill.xlsx", 
                             sheet = "2.3.2", skip = 8)

#Keep Only useful Columns
GasAverageBill <- select(GasAverageBill,
                         Year,
                        "Prepayment: Scotland (pounds)",
                        "Standard credit: Scotland (pounds)",
                        "Direct debit: Scotland (pounds)")

#Rename Columns
names(GasAverageBill) <- c("Year", "Prepayment", "Standard Credit", "Direct Debit")

#Export to CSV
write_csv(GasAverageBill, "Output/Energy Bills/GasAverageBill.csv")


### Gas Regional ###

GasRegionAverageBill <- read_excel("Data Sources/Energy Bills/GasRegionAverageBill.xlsx", 
                                   sheet = "2.3.3 (Time Series)", skip = 10)

#Keep useful columns
GasRegionAverageBill <- select(GasRegionAverageBill,
                               Year,
                               Region,
                               "Prepayment: Bill (pounds)",  
                               "Credit: Bill (pounds)",
                               "Direct debit: Bill (pounds)",
                               "Overall: Bill (pounds)" 
                               )

#Rename Columns
names(GasRegionAverageBill) <- c("Year", "Region", "Prepayment", "Standard Credit", "Direct Debit", "Total")

#Melt into tidy format
GasRegionAverageBill <- melt(GasRegionAverageBill, id.vars = c("Region", "Year"))

#Export to CSV
write_csv(GasRegionAverageBill, "Output/Energy Bills/GasRegionAverageBill.csv")
