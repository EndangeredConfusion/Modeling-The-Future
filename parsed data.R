library(sqldf)
library(tidyverse)
#crime_data <- read.csv.sql("C:\\Users\\Kaeshev_Alapati\\Downloads\\Crimes_-_2001_to_Present.csv",
#                           sql = "select * from file where `Date` > 2021", eol = "\n")
# 
# con = file("C:\\Users\\Kaeshev_Alapati\\Downloads\\Crimes_-_2001_to_Present.csv", "r")
# csv = read.csv(con, nrows = 1000)
# close(con)
# df = data.frame(csv)

df = read_csv("C:\\Users\\Kaeshev_Alapati\\Downloads\\Crimes_-_2001_to_Present.csv")
df_short = df %>% select(Date, "Community Area")
df_short = df_short %>% mutate(Date = sub('.{12}$', '', df_short$Date))
df_short = df_short %>% mutate(Date = as.Date(Date, format = "%m/%d/%Y"))
df_short = df_short[df_short$Date > "2020-1-1", ]

table(df_short)
