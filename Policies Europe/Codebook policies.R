##Codebook for policies

#policiy vars

policies <- c("Country", "school_close_begin","travel_restrictions", "public_events", "sport_begin", 
              "lockdown", "social_distancing_encouraged", "self_isolating_if_ill", "rest_begin", 
              "border_close", "border_type", "flight_rest", "border_control")

explanation <- c("Country", 
                 "close of schools, universities, child care", 
                 "first time travel restrictions for country residents introduced",
                 "restriction for public events", 
                 "gyms or similar closed",
                 "strict rules for public life and freedom of movement in place",
                 "social distancing encouraged",
                 "self isolate at home if ill encouraged by health authorities",
                 "time point of restaurant closure",
                 "border closed yes, no or partly", 
                 "full: only citizens from country may travel, partly: not all boarders closed or certain regulations in place such as non-essential travel is forbidden
                 , none: no true restrictions, maybe only advice for self-quarantine", 
                 "flight restrictions for incoming passenger", 
                 "control at land borders introduced for some or all borders")

additional_info <- c("USA many restriction on state level, not on country level",
                     "none",
                     "none",
                     "none",
                     "none",
                     "to date none in the Netherlands",
                     "none found for Greece and Netherlands",
                     "none found for Greece",
                     "no closure of restaurants in Sweden as of 24th of March, 
                     apparently no full closer in Norway, 
                     open when they can ensure that customers are 1m apart",
                     "none in UK and Sweden, none in Italy, but all surrounding countries have
                     border restrictions in place",
                     "none",
                     "none in UK or none that I found",
                     "Netherlands none as of 18th of March 2020, none in Sweden, Italy organized
                      by neighboring countries, UK introduction of Coronavirus Act 2020"
                     )

codebook <- data.frame(policies, explanation, additional_info)

#write data to csv file

write.table(data, file="C:/Users/Hape/Documents/Biohackathon/codebook_policies.csv", col.names = TRUE,
            sep=",")

#write data to txt file
write.table(data, file="C:/Users/Hape/Documents/Biohackathon/codebook_policies.txt", col.names = TRUE,
            sep=",")
