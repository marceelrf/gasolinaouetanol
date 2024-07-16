library(shiny)

ui <- fluidPage(
  fluidRow(h1("Gasolina ou Etanol?")),
  textInput("gasolina", "Preço da gasolna", value = "", width = NULL, placeholder = NULL),
  textInput("etanol", "Preço do etano", value = "", width = NULL, placeholder = NULL),
  textOutput("resultado")

)

server <- function(input, output, session) {
  resultado <- reactive({
    gasolina <- as.numeric(input$gasolina)
    etanol <- as.numeric(input$etanol)
    
    if (is.na(gasolina) || is.na(etanol)) {
      return(NULL)
    }

    if (etanol / gasolina >= 0.7) {
      "Abasteça com gasolina."
    } else {
      "Abasteça com etanol."
    }
  })
  
  output$resultado <- renderText({
    resultado()
  })
}

shinyApp(ui, server)