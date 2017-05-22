library(ggplot2)
library(dplyr)

#1. GRAF

# želim prikazati najbolj potrošnih nekaj držav ter najmanj

fil <- drzavna.poraba.delez.BDP %>% filter(leto >= 2004 & drzava != "Turkey" & drzava != "Hungary"
                                           & drzava != "Greece" & drzava != "Romania" & drzava != "Ireland"
                                           & drzava != "Liechtenstein" & drzava != "Estonia" & drzava != "Croatia")

skupni.podatki <- fil %>% group_by(drzava) %>% summarise(skupno = sum(kolicina)) 

top5 <- quantile(skupni.podatki$skupno, 0.90)
min5 <- quantile(skupni.podatki$skupno, 0.10)

izbrane.drzave <- skupni.podatki %>% filter(skupno >= top5 | skupno <= min5)  



graf1 <- ggplot(drzavna.poraba.delez.BDP %>% filter(drzava %in% izbrane.drzave$drzava),
                aes(x = leto, y = kolicina, colour = drzava)) + geom_line()




#2. GRAF

graf2 <- ggplot(html.rast.BDP2 %>% filter(drzava %in% izbrane.drzave$drzava),
                aes(x = leto, y = rast.BDP, colour = drzava)) + geom_line()




#zemljevid

evropa <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                          "ne_50m_admin_0_countries", encoding = "UTF-8") %>%
  pretvori.zemljevid() %>% filter(continent == "Europe" | sovereignt %in% c("Turkey", "Cyprus"),
                                  long > -30)

zemljevid <- ggplot() + geom_polygon(data = left_join(evropa, 
                                             drzavna.poraba.delez.BDP,
                                             by = c("name" = "drzava")),
                                     aes(x = long, y = lat, group = group, 
                                         fill = kolicina)) +
                    coord_map(xlim = c(-25, 40), ylim = c(32, 72))




