getwd()
#setwd("C:/Users/Hape/Documents/Biohackathon")

library(readxl)
library(dplyr)

data <- read_excel("Excel interventions.xlsx", sheet=1)

##add additional countries

vector_new_country <- c("Netherlands", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA )
vector_new_country2 <- c("United_States", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA )
vector_new_country3 <- c("Greece", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA )

#bind new country vectors to dataframe

data <- rbind(data, vector_new_country)
data <- rbind(data, vector_new_country2)
data <- rbind(data, vector_new_country3)
data$Country

#arrange in alphabetical order
data <- data %>%
  arrange(Country)

data$Country

##rename columns

names(data)[names(data)=="sport"] <- "sport_begin"

#begin of lockdown schools, universities and child care

class(data$schools_universities)
names(data)[names(data)=="schools_universities"] <- "school_close_begin"

##correct dates

#correct dates of school closings (Date is the Date from when restriction is in place)
data$school_close_begin[data$Country=="Germany"] <- "2020-03-16"
data$school_close_begin[data$Country=="Greece"] <- "2020-03-10"
data$school_close_begin[data$Country=="Netherlands"] <- "2020-03-16"
data$school_close_begin[data$Country=="France"]  <- "2020-03-16"

#correct dates of public events
data$public_events[data$Country=="Germany"]  <- "2020-03-13"

#add dates of planned stop/when restriction stopped or ar loosened, maybe something to consider lateron
#data$schools_universities_close_stop[data$Country=="Germany"] <- "2020-04-20"
#data$schools_universities_close_stop[data$Country=="Netherlands"] <- "2020-05-03"

##define new vectors for restaurant close-down and planned stop

#define vector restaurants close
vector_restaurants_begin <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

#define vector border closed
vector_border_close <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

#define type border close
vector_border_type <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

#land border control
vector_border_control <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

#flight restriction incoming passenger
vector_flight_rest <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)

#add vectors to dataframe

data$rest_begin <- vector_restaurants_begin
data$border_close <- vector_border_close
data$border_type <- vector_border_type
data$border_control <- vector_border_control
data$flight_rest <- vector_flight_rest

##fill empty vectors 

#restaurant close begin
##no close of restaurants in Sweden as of 24th of March
##apparently no full closer in Norway, open when they can ensure that customers are 1m apart
data$rest_begin[data$Country=="Austria"] <- "2020-03-16"
data$rest_begin[data$Country=="Belgium"] <- "2020-03-16"
data$rest_begin[data$Country=="Denmark"] <- "2020-03-18"
data$rest_begin[data$Country=="France"] <- "2020-03-15"
data$rest_begin[data$Country=="Germany"] <- "2020-03-23"
data$rest_begin[data$Country=="Greece"] <- "2020-03-13"
data$rest_begin[data$Country=="Italy"] <- "2020-03-12"
data$rest_begin[data$Country=="Netherlands"] <- "2020-03-16"
data$rest_begin[data$Country=="Spain"] <- "2020-03-15"
data$rest_begin[data$Country=="Switzerland"] <- "2020-03-17"
data$rest_begin[data$Country=="United_Kingdom"] <- "2020-03-21"

#sports begin 
data$sport_begin[data$Country=="Netherlands"] <- "2020-03-12"
data$sport_begin[data$Country=="Belgium"] <- "2020-03-16"
data$sport_begin[data$Country=="Germany"] <- "2020-03-16"
data$sport_begin[data$Country=="Greece"] <- "2020-03-12"
data$sport_begin[data$Country=="United_Kingdom"] <- "2020-03-21"
##need to add rest of countries

#self-isolating if ill
data$self_isolating_if_ill[data$Country=="Netherlands"] <- "2020-03-12"
data$self_isolating_if_ill[data$Country=="United_States"] <- "2020-02-29"
#need to add: United_States

#public events
data$public_events[data$Country=="Greece"] <- "2020-03-13"
data$public_events[data$Country=="Netherlands"] <- "2020-03-13"

#lockdown
## none in the Netherlands
## different restrictions for each state in the US
data$lockdown[data$Country=="Greece"] <- "2020-03-23"

#border close
## none in the UK
## none in Sweden as 14th of March
## none in Italy --> surrounding countries introduced them
data$border_close[data$Country=="Austria"] <- "2020-03-11"
data$border_close[data$Country=="Belgium"] <- "2020-03-21"
data$border_close[data$Country=="Denmark"] <- "2020-03-14"
data$border_close[data$Country=="France"] <- "2020-03-17"
data$border_close[data$Country=="Germany"] <- "2020-03-16"
data$border_close[data$Country=="Greece"] <- "2020-03-16"
data$border_close[data$Country=="Netherlands"] <- "2020-03-20"
data$border_close[data$Country=="Norway"] <- "2020-03-16"
data$border_close[data$Country=="Spain"] <- "2020-03-17"
data$border_close[data$Country=="Switzerland"] <- "2020-03-25"
data$border_close[data$Country=="United_States"] <- "2020-03-12"

#border type
## full: only citizens from country may travel
## partly: not all boarders closed or certain regulations in place such as non-essential travel is forbidden
## none: no true restrictions, maybe only advice for self-quarantine

