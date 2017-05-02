drzavna.poraba <- read_csv("~/projekt R/projekt/educ_fiabs_1_Data.csv", 
                           col_names = c("leto", "država", "vrsta izobrazbe", "izbriši1", "količina", "izbriši" ), 
                           skip = 29, 
                           na = ":", 
                           locale = locale(encoding = "Windows-1250" ))
drzavna.poraba <- drzavna.poraba[!(is.na(drzavna.poraba$količina)),]
# zamenjava stolpcev: ime[,c(1,2,3,4)] potem pa še ime2[, c(2,1,3,4)]
drzavna.poraba[4] <- NULL
drzavna.poraba[5] <- NULL


#2. tabela
drzavna.poraba.delez.BDP <- read_csv("~/projekt R/projekt/educ_fitotin_1_Data (2).csv", 
                                    col_names = c("leto", "država", "vrsta izobrazbe", "količina", "izbriši" ), 
                                    skip = 29, 
                                    na = ":", 
                                    locale = locale(encoding = "Windows-1250" ))

drzavna.poraba.delez.BDP <- drzavna.poraba.delez.BDP[!(is.na(drzavna.poraba.delez.BDP$količina)),]
drzavna.poraba.delez.BDP[5]<- NULL

#3.tabela
rast.BDP <- read_csv("~/projekt R/projekt/nama_gdp_k_1_Data.csv", 
                     col_names = c("leto", "država", "izbriši", "izbriši1", "%", "izbriši2" ), 
                     skip = 1, 
                     na = ":", 
                     locale = locale(encoding = "Windows-1250" ))
rast.BDP[3] <- NULL 
 rast.BDP[3] <- NULL 
 rast.BDP[4] <- NULL
 rast.BDP <- rast.BDP[!(is.na(rast.BDP$'%')),]
 
 
 
 # 3. kot HTML tabela
 
 library(rvest)
 #     library(gsubfn)
 #     library(readr)
 #     library(dplyr)
 library(XML)
 html.rast.BDP <- readHTMLTable("file:///C:/Users/Anamari/Documents/projekt%20R/projekt/nama_gdp_k.html", 
                                  which = 1)
 colnames(html.rast.BDP) <- c("država", 2000:2015)
 for (col in colnames(html.rast.BDP)) {
       html.rast.BDP[html.rast.BDP[[col]] == ":", col] <- NA}
 html.rast.BDP2 <- melt(html.rast.BDP, id.vars = "država", measure.vars = names(html.rast.BDP)[-1],
                                                                      variable.name = "leto", value.name = "%",
                                                                      na.rm = TRUE)
 
 colnames(html.rast.BDP2)<- c("država", "leto", "% BDP za izobrazbo")
