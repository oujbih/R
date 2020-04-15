

#select multi input 
library(shinyWidgets)
pickerInput(width = "95%",
                inputId = "myPicker", 
                label = "Inputs", 
                choices = LETTERS, 
                options = list(`actions-box` = TRUE,style = "background: white;",size = 10,`selected-text-format` = "count > 3"),
                choicesOpt = list(style = rep(("color: black; font-weight: bold;background-color: white;"),26)),
                multiple = TRUE
              )
