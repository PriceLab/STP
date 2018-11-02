library(shiny)
#name <- c(1,2,3)
#num <- c(140,60,74)
#age <- c(20, 23, 24)
#df <- data.frame(name,num, age)

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

     output$xyPlot <- renderPlot({
            plot(0)
            })

    observeEvent(input$goButton,{

        topMenuChoice <- isolate(input$colOption1)
        bottomMenuChoice <- isolate(input$colOption2)

        print(topMenuChoice)
        print(bottomMenuChoice)

        output$xyPlot <- renderPlot({
            plot(df[,topMenuChoice], df[,bottomMenuChoice], main="Plot Hypothesis", xlab= topMenuChoice, ylab= bottomMenuChoice)
            model <- lm(df[, topMenuChoice] ~ df[, bottomMenuChoice])
            abline(model)
            })

        })
}
#----------------------------------------------------------------------------------------------------
app <- shinyApp(ui, server)
shinyApp(ui = ui, server = server)
}
