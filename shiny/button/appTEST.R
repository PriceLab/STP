library(shiny)
df <- read.table("smalldata.txt", header = TRUE, sep = "\t", stringsAsFactors= FALSE)
#----------------------------------------------------------------------------------------------------
if (interactive()) {
ui <-pageWithSidebar(
    headerPanel("Plot"),
    sidebarPanel(
        selectInput("colOption1", #drop down menu 1
                    label = "Choose a X variable to display",
                    choices = c(colnames(df))),
                   selected = "option",
         textOutput("selected_colOption1"),

         selectInput("colOption2", #drop down menu 2
                   label = "Choose a Y variable to display",
                   choices = c(colnames(df))),
                   selected = "option",
        textOutput("selected_colOption2")
        ),
    mainPanel(
        fluidPage(
            actionButton("goButton", "Go!"),
            plotOutput("xyPlot"),
            verbatimTextOutput("info"))
            )
)
#----------------------------------------------------------------------------------------------------
server <- function(input, output) {

    output$selected_var <- renderText({
        paste("X value:",  input$colOption1, "Y value:", input$colOption2)
    })

    output$xyPlot <- renderPlot({

        topMenuChoice = isolate(input$colOption1)
        bottomMenuChoice = isolate(input$colOption2)

        print("plot")
        plot(df[, colOption1], df[,colOption2])
        print("after plot")

        print("abline")
        model <- lm(df[, colOption1] ~ df[, colOption2])
        abline(model)
        print("after abline")

        print("go button")
        input$goButton
        print("after go button")

        })

}
#----------------------------------------------------------------------------------------------------
app <- shinyApp(ui, server)
shinyApp(ui = ui, server = server)
}
