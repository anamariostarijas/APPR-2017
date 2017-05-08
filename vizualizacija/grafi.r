library(ggplot2)
library(dplyr)

#podatki <- drzavna.poraba %>% filter(vrsta.izobrazbe == "Total public expenditure on education in millions PPS, for all levels of education combined")
#podatki <- podatki %>% group_by(drzava)

#apply(podatki[-2] , 1, sum, na.rm = TRUE)

#graf <- ggplot(podatki) + aes(x = drzava, y = kolicina) + geom_point()
#graf <- graf + 

#print(graf)





#podatki2 <- html.rast.BDP2 %>% filter(leto >= 2010)
#graf2 <- ggplot(podatki2) + aes(x = drzava, y= rast.BDP) + geom_point()

#print(graf2)



graf3 <- ggplot(drzavna.poraba.delez.BDP) + aes(x = drzava, y = kolicina) + geom_point()
