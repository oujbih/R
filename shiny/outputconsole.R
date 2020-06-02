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

#multi line output 

htmlOutput("modelParameters") # ui
output$modelParameters <- renderUI(
        HTML(
          paste(
            c("<pre>", capture.output({ 
                  # here
                  # out put console
                }), "</pre>"),
            collapse = "<br>"
          )
        )
      ) #server



















