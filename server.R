library(ggplot2)
library(scales)
data<-read.csv("HouseValues.csv")
house<-data[,c("SaleDate","SalePrice","Story","TotalSF",
               "NH","ExtWalls","FinAttic","FinBsmt")]
story<-sort(unique(house$Story))
exterior<-sort(unique(house$ExtWalls))
NH<-sort(unique(house$NH))
SFmin<-0
SFmax<-1000000
FinAttic<-c(0,1)
FinBsmt<-c(0,1)


shinyServer(
   function(input, output) {
      housefun<-reactive({
         house1<-house[house$NH>=min(input$nh) & house$NH<=max(input$nh),]
         house2<-house1[house1$Story %in% input$stry,]
         house3<-house2[house2$TotalSF>=min(input$sf) & house$TotalSF<=max(input$sf),]
         house4<-house3[house3$ExtWalls %in% input$extwall,]
         house5<-house4[house4$FinBsmt %in% input$bsmnt,]
         house5
      })
##      p<-reactive({      })
      output$plot1<-renderPlot({
         p<-ggplot(housefun(),aes(TotalSF,SalePrice))
         p<-p+scale_x_continuous(name="Total Square Feet",labels=comma)+
            scale_y_continuous(name="Last Sale Price",labels=dollar)+
            ggtitle("House Sales")
         p<-p+geom_point(aes(colour=factor(NH),size=factor(FinBsmt)),alpha=0.5)+
            scale_size_discrete(range = c(4,7))
         p<-p+geom_point(aes(shape=factor(Story)))+
            scale_shape_manual(values=1:12)+
            theme(legend.key=element_blank())
         p<-p+guides(colour = guide_legend(nrow = 13,override.aes = list(size=5)))
         p<-p+geom_smooth(method='lm',formula=SalePrice~TotalSF)
         p},height = 600, width = 850)
      output$test<-renderPrint(housefun())

   }
)