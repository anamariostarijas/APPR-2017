#3.tabela
#rast.BDP <- read_csv("~/projekt R/projekt/nama_gdp_k_1_Data.csv", 
#                    col_names = c("leto", "država", "izbriši", "izbriši1", "%", "izbriši2" ), 
#                     skip = 1, 
#                    na = ":", 
#                     locale = locale(encoding = "Windows-1250" ))
#rast.BDP[3] <- NULL 
# rast.BDP[3] <- NULL 
# rast.BDP[4] <- NULL
# rast.BDP <- rast.BDP[!(is.na(rast.BDP$'%')),]



# 3. kot HTML tabela
#html.rast.BDP2 <- function () {
library(rvest)
library(gsubfn)
library(readr)
library(dplyr)
library(XML)
library(reshape2)
#library(reshape)
html.rast.BDP <- readHTMLTable("podatki/nama_gdp_k.html", 
                               which = 1)

colnames(html.rast.BDP) <- c("drzava", 2000:2015)

for (col in colnames(html.rast.BDP)[-1]) {
  html.rast.BDP[[col]] <- parse_number(html.rast.BDP[[col]], na = ":")
}

html.rast.BDP$leto <- html.rast.BDP$leto %>% parse_number(na = ":", locale = loc)

html.rast.BDP2 <- melt(html.rast.BDP, id.vars = "drzava", measure.vars = names(html.rast.BDP)[-1],
                       variable.name = "leto", value.name = "rast.BDP",
                       na.rm = TRUE)


html.rast.BDP2 <- html.rast.BDP2 %>%
  filter(drzava != "European Union (28 countries)" & drzava != "European Union (15 countries)" & drzava != "European Union (27 countries)"
        & drzava != "Euro area (12 countries)" & drzava != "Euro area (17 countries)" & drzava != "Euro area (18 countries)"
        & drzava != "Euro area (EA11-2000, EA12-2006, EA13-2007, EA15-2008, EA16-2010, EA17-2013, EA18-2014, EA19)")


#}
