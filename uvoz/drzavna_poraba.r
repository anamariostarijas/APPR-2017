drzavna_poraba <- function() {

library(readr)
loc = locale(encoding = "Windows-1250", decimal_mark = ".", grouping_mark = ",")
drzavna.poraba <- read_csv("podatki/educ_fiabs_1_Data.csv", 
                           col_names = c("leto", "drzava", "vrsta.izobrazbe", "izbrisi1", "kolicina", "izbrisi" ), 
                           skip = 29, 
                           na = ":", 
                           locale = loc)
drzavna.poraba$kolicina <- drzavna.poraba$kolicina %>% parse_number(na = ":", locale = loc)
drzavna.poraba <- drzavna.poraba[!(is.na(drzavna.poraba$kolicina)),]
# zamenjava stolpcev: ime[,c(1,2,3,4)] potem pa še ime2[, c(2,1,3,4)]
drzavna.poraba[4] <- NULL
drzavna.poraba[5] <- NULL

}