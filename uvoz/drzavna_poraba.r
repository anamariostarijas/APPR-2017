#drzavna_poraba <- function() {

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

drzavna.poraba$vrsta.izobrazbe <- gsub("^Total public expenditure on education in millions PPS, at primary level of education.*$","Primarna", drzavna.poraba$vrsta.izobrazbe)
drzavna.poraba$vrsta.izobrazbe <- gsub("^Total public expenditure on education in millions PPS, at secondary level of education.*$","Sekundarna", drzavna.poraba$vrsta.izobrazbe)
drzavna.poraba$vrsta.izobrazbe <- gsub("^Total public expenditure on education in millions PPS, at tertiary level of education.*$","Terciarna", drzavna.poraba$vrsta.izobrazbe)
drzavna.poraba$vrsta.izobrazbe <- gsub("^Total public expenditure on education in millions PPS, for all levels of education combined.*$","Skupaj", drzavna.poraba$vrsta.izobrazbe)

drzavna.poraba <- drzavna.poraba %>%
  filter(drzava != "European Union (28 countries)" & drzava != "European Union (15 countries)" & drzava != "European Union (27 countries)"
         & drzava != "Euro area (12 countries)" & drzava != "Euro area (17 countries)" & drzava != "Euro area (18 countries)"
         & drzava != "Euro area (EA11-2000, EA12-2006, EA13-2007, EA15-2008, EA16-2010, EA17-2013, EA18-2014, EA19)"
         & drzava != "Euro area (13 countries)" & drzava != "Euro area (15 countries)" )

#}
