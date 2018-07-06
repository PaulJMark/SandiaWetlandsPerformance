
library(readr)
library(dplyr)
library(ggplot2)

setwd("/Users/paulmark/Dropbox (Adelante Consulting,)/PMARK/MTOA 4 TO 462793/Task 2.0.18 SMO Operations Support/2018 Sandia Wetland Report/SandiaWetlandsPerformance")
getwd()


san <- read_csv("EIM_EXPORT_07_05_2018.csv", 
                col_types = list('Sample Date' = col_date("%m/%d/%Y"),
                                 'Display Sample Date'= col_date("%m/%d/%Y"),
                                 'Sampling Event End Date'= col_date("%m/%d/%Y"),
                                 'Display End Sample Date'= col_date("%m/%d/%Y"),
                                 'Lab Receipt Date'= col_date("%m/%d/%Y"),
                                 'Display Lab Receipt Date'= col_date("%m/%d/%Y"),
                                 'Analysis Date'= col_date("%m/%d/%Y"),
                                 'Display Analysis Date'= col_date("%m/%d/%Y"),
                                 '% Moisture' = col_character(),
                                 'Uploaded Date'= col_date("%m/%d/%Y"),
                                 'Display Upload Date'= col_date("%m/%d/%Y"),
                                 'Last Modified Date'= col_date("%m/%d/%Y"),
                                 'Display Last Modified Date'= col_date("%m/%d/%Y"),
                                 'Validated Date'= col_date("%m/%d/%Y"),
                                 'Display Validation Date'= col_date("%m/%d/%Y"),
                                 'Web Publish Date'= col_date("%m/%d/%Y")))
names(san)<-make.names(names(san),unique = TRUE)

View(san)

san_chloride <- san %>%
  filter(Parameter.Code == "Cl(-1)") %>%
  filter(Location.Alias == "E121" & Field.Preparation.Code == "F" | 
         Location.Alias == "E123" & Field.Preparation.Code == "F" |
         Location.Alias == "O1PP" & Field.Preparation.Code == "UF") %>%
  filter(Sample.Purpose == "REG" & Best.Value == "Y") %>%
  filter(Sample.Date > "2002-01-01") %>%
  filter(Field.Sample.ID != "CASA-10-9411") %>%
  mutate(Location = ifelse(Location.Alias == "O1PP", "NPDES Outfall 001",Location.Alias)) %>%
  select(Location, Parameter.Code, Parameter.Name, Field.Preparation.Code, Detected, Report.Result, Report.Units, Sample.Date) 

View(san_chloride)

san_chloride_plot <- ggplot(san_chloride, aes(x=Sample.Date,y=Report.Result,color = Location)) +
  geom_line() +
  geom_point(size = .5) +
  labs(x = "", y = "Chloride (mg/L)", size = 6) +
  scale_color_manual(values=c("deepskyblue3","red3","peru")) +
  scale_x_date(date_breaks = "6 month", 
               date_labels = "%b-%Y") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = .5, size = 6)) +
  theme(axis.text.y = element_text(hjust = 1, vjust = .5, size = 6),
        axis.title.y = element_text(size = 7, face = "bold")) +
  theme(legend.position = "top", 
        legend.text = element_text(size = 6),
        legend.title = element_text(size = 6, face = "bold")) +
  geom_vline(xintercept = as.numeric(as.Date("2012-06-01")), linetype=4, color = "black") +
  geom_vline(xintercept = as.numeric(as.Date("2013-10-01")), linetype=4, color = "salmon") 
  
ggsave(san_chloride_plot, filename = 'san_chloride_plot.png', width = 6.5, height = 3)



