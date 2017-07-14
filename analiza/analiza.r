# 4. faza: Analiza podatkov
library(ggplot2)
library(dplyr)
library(readr) 

# grupiranje

prva <- drzavna.poraba.delez.BDP %>% filter(leto == 2011) %>% select(-leto)
druga <- html.rast.BDP2 %>% filter(leto == 2011) %>% select(-leto)

grupe <- inner_join(prva, druga, by="drzava")
drzave <- grupe$drzava
grupe$vrsta.izobrazbe <- NULL

grupe2 <- grupe %>% select(-drzava) %>% scale()
rownames(grupe2) <- grupe$drzava
k <- kmeans(grupe2, 5, nstart = 1000)
#k$tot.withinss

#head(k$cluster, n = 15)
#table(k$cluster)
#View(k$centers)

skupine <- data.frame(drzava = grupe$drzava, skupina = factor(k$cluster))

ggplot() + geom_polygon(data = left_join(evropa, 
                                         skupine,
                                         by = c("name" = "drzava")),
                        aes(x = long, y = lat, group = group, 
                            fill = skupina)) +
  coord_map(xlim = c(-25, 40), ylim = c(32, 72))

# grafi povezav

podatki <- inner_join(html.rast.BDP2, drzavna.poraba.delez.BDP)

graf <- ggplot(podatki, aes(x=kolicina, y=rast.BDP)) + geom_point()


funk <- loess(data = podatki, kolicina ~ rast.BDP)
graf + geom_smooth(method = "loess")

