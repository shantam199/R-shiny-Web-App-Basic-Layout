library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyServer(function(input, output, session){

   #for showing the data tab has the mtcars dataset
  output$mydatatable = renderDataTable({mtcars})
  
  #for showing the first few observations of mtcars dataset (fig 4)
  output$data = renderTable({
    head(mtcars)
    })
  
  ##Plotly Scatter PLot (fig 1)
  output$plot1 = renderPlotly({
    plot_ly(data=mtcars,
           x=~wt,
           y=~mpg,
           type = "scatter",
           mode = "markers")
  })
  
  #plotly Histogram (fig 2)
  output$plot2 = renderPlotly({
    plot_ly(data=mtcars,x=~mpg,type="histogram")
  })
  
  ##Plotly  (fig 3)
  output$plot3 = renderPlotly({
    plot_ly(data=mtcars,x=~cyl,type = "bar")
  })
  
  ## Plotly (fig 4)
  output$plot4 = renderPlotly({
    plot_ly(data = mtcars,x=~table(mtcars$gear),type= "bar")
  })
  
  ##plotly (fig 5)
  output$plot5 = renderPlotly({
    plot_ly(mtcars,labels= ~mtcars$gear,values = ~mtcars$gear,type = "pie")%>%
      layout(title = 'Pie chart of distribution of cars by gears',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  ## infoboxoutput (ApprovedSales)
  output$ApprovedSales = renderInfoBox({
    infoBox("Approval Sales","10,00,000",icon = icon("bar-chart-o"))
  })
  
  
    }
)