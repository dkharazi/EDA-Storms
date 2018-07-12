## Import libraries
library(knitr)
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

## Import data
storms <- read_csv("~/Desktop/storm.csv", col_types = c(.default = col_character()))
storms.df <- data.frame(storms)

## Remove columns with NA
storms.df <- storms.df %>%
  select(STATE, EVTYPE, FATALITIES, INJURIES, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)

## Rename columns
names(storms.df) <- c("State", "Type", "Deaths", "Injuries", 
                      "P.Damage", "P.Units", "C.Damage", "C.Units")
                      
## Redundant types of storms
head(sort(table(storms.df$Type), decreasing = TRUE), 50)
length(unique(storms.df$Type))

## Replace the units for property damage
storms.df$P.Units <- recode(storms.df$P.Units, '0'=1, '-'=1, '?'=1, '+'=1, 
                            '1'=10, '2'=10^2, 'h'=10^2, 'H'=10^2, '3'=10^3, 'K'=10^3, '4'=10^4, 
                            '5'=10^5, '6'=10^6, 'm'=10^6, 'M'=10^6, '7'=10^7, '8'=10^8, 'B'=10^9)

## Replace the units for crop damage
storms.df$C.Units <- recode(storms.df$C.Units, '0'=1, '?'=1, '2'=10^2, 'k'=10^3, 'K'=10^3, 'm'=10^6, 'M'=10^6, 'B'=10^9)

## Replace values with "Avalanche"
storms.df$Type <- gsub(".*avalanche.*", "Avalanche", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*avalance.*", "Avalanche", storms.df$Type, ignore.case = TRUE)

## Replace values with "Landslide"
storms.df$Type <- gsub(".*landslide.*", "Landslide", storms.df$Type, ignore.case = TRUE)

## Replace values with "Thunder Storm"
storms.df$Type <- gsub(".*thunder.*", "Thunder Storm", storms.df$Type, ignore.case = TRUE)

## Replace values with "Tropical Storm"
storms.df$Type <- gsub(".*tropical.*", "Tropical Storm", storms.df$Type, ignore.case = TRUE)

## Replace values with "Mudslide"
storms.df$Type <- gsub(".*mud.*", "Mudslide", storms.df$Type, ignore.case = TRUE)

## Replace values with "Dust Storm"
storms.df$Type <- gsub(".*dust.*", "Dust Storm", storms.df$Type, ignore.case = TRUE)

## Replace values with "Volcano"
storms.df$Type <- gsub(".*volcan.*", "Volcano", storms.df$Type, ignore.case = TRUE)

## Replace values with "Waterspout"
storms.df$Type <- gsub(".*waterspout.*", "Waterspout", storms.df$Type, ignore.case = TRUE)

## Replace values with "Fog"
storms.df$Type <- gsub(".*fog.*", "Fog", storms.df$Type, ignore.case = TRUE)

## Replace values with "Rain"
storms.df$Type <- gsub(".*rain.*", "Heavy rain", storms.df$Type, ignore.case = TRUE)

## Replace values with "Lightning"
storms.df$Type <- gsub(".*lightning.*", "Lightning", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*lighting.*", "Lightning", storms.df$Type, ignore.case = TRUE)

## Replace values with "Tsunami"
storms.df$Type <- gsub(".*tsunami.*", "Tsunami", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*typhoon.*", "Tsunami", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*surge.*", "Tsunami", storms.df$Type, ignore.case = TRUE)

## Replace values with "Hurricane"
storms.df$Type <- gsub(".*hurricane.*", "Hurricane", storms.df$Type, ignore.case = TRUE)

## Replace values with "Heat"
storms.df$Type <- gsub(".*dry.*", "Heat", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*heat.*", "Heat", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*warm.*", "Heat", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*hot.*", "Heat", storms.df$Type, ignore.case = TRUE)

## Replace values with "Tornado"
storms.df$Type <- gsub(".*tornado.*", "Tornado", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*funnel.*", "Tornado", storms.df$Type, ignore.case = TRUE)

## Replace values with "Wind"
storms.df$Type <- gsub(".*wind.*", "Storm Winds", storms.df$Type, ignore.case = TRUE)

## Replace values with "Flood"
storms.df$Type <- gsub(".*flood.*", "Flood", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*fld.*", "Flood", storms.df$Type, ignore.case = TRUE)

## Replace values with "Winter Storm"
storms.df$Type <- gsub(".*winter.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*wintry.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*sleet.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*cold.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*hail.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*snow.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*blizzard.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*ice.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*icy.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*glaze.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*freez.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*frost.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*cool.*", "Winter Storm", storms.df$Type, ignore.case = TRUE)

## Replace values with "Wildfire"
storms.df$Type <- gsub(".*fire.*", "Wildfire", storms.df$Type, ignore.case = TRUE)

## Replace values with "Drought"
storms.df$Type <- gsub(".*drought.*", "Drought", storms.df$Type, ignore.case = TRUE)

## Replace values with "High Tide"
storms.df$Type <- gsub(".*tide.*", "High Tide", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*surf.*", "High Tide", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*current.*", "High Tide", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*seas.*", "High Tide", storms.df$Type, ignore.case = TRUE)
storms.df$Type <- gsub(".*waves.*", "High Tide", storms.df$Type, ignore.case = TRUE)

## Redundant types of storms
head(sort(table(storms.df$Type), decreasing = TRUE), 50)
length(unique(storms.df$Type))

## Find the storms affecting the most people
most.harmful <- storms.df %>% 
  mutate(Total = Injuries + Deaths) %>% 
  group_by(Type) %>%
  summarize(Injury = sum(Injuries), Death = sum(Deaths), Total = sum(Total))  %>% 
  arrange(desc(Total)) %>%
  top_n(n = 10, wt = Total) %>%
  gather(Harm, Casualties, 2:3)

## Plot storms causing the most harm
ggplot(most.harmful, aes(x = reorder(Type, Total), y = Casualties, fill = Harm)) +
  geom_bar(stat = "identity") + 
  labs(x = "Storm Type", y = "Casualties", fill = "Type") +
  coord_flip()
  
## Find the storms affecting economies the most
most.cost <- storms.df %>% 
  group_by(Type) %>%
  summarize(Crop = sum(C.Damage * C.Units, na.rm = TRUE),
            Property = sum(P.Damage * P.Units, na.rm = TRUE)) %>%
  mutate(Total = Crop + Property) %>%
  arrange(desc(Total)) %>%
  top_n(n = 10, wt = Total) %>%
  gather(CostType, Cost, 2:3)

## Plot storms causing the most harm
ggplot(most.cost, aes(x = reorder(Type, Total), y = Cost, fill = CostType)) +
  geom_bar(stat = "identity") + 
  labs(x = "Storm Type", y = "Cost", fill = "Type") +
  coord_flip()
