server <- function(input, output) {
  values <- reactiveValues()
  
  Myfunction <- function() {
    k=0.7
    
    print("output")
  }
  output$console <- renderPrint({
    capture.output(Myfunction())
  
  })
  
  
}

ui <- shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(verbatimTextOutput("console"))
  )
))

shinyApp(ui = ui, server = server)

