library(shiny)

#----------------------------------------------------------------------------------------------------
ui <- pageWithSidebar(
   headerPanel("Hello World"),
   sidebarPanel(actionButton("helloButton", "Greet")),
   mainPanel()
)
#----------------------------------------------------------------------------------------------------
server <- function(input, output)
{
   observeEvent(input$helloButton, {
           print("Hello world!")
           })
}
#----------------------------------------------------------------------------------------------------
app <- shinyApp(ui, server)


