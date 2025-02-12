# Load necessary libraries
library(shiny)
library(plotly)
library(tidyverse)

# Read in the dataset containing vaccine doses administered
vaccine <- read_csv("vaccine.csv")

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
      plotlyOutput("plot")
    )
  )
)

# Define the server
server <- function(input, output, session) {

  # Generate the plot based on the selected state
  output$plot <- renderPlotly({
    p <- vaccine |>
      mutate(Percentage_at_least_one_dose = (People_at_least_one_dose / Population) * 100,
             Percentage_fully_vaccinated = (People_fully_vaccinated / Population) * 100) |>
      # Filter data based on selected state
      filter(Province_State == input$state) |>
      # Plot using ggplot2
      ggplot() +
      geom_line(aes(x = Date, y = Percentage_at_least_one_dose, group = 1,
                    text = paste0("Date: ", Date, "\n", "At least one dose: ", round(Percentage_at_least_one_dose, 1), "%")),
                color = "#00356B", size = 1.1) +
      geom_line(aes(x = Date, y = Percentage_fully_vaccinated, group = 1,
                    text = paste0("Date: ", Date, "\n", "Fully Vaccinated: ", round(Percentage_fully_vaccinated, 1), "%")),
                color =  "#63AAFF", size = 1.1) +
      scale_x_date(date_labels = "%b %Y") +
      scale_y_continuous(labels = scales::label_percent(scale = 1)) +
      labs(
        title = paste0("Cumulative COVID-19 Vaccination Progress in ", input$state, ": ≥1 Dose vs. Complete Primary Series\nDec 14th, 2020 - Mar 9th, 2023"),
        x = NULL,
        y = "Percentage of the Population"
      ) +
      theme_minimal(base_size = 12)

    ggplotly(p, tooltip = "text")
  })

}

# Run the Shiny app
shinyApp(ui, server)

# Questions---
# 1. Add another state to the dropdown menu.
# Hint #1: Look for the selectInput() function in the sidebarPanel().
# Hint #2: Look for the choices argument in the selectInput() function.

# 2. Add a footnote below the plot citing the data source.
# Footnote:
# Johns Hopkins University Center for Systems Science and Engineering. (2023).
# COVID-19 Vaccine Time Series Data – United States. Retrieved on Feb 12th, 2025, from https://github.com/govex/COVID-19/blob/master/data_tables/vaccine_data/us_data/time_series/time_series_covid19_vaccine_us.csv

# Hint #1: Add textOutput()/renderText()
# Hint #2: Use br() to insert spacing.
