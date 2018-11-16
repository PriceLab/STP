library(shiny)
fileNames <- c("dataBACHELORS.tsv", "dataCERTIFICATION.tsv", "dataHIGHSCHOOL_completion.tsv")
#----------------------------------------------------------------------------------------------------
if (interactive()) {
ui <- pageWithSidebar(
    headerPanel("Relationship Between Race and The Achievement Of Higher Education"),
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
                      xlab= topMenuChoice, ylab= bottomMenuChoice, pch=15, col=c("red", "blue"))
                 model <- lm(df[, topMenuChoice] ~ df[, bottomMenuChoice])
                 abline(model)
             })

         }) # observeEvent
             }) # observe
} # server
#----------------------------------------------------------------------------------------------------
app <- shinyApp(ui, server)
shinyApp(ui = ui, server = server)
}
