install.packages("shiny")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("plotly")
install.packages("shinydashboard") # For a more polished UI design


library(shiny)
library(ggplot2)
library(dplyr)

# Sample survey data (replace with your actual dataset)
data <- data.frame(
  ProgLang = c("JavaScript", "Python", "SQL", "Java", "C#"),
  Count = c(19637, 15667, 15327, 9639, 8598)
)

# UI
ui <- fluidPage(
  titlePanel("Eduvos IT Graduate Survey Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      # Input for selecting programming language
      selectInput("progLang", "Choose a Programming Language:", choices = unique(data$ProgLang))
    ),
    mainPanel(
      plotOutput("progLangPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$progLangPlot <- renderPlot({
    # Filter data based on user input
    filtered_data <- data %>%
      filter(ProgLang == input$progLang)
    
    # Plotting selected programming language
    ggplot(filtered_data, aes(x = ProgLang, y = Count)) +
      geom_bar(stat = "identity", fill = "magenta") +
      labs(title = paste("Usage of", input$progLang), y = "Count") +
      theme_minimal()
  })
}

# Run the app
shinyApp(ui = ui, server = server)


# UI
ui <- fluidPage(
  titlePanel("Eduvos IT Graduate Survey Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("studyField", "Choose a Study Field:", choices = c("IT", "Computer Science", "Engineering")),
      actionButton("update", "Update Data")
    ),
    mainPanel(
      plotOutput("progLangPlot"),
      plotOutput("dbPlot")
    )
  )
)

# Server
server <- function(input, output) {
  
  # Observe the button click to update data (you can load your actual data here)
  observeEvent(input$update, {
    
    # Example of plotting programming languages (use your actual dataset)
    output$progLangPlot <- renderPlot({
      ggplot(data, aes(x = ProgLang, y = Count)) +
        geom_bar(stat = "identity", fill = "darkgreen") +
        labs(title = "Top Programming Languages", y = "Count") +
        theme_minimal()
    })
    
    # Example of plotting databases (use your actual dataset)
    output$dbPlot <- renderPlot({
      ggplot(data, aes(x = ProgLang, y = Count)) + # Modify for databases
        geom_bar(stat = "identity", fill = "blue") +
        labs(title = "Databases Used", y = "Count") +
        theme_minimal()
    })
  })
}

# Run the app
shinyApp(ui = ui, server = server)