data$border_type[data$Country=="Austria"]<-"partly"
data$border_type[data$Country=="Belgium"]<-"partly"
data$border_type[data$Country=="Denmark"]<- "full"
data$border_type[data$Country=="France"] <- "partly"
data$border_type[data$Country=="Germany"]<-"partly"
data$border_type[data$Country=="Greece"]<-"full"
data$border_type[data$Country=="Netherlands"] <- "partly"
data$border_type[data$Country=="Norway"]<- "full"
data$border_type[data$Country=="Spain"]<- "full"
data$border_type[data$Country=="Switzerland"]<- "full"
data$border_type[data$Country=="Sweden"]<- "none"
data$border_type[data$Country=="United_Kingdom"] <- "none"
data$border_type[data$Country=="United_States"] <- "partly"

#travel restrictions
data$travel_restrictions[data$Country=="Greece"] <- "18.03.2020"
data$travel_restrictions[data$Country=="Netherlands"] <- "17.03.2020"
data$travel_restrictions[data$Country=="United_States"] <- "19.03.2020"

#land border control
##Netherlands none as of 18th of March 2020
##apparently none in Sweden
data$border_control[data$Country=="Austria"] <- "2020-03-11"
data$border_control[data$Country=="Belgium"] <- "2020-03-21"
data$border_control[data$Country=="Denmark"] <- "2020-03-14" 
data$border_control[data$Country=="France"] <- "2020-03-16"
data$border_control[data$Country=="Germany"] <- "2020-03-16"
data$border_control[data$Country=="Greece"] <- "2020-03-16"
data$border_control[data$Country=="Italy"] <- "2020-03-11"
data$border_control[data$Country=="Norway"] <- "2020-03-16"
data$border_control[data$Country=="Spain"] <- "2020-03-17"
data$border_control[data$Country=="Switzerland"] <- "2020-03-13"
data$border_control[data$Country=="United_Kingdom"] <- "2020-03-25"
data$border_control[data$Country=="United_States"] <- "2020-03-19"

#flight restrictions for incoming passengers
##apparently none in UK?
data$flight_rest[data$Country=="Austria"] <- "2020-03-17"
data$flight_rest[data$Country=="Belgium"] <- "2020-03-21"
data$flight_rest[data$Country=="Denmark"] <- "2020-03-14" 
data$flight_rest[data$Country=="France"] <- "2020-03-17"
data$flight_rest[data$Country=="Germany"] <- "2020-03-17"
data$flight_rest[data$Country=="Greece"] <- "2020-03-17"
data$flight_rest[data$Country=="Italy"] <- "2020-01-31"
data$flight_rest[data$Country=="Netherlands"] <- "2020-03-17"
data$flight_rest[data$Country=="Norway"] <- "2020-03-16"
data$flight_rest[data$Country=="Spain"] <- "2020-03-17"
data$flight_rest[data$Country=="Switzerland"] <- "2020-03-17"
data$flight_rest[data$Country=="Sweden"] <- "2020-03-17"
data$flight_rest[data$Country=="United_States"] <- "2020-03-13"
  
##remove empty or unnecessary columns

data <- data %>%
  select(Country, school_close_begin, travel_restrictions, public_events, sport_begin, 
         lockdown, social_distancing_encouraged, self_isolating_if_ill, 
         rest_begin, border_close, border_type, flight_rest, border_control)

##change vars to as.Date 

class(data$travel_restrictions)
class(data$school_close_begin)

data$travel_restrictions <- as.Date(data$travel_restrictions, format = "%d.%m.%Y")
data$school_close_begin <- as.Date(data$school_close_begin, format = "%Y-%m-%d")
data$public_events <- as.Date(data$public_events, format = "%Y-%m-%d")
data$sport_begin <- as.Date(data$sport_begin, format = "%Y-%m-%d")
data$lockdown <- as.Date(data$lockdown, format = "%Y-%m-%d")
data$social_distancing_encouraged <- as.Date(data$social_distancing_encouraged, format = "%Y-%m-%d")
data$self_isolating_if_ill <- as.Date(data$self_isolating_if_ill, format = "%Y-%m-%d")
data$rest_begin <- as.Date(data$rest_begin, format = "%Y-%m-%d")
data$border_close <- as.Date(data$border_close, format = "%Y-%m-%d")
data$border_control <- as.Date(data$border_control, format = "%Y-%m-%d")
data$flight_rest<- as.Date(data$flight_rest, format = "%Y-%m-%d")

#write data to csv file

write.table(data, file="C:/Users/Hape/Documents/Biohackathon/policies_corona.csv", col.names = TRUE,
            sep=",")

#write data to txt file
write.table(data, file="C:/Users/Hape/Documents/Biohackathon/policies_corona.txt", col.names = TRUE,
            sep=",")

#**************************
  ##make extra file for US states
##single states of the US

#restaurants close
data$rest_begin[data$Country=="Minnesota"] <- "2020-03-16"

#sports close
data$sport_begin[data$Country=="Minnesota"] <- "2020-03-16"

#public events
data$public_events[data$Country=="Minnesota"] <- "2020-03-13"

#schools closed (only schools, not universities or child care)
data$school_close_begin[data$Country=="Oregon"] <- "2020-03-13"
data$school_close_begin[data$Country=="Pennsylvenia"] <- "2020-03-13"
data$school_close_begin[data$Country=="Illinois"] <- "2020-03-17"
data$school_close_begin[data$Country=="West_Virginia"] <- "2020-03-16"
data$school_close_begin[data$Country=="South_Dakota"] <- "2020-03-16" ##reopen 20th of March

#universities closed
#data$uni_close[data$Country=="Hawai"] <- "2020-03-16"




