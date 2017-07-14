library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$g <- renderPlot({
    podatki1 <- filter(drzavna.poraba, 
                   drzavna.poraba$drzava == input$drzava,
                   drzavna.poraba$vrsta.izobrazbe == input$vrsta)
    podatki2 <- filter(html.rast.BDP2,
                       html.rast.BDP2$drzava == input$drzava)
    
    graf <- ggplot(podatki1, aes(x = leto, y = kolicina)) +
      geom_point()
    
    
    graf +
      geom_smooth(method = 'loess', fullrange = TRUE, se = FALSE) +
      xlab("Leto") + ylab("Količina")
    
    
  })
  
  output$g2 <- renderPlot({
    
    podatki2 <- filter(html.rast.BDP2,
                       html.rast.BDP2$drzava == input$drzava)
    
    graf2 <- ggplot(podatki2, aes(x = leto, y = rast.BDP)) +
      geom_point()
    
    
   graf2 +
      geom_smooth(method = 'loess', fullrange = TRUE, se = FALSE) +
      xlab("Leto") + ylab("Rast BDP")
    
    
  })
  
 
})
  