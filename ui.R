shinyUI(pageWithSidebar(
   headerPanel("Bloomington, IL House Sale Prices: 2009-2015"),
   sidebarPanel(
      sliderInput('nh', 'Neighborhood',value=c(0,112),min=0,max=112
                        ),
      sliderInput('sf', 'Total Square Feet',value=c(0,6062),min=0,max=6162
      ),
      checkboxGroupInput('stry','House Type',
                         c("1 Story"="1 Story",
                           "1.5 & 1 Story"="1.5 & 1 Story",
                           "1.5 Finished"="1.5 Finished",
                           "1.5 Unfinished"="1.5 Unfinished",
                           "2 & 1 Story"="2 & 1 Story",
                           "2 & 1.5 Story"="2 & 1.5 Story",
                           "2 Story"="2 Story",
                           "Dr/Bi-Level"="Dr/Bi-Level",
                           "L Bi-Level"="L Bi-Level",
                           "Quad-Level"="Quad-Level",
                           "St Bi-Level"="St Bi-Level",
                           "Tri-Level"="Tri-Level"
                         ),selected=
                            c("1 Story"="1 Story",
                              "1.5 & 1 Story"="1.5 & 1 Story",
                              "1.5 Finished"="1.5 Finished",
                              "1.5 Unfinished"="1.5 Unfinished",
                              "2 & 1 Story"="2 & 1 Story",
                              "2 & 1.5 Story"="2 & 1.5 Story",
                              "2 Story"="2 Story",
                              "Dr/Bi-Level"="Dr/Bi-Level",
                              "L Bi-Level"="L Bi-Level",
                              "Quad-Level"="Quad-Level",
                              "St Bi-Level"="St Bi-Level",
                              "Tri-Level"="Tri-Level"
                            ),inline=TRUE),
      checkboxGroupInput('extwall','House Exterior',
                         c("Alum/Vinyl"="Alum/Vinyl",
                           "Brick Front"="Brick Front",
                           "Wood"="Wood",
                           "Brick & Frame"="Brick & Frame",
                           "Brick"="Brick",
                           "Asphalt Shingle"="Asphalt Shingle",
                           "Masonite "="Masonite ",
                           "Stucco"="Stucco"
                         ),selected=
                            c("Alum/Vinyl"="Alum/Vinyl",
                              "Brick Front"="Brick Front",
                              "Wood"="Wood",
                              "Brick & Frame"="Brick & Frame",
                              "Brick"="Brick",
                              "Asphalt Shingle"="Asphalt Shingle",
                              "Masonite "="Masonite ",
                              "Stucco"="Stucco"
                            ),inline=TRUE),
      checkboxGroupInput('bsmnt','Basement',c(
            "Finished"=1,
            "Unfinished"=0),
            selected=(c(
               "Finished"=1,
               "Unfinished"=0)))
      
   ),
   mainPanel(
      h3('Documentation'),
      h4("This shiny app has the sale prices for homes sold in Bloomington, IL from 2009-2015.
         It was scraped from the Bloomington Tax Accessor's website. To use this Shiny App, select
         the inputs in the left panel. Below are the definitions:
         "),
      h3("Neighborhood:"),
      h4("The neigborhoods in Bloomington are numbered, 0 through 112.
         the neighborhood can have an affect on the price.  The slider is used to look
         at groups of neighborhoods. The color of the plot reflects the neighborhood."),
      h3("Total Square Feet:"),
      h4("The x axis of the plot is the total square feet.  You can use the square feet
         slider to zoom in on houses of certain size"),
      h3("House Type:"),
      h4("Use the check boxes to include what type of house you are looking at.
         The Assessor's office did not have definitions for these.  Some like '1 Story' and 
         '2 Story' are pretty self explanatory. The shape in the plot indicates the house type."),
      h3("House Exterior:"),
      h4("This series of checkboxes lets you include/exclude houses with only a certain
         type of exterior.  There is not a visual representation for the graph."),
      h3("Finished Basement:"),
      h4("These check boxes are to let you compare how the value of the house
         changes if the basement is finished.  One checkbox must always be check.  The 
         graph shows finished/unfinished basements by size of the point."),
      plotOutput(outputId = "plot1",  width = "100%")
      ##,verbatimTextOutput('test')
      
   )
))

