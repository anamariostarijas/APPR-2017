library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Potrošnja držav za izobrazbo ter njen BDP"),
  
  selectInput(inputId = "drzava", 
              label = "Država", 
              choices = unique(drzavna.poraba$drzava),
              selected = "Slovenia",
              multiple = FALSE),

  
  radioButtons(inputId = "vrsta",
               label = "Stopnja izobrazbe",
               choices = list("Primarna",
                              "Sekundarna",
                              "Terciarna",
                              "Skupaj")),
 

  tabPanel("grafa",
           fluidRow(
             column(width = 6, plotOutput("g"), h4("Potrošnja držav za stopnjo izobrazbe")),
             column(width = 6, plotOutput("g2"), h4("Rast BDP"))
           ))
  

#plotOutput(outputId = "g")





))

