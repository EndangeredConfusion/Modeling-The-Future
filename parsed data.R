library(sqldf)
library(tidyverse)
library(tigerstats)
library(lattice)

#crime_data <- read.csv.sql("C:\\Users\\Kaeshev_Alapati\\Downloads\\Crimes_-_2001_to_Present.csv",
#                           sql = "select * from file where `Date` > 2021", eol = "\n")
# 
# con = file("C:\\Users\\Kaeshev_Alapati\\Downloads\\Crimes_-_2001_to_Present.csv", "r")
# csv = read.csv(con, nrows = 1000)
# close(con)
# df = data.frame(csv)

df <- read_csv("data/Crimes_-_2001_to_Present.csv")
df_short <- df %>% select(Date, "Community Area")
df_short <- df_short %>% mutate(Date = sub('.{12}$', '', df_short$Date))
df_short <- df_short %>% mutate(Date = as.Date(Date, format = "%m/%d/%Y"))
df_short <- df_short[df_short$Date > "2020-1-1", ]

table(df_short)
head(df_short)
summary(df_short)


ggplot(df_short, aes(x = Date)) +
  geom_histogram()


histogram(~date|`Community Area`, data=df_short,
          type="density",
          xlab="Date",
          main="Crimes Over Time by Community Area")
          # breaks=seq(from=60,to=190,by=10),
          # layout=c(1,2))


ggplot(df_short, aes(x = Date, y=`Community Area`)) +
  geom_point()
