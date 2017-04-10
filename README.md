# Analiza podatkov s programom R, 2016/17

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2016/17

## Tematika

V svojem projektu bom analizirala državne potrošnje za izobrazbo. Zanimala me bodo posamezna področja izobrazbe, šolskih ustanov in plače zaposlenih ter če investicije v le-te lahko vplivajo na stabilno rast BDP-ja. Podatke o državni potrošnji v odstotkih BDP-ja in realni BDP sem v obliki CSV pridobila iz Eurostata. 

Prva tabela bo sestavljena iz količine potrošnje različnih držav za osnovnošolske, visokošolske in univerzitetne ustanove po letih. V drugi tabeli bodo leta in države, rast BDP-ja, in skupna državna potrošnja za izobrazbo v odstotkih BDP.

Dodatno bom analizirala države, ki se najbolj prilegajo teoriji, ter tiste, ki najbolj odstopajo. Zanimalo me bo, če je povezanost med državno potrošnjo za izobrazbo državljanov in rastjo realnega BDP-ja lahko zanemarljiva ali pa bi to lahko bil eden izmed poglavitnih razlogov za stabilno rast. 

Podatki: -http://ec.europa.eu/eurostat
         -http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=educ_fiabs&lang=en
         -http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&plugin=1&pcode=tps00069&language=en
         
## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
