
#-------------------------------------------------------
# Script to translate variables from spanish to english
# Spanish COVID-19 datasets 
#-------------------------------------------------------

library(dplyr)

# Read datasets
data1 <- read.csv("nacional_covid19.csv") # National number of cases, deaths, hopitalised and UCI patients by day
data2 <- read.csv("nacional_covid19_rango_edad.csv") # By age group and sex

# Rename variables names
colnames(data1) <- c("date", "cases", "recovered", "deaths", "icu_cases", "hospitalized")
colnames(data2) <- c("date", "age_range", "sex", "confirmed_cases", "hospitalizaded", "icu_cases", "deaths" )

# Translate variable values
data2 <- data2%>%
  dplyr::mutate(age_range = gsub(" y [+]", "+", age_range),
                sex = ifelse(sex == "ambos", "both", 
                             ifelse (sex == "mujeres", "women", 
                                     ifelse (sex == "hombres", "men", sex))))

# Save translated datasets
write.csv(data1, file = "nacional_covid19.csv", row.names = FALSE)
write.csv(data2, file = "nacional_covid19_rango_edad.csv", row.names = FALSE)
