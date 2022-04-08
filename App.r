library(shiny)
library(shinythemes)

data = data.frame(Population=sample(1:20,05,10),Households = sample(1:20,05,10), year=sample(c(2000,2005,2010),10,replace=T))

ui <- fluidPage(
  titlePanel(title = h4("CS 305 Shiny App - Week 11 Assign", align="left")),
  sidebarPanel(
    
    radioButtons("YEAR", "Select the Census Year",
                 choices = c("2000", "2005", "2010"),
                 selected = "2000")),
  
  
  mainPanel(
    plotOutput("bar",height = 500))
)

server <- function(input,output){
  
  reactive_data = reactive({
    selected_year = as.numeric(input$YEAR)
    return(data[data$year==selected_year,])
    
  })
  
  output$bar <- renderPlot({
    
    color <- c("Orange", "Green")
    
    ourData <- reactive_data()
    
    barplot(colSums(ourData[,c("Population","Households")]),
            ylab="Total",
            xlab="Census Year",
            names.arg = c("Population", "Households"),
            col = color)
  })
}

shinyApp(ui=ui, server=server)
