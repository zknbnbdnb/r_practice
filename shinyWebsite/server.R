
source("public_functions.R")



function(input, output, session) {
  
##################### Home Page START! ##################### 
  load("data/statistics/final_data.RData")
  load("data/statistics/process1_data.RData")
  output$tools_count <- renderValueBox({
    valueBox(
      value = 83457379, # formatC(downloadRate, digits = 1, format = "f"),
      subtitle = "美国总感染人数",
      icon = icon("area-chart"),
      color = "yellow" # if (downloadRate >= input$rateThreshold) "yellow" else "aqua"
    )
  })
  
  output$download <- renderValueBox({
    valueBox(
      value = 526703304, 
      subtitle = "全球感染人数",
      icon = icon("download"),
      color = "red"
    )
  })
  
  output$circrna_publication_count <- renderValueBox({
    valueBox(
      value = 1186429, 
      subtitle = "中国总感染人数",
      icon = icon("bar-chart-o"),
      color = "green"
    )
  })
  
  output$pl = renderPlot({
    ggplot(process1_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases, 
                             color = location, size = total_cases)) + geom_line()
  })
  
  output$showtable = DT::renderDataTable({
    datatable(final_data)
  })
##################### Home Page END! ##################### 
  

  
  
  ##################### News Page START! ##################### 
  output$rice_areas <- renderValueBox({
    valueBox(
      value = 118, # formatC(downloadRate, digits = 1, format = "f"),
      subtitle = "全世界接种疫苗量（亿）",
      icon = icon("area-chart"),
      color = "yellow" # if (downloadRate >= input$rateThreshold) "yellow" else "aqua"
    )
  })
  
  output$rice_pulation <- renderValueBox({
    valueBox(
      value = 47, 
      subtitle = "完整接种人数（亿）",
      icon = icon("users"),
      color = "aqua"
    )
  })
  output$rice <- renderValueBox({
    valueBox(
      value = "60.8%", 
      subtitle = "占总人口比重",
      icon = icon("bar-chart-o"),
      color = "red"
    )
  })
  ##################### News Page END! ##################### 
  
  
  
  
  
  
   
##################### Statistic Pages START! ##################### 
  get.slider.year.range <- reactive({
    # 
    data.frame(start = input$year.range[1],
               end   = input$year.range[2]
    )
  })
  
  load("data/statistics/publications.statistics.RData")
  
  output$plot.publications.count <- renderEcharts4r({
    
    data4plot <- publications.statistics.data 
    
    range <- get.slider.year.range()
    
    data4plot <- subset(data4plot, Year <= range$end & Year >= range$start)
    statistic.data <- get.statistic.data4echart4r(data4plot)
    
    width = 20
    statistic.data %>% 
      e_charts(years) %>% 
      e_bar(tools, barWidth = width) %>% 
      e_pictorial(papers, symbol = "rect", symbolRepeat = TRUE, z = 1, 
                  symbolSize = c(width, 4)) %>% 
      e_theme("westeros") %>% 
      e_title("",subtext = "The counts of publications")
    
  })
  
  output$plot.tools.count <- renderPlot({
    
    data4plot <- subset(publications.statistics.data, Type == "Tools")
    
    range <- get.slider.year.range()
    
    data4plot <- subset(data4plot, Year <= range$end & Year >= range$start)
    
    ggplot(data4plot)+
      geom_bar(aes(x=as.factor(Year), fill=Journal)) +
      ylab("The counts of tools") +
      xlab("Year")+
      coord_flip() +
      theme_bw() 
    
  })
  
  
  # scatterplot
  
  
  
##################### Statistic Pages END! #####################
  

  
  
##################### Browse Data Page START! #####################
  
  output$showtable = DT::renderDataTable({
    datatable(final_data)
  })
  
##################### Browse Page END! #####################  
  
  
  
  
  
##################### Network Pages Start! #####################
  
  
  load("data/networks/tool.review.edge.data.RData")
  load("data/networks/tool.review.node.data.RData")
  
  get.network.slider.year.range <- reactive({
    # 
    data.frame(start = input$network.range[1],
               end   = input$network.range[2]
    )
  })
  
  output$plot.network <-  renderEcharts4r({
    
     range <- get.network.slider.year.range()  
     
     nodes <- subset(tool.review.node.data, year <= range$end & year >= range$start)
     
     nodes$citation <-  nodes$citation + 10
     
     edges <- tool.review.edge.data
      
     e_charts() %>% 
     e_graph() %>% 
     #e_graph_gl(layout = "force") %>%
     e_graph_nodes(nodes, pmid, citation, size, type) %>% 
     e_graph_edges(edges, source, target) %>% 
     e_tooltip() %>%
     e_show_loading()
    
  })
  
  
##################### Network Pages End! #####################

}