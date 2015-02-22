
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

bmifunc <- function(height, weight){
    bmi <- round((weight/(height/100)^2), digits =1) 
}

bmifunc2 <- function(height, weight){
    bmi <- weight/(height/100)^2
    if(bmi < 18.5) "Underweight"
    else if(bmi >= 18.5 & bmi < 25) "Normal weight"
    else if(bmi >= 25 & bmi < 30) "Overweight"
    else "Obese"
}


shinyServer(
    function(input, output){
        output$bmi <- renderText({bmifunc(input$height, input$weight)})
        output$diagnostic <- renderText({bmifunc2(input$height, input$weight)})
    }
)