#drzavna_poraba_delez_BDP <- function() { 
  
#2. tabela
library(readr)
  library(dplyr)
  library(reshape)
drzavna.poraba.delez.BDP <- read_csv("podatki/educ_fitotin_1_Data (2).csv", 
                                     col_names = c("leto", "drzava", "vrsta.izobrazbe", "kolicina", "izbrisi" ), 
                                     skip = 29, 
                                     na = ":", 
                                     locale = locale(encoding = "Windows-1250" ))

drzavna.poraba.delez.BDP <- drzavna.poraba.delez.BDP[!(is.na(drzavna.poraba.delez.BDP$kolicina)),]
drzavna.poraba.delez.BDP[5]<- NULL

drzavna.poraba.delez.BDP <- drzavna.poraba.delez.BDP %>%
  filter(drzava != "European Union (28 countries)" & drzava != "European Union (15 countries)" & drzava != "European Union (27 countries)"
         & drzava != "Euro area (12 countries)" & drzava != "Euro area (17 countries)" & drzava != "Euro area (18 countries)"
         & drzava != "Euro area (EA11-2000, EA12-2006, EA13-2007, EA15-2008, EA16-2010, EA17-2013, EA18-2014, EA19)"
         & drzava != "Euro area (13 countries)" & drzava != "Euro area (15 countries)" )


#}

