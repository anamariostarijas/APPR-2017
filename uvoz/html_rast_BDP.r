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
html.rast.BDP2 <- function () {
library(rvest)
    library(gsubfn)
    library(readr)
library(dplyr)
library(XML)
library(reshape2)
library(reshape)
html.rast.BDP <- readHTMLTable("podatki/nama_gdp_k.html", 
                               which = 1)

colnames(html.rast.BDP) <- c("drzava", 2000:2015)

for (col in colnames(html.rast.BDP)) {
  html.rast.BDP[html.rast.BDP[[col]] == ":", col] <- NA}

html.rast.BDP2 <- melt(html.rast.BDP, id.vars = "drzava", measure.vars = names(html.rast.BDP)[-1],
                       variable.name = "leto", value.name = "%",
                       na.rm = TRUE)

colnames(html.rast.BDP2)<- c("drzava", "leto", "% BDP za izobrazbo")
}
