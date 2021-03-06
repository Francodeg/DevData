library(shiny)
library(ggplot2)

library(shinyapps)
library(shiny)
library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$myHist <- renderPlot({
      output$oid1 <- renderPrint({input$id1})
      output$oid2 <- renderPrint({input$id2})
      hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((galton$child - mu)^2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
    })
    
  }
)

# shinyServer(function(input, output) {
#   
#   diamonds <- diamonds[c('carat','color','price')]
#   
#   dataset <- reactive(function() {
#     diamonds[sample(nrow(diamonds), input$sampleSize),]
#   })
#   
#   output$plot <- reactivePlot(function() {
#     
#     p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
#     
#     if (input$color != 'None')
#       p <- p + aes_string(color=input$color)
#     
#     #facets <- paste(input$facet_row, '~', input$facet_col)
#     #if (facets != '. ~ .')
#     #  p <- p + facet_grid(facets)
#     
#     if (input$jitter)
#       p <- p + geom_jitter()
#     if (input$smooth)
#       p <- p + geom_smooth()
#     
#     print(p)
#     
#   }, height=700)
#   
# })
# 
