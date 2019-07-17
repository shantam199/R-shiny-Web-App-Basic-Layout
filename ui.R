library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)
library(shinythemes)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Mtcars Data Analysis Dashboard",titleWidth = 600),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("About",tabName = "about",icon = icon("clipboard")),
        menuItem("Data",tabName = "data",icon = icon("database")),
        menuItem("myGithub",href = "https://github.com/shantam199",icon = icon("code")),
        menuItem("charts",tabName = "chart",icon = icon("dashboard"))
      )
    ),
    
    dashboardBody(
      tabItems(
        tabItem(tabName = "about",
                fluidRow(
                  infoBox("Sales",100000,icon = icon("thumbs-up")),
                  infoBox("Conversion %",paste0('20%'),icon = icon("warning")),
                  infoBoxOutput("ApprovedSales")
                ),
                fluidRow(box(title = "bar plot",plotlyOutput("plot4",height = 250)),
                box(title = "Pie chart",plotlyOutput("plot5")))),
        
        
        tabItem(tabName = "data",dataTableOutput("mydatatable")),
        
        #within tabitem(), define the pages for sidebar menu items
        
        tabItem(tabName = "chart",
          ##using box to display plot 
          ##first row
          fluidRow(box(title = "Scatter Plot",plotlyOutput("plot1",height = 250)),
                   box(title = "Histogram ",plotlyOutput("plot2",height = 250)),
                   
          ## Second row     
          fluidRow(box(title = "Head  of the data used",tableOutput("data"),width = 7),
                   box(title = "frequency of cylinder With Bar Plot", plotlyOutput("plot3"),width = 5))
          )
          )
        )
    )
  ) 
)