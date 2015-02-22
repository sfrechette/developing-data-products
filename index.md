---
title       : Body Mass Index (BMI)
subtitle    : Developing Data Products Course by Coursera
author      : Stéphane Fréchette - @sfrechette
job         : Student
framework   : io2012   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Introduction

The Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight and obesity in adults. It is defined as the weight in kilograms divided by the square of the height in metres (kg/m2)

Health Risk Classification According to Body Mass Index (BMI):

* < 18.5 : Underweight
* 18.5 - 24.9 : Optimal weight
* 25 - 29.9 : Overweight
* >= 30 : Obese

---

## How to calculate the Body Masss Index (BMI)

### You can calculate your BMI using this formula:

**BMI = weight(kg)/height(m)2**

Sample R code:

```r
weight <-63
height <-172
bmi <-weight/(height/100)^2
bmi
```

```
## [1] 21.29529
```

---


## Using a Shiny App to calculate your BMI

![](assets/img/bmi.png) 

To experience please follow link to deployed app on shinyapp.io:

[https://sfrechette.shinyapps.io/myShinyApp_BMI/](https://sfrechette.shinyapps.io/myShinyApp_BMI/) 


---


## The R code - > server.R

```r
library(shiny)
bmifunc <- function(height, weight){
    bmi <- round((weight/(height/100)^2), digits =1) 
}
bmifunc2 <- function(height, weight){
    bmi <- weight/(height/100)^2
    if(bmi < 18.5) "Underweight"
    else if(bmi >= 18.5 & bmi <= 24.9) "Normal weight"
    else if(bmi >= 25 & bmi <= 29.9) "Overweight"
    else "Obese"
}
shinyServer(
    function(input, output){
        output$bmi <- renderText({bmifunc(input$height, input$weight)})
        output$diagnostic <- renderText({bmifunc2(input$height, input$weight)})
    }
)
```



