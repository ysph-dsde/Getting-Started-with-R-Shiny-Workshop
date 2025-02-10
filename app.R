# Load necessary libraries
library(shiny)
library(tidyverse)

# Read in the dataset containing vaccine doses administered
vaccine_doses_admin <- read_csv("vaccine_doses_admin.csv")

# Define the User Interface (UI) of the Shiny App
ui <- fluidPage(
  # App title displayed at the top
  titlePanel(title = "Vaccine Shiny App"),
  # Create a layout
  sidebarLayout(
    # sidebar
    sidebarPanel(
      # Dropdown menu for selecting a state
      selectInput("state", "Choose a State:",
                  c("Washington", "Pennsylvania", "Connecticut"))
    ),
    # main area
    mainPanel(
      # Create a plot output
      plotOutput("plot")
    )
  )
)

# Define the server
server <- function(input, output, session) {
  # Generate the plot based on the selected state
  output$plot <- renderPlot({
    vaccine_doses_admin |>
      # Filter data based on selected state
      filter(Province_State == input$state) |>
      # Plot using ggplot2
      ggplot(aes(x = date, y = doses_admin)) +
      geom_line(color = "#00356B") +
      scale_y_continuous(labels = scales::comma) +
      labs(
        title = paste0("Cumulative # of Doses Administered Over Time in ", input$state),
        subtitle = "Dec 14th, 2020 - Mar 9th, 2023",
        x = NULL,
        y = NULL
      ) +
      theme_minimal(base_size = 18) +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1)
      )
  })

}

# Run the Shiny app
shinyApp(ui, server)

# Questions---
# 1. Add another state to the dropdown menu
# Hint: Look for the selectInput() function in the sidebarPanel().

# 2. Modify the app so that the selected state is displayed above the plot.
# Hint: Add textOutput()/renderText()
