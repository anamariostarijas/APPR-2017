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


#}

