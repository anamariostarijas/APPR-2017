library(ggplot2)
library(dplyr)

# želim prikazati najbolj potrošnih nekaj držav ter najmanj

fil <- drzavna.poraba.delez.BDP %>% filter(leto >= 2004 & drzava != "Turkey" & drzava != "Hungary")
skupni.podatki <- fil %>% group_by(drzava) %>% summarise(skupno = sum(kolicina)) 

top5 <- quantile(skupni.podatki$skupno, 0.90)
min5 <- quantile(skupni.podatki$skupno, 0.10)

izbrane.drzave <- skupni.podatki %>% filter(skupno >= top5 | skupno <= min5)  


#podatki <- drzavna.poraba.delez.BDP %>% filter(drzava == "Japan" | drzava == "Slovenia") 


#graf1 <- ggplot(drzavna.poraba.delez.BDP 
 #               %>% filter(drzava == izbrane.drzave$drzava)) + 
  #                aes(x = drzava, y = kolicina) +  
   #             geom_point() 

#print(graf1)

graf1 <- ggplot(drzavna.poraba.delez.BDP 
                               %>% filter(drzava == izbrane.drzave$drzava[1]))
                                aes(x = leto, y = kolicina, colour = drzava) + geom_boxplot()

graf1 <- graf1 + ggplot(drzavna.poraba.delez.BDP 
         %>% filter(drzava == izbrane.drzave$drzava[2])) 
  
# želim združiti vse v en graf


print(graf1)

####
kolicina1 <- drzavna.poraba.delez.BDP %>% filter(leto >= 2004 & drzava == izbrane.drzave$drzava[1])
kolicina2 <- drzavna.poraba.delez.BDP %>% filter(leto >= 2004 & drzava == izbrane.drzave$drzava[2])

graf3 <- ggplot(drzavna.poraba.delez.BDP, aes(x = leto)) +                    
  geom_line(aes(y = kolicina1), colour="red") +      
  geom_line(aes(y = kolicina2), colour="green")

print(graf3)

