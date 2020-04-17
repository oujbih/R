server <- function(input, output) {
  values <- reactiveValues()
  
  queryMagic <- function() {
    k=0.7
    Model_data$`Courant Broyeur ML004`[Model_data$`Courant Broyeur ML004`== "Arc Off-line"] <- 0
    Model_data$`Courant Broyeur ML002`[Model_data$`Courant Broyeur ML002`== "Arc Off-line"] <- 0
    
    Model_data <- imputeTS::na_kalman(Model_data) #na_interpolation na_ma 
    Model_data <- Model_data %>% na.omit()
    Model_data <- Model_data %>% select(1,3:9,14:25,11,12,13)
    
    index_train  <- c(1:as.integer(nrow(Model_data)*k))
    DATA.train <- Model_data[index_train,]
    DATA.test <- Model_data[-index_train,]
    # c(DATA.train, DATA.test,index_train)%<-% MakeTrainTest(Model_data,0.7)
    
    DATA.traintmp_regression <- DATA.train %>% 
      select(-"D80",-"X250µm",-"sortie_date") %>% 
      mutate_if(is.character, as.factor) %>% na.omit()
    
    DATA.testmp_regression <- DATA.test %>% 
    select(-"D80",-"X250µm",-"sortie_date") %>% 
    mutate_if(is.character, as.factor) %>% na.omit()
    print(apply(is.na(DATA.traintmp_regression),2,sum))
    print(apply(is.na(DATA.testmp_regression),2,sum))
    return("Data")
  }
  output$console <- renderPrint({
    capture.output(queryMagic())
  
  })
  
  logText <- reactive({
    values[["log"]] <- capture.output(queryMagic())
    
    
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

