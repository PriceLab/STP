library(shiny)
fileNames <- c("smalldata.txt", "smalldata2.txt", "smalldata3.txt")
#----------------------------------------------------------------------------------------------------
if (interactive()) {
ui <- pageWithSidebar(
    headerPanel("Plot"),
    sidebarPanel(
                selectInput("selectFileMenu",
                label = "Selected file", #first check box
                choices= c(fileNames)),

    selectInput("colOption1",
                label = "Select X",
                choices = c(colnames(df))),


    selectInput("colOption2",
                label = "select Y",
                choices = c(colnames(df)))
    ),
        mainPanel(
        fluidPage(
            actionButton("goButton", "Go!"),
            plotOutput("xyPlot"),
            verbatimTextOutput("info"))
            )
) # ui
#----------------------------------------------------------------------------------------------------
server <- function(input, output, session) {
         output$xyPlot <- renderPlot({
             plot(0, col="white")
             }) # empty plot

         observe({
             selectedFile <- input$selectFileMenu
             print(selectedFile)
             df <- read.table(selectedFile, header = TRUE, sep = "\t", stringsAsFactors= FALSE)

             updateSelectInput(session,"colOption1",
                               label = paste("Select X"),
                               choices = colnames(df))

             updateSelectInput(session, "colOption2",
                                     label = paste("Select label Y"),
                                     choices = colnames(df))

         observeEvent(input$goButton,{ # go button to plot
             topMenuChoice <- isolate(input$colOption1)
             bottomMenuChoice <- isolate(input$colOption2)

             output$xyPlot <- renderPlot({
                 plot(df[,topMenuChoice], df[,bottomMenuChoice], main="Plot Hypothesis",
                      xlab= topMenuChoice, ylab= bottomMenuChoice)
                 model <- lm(df[, topMenuChoice] ~ df[, bottomMenuChoice])
                 abline(model)
                 print(summary(model))
             })

         }) # observeEvent
             }) # observe
} # server
#----------------------------------------------------------------------------------------------------
app <- shinyApp(ui, server)
shinyApp(ui = ui, server = server)
}
