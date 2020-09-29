function(input, output, session) {
  ### Genus part
  ##########################
  ## select genus data
  dataInput <- function(x){
    renderTable(mygenus[[x]], caption = x)
  }
  
  ## set search button
  search <- eventReactive( input$searchButton,{input$Genus} )
  
  ## using UI to print tables together
  output$table <- renderUI({
    # select one or more genus/genera
    Genus_selected <- search()
    # grab data according to selected genera
    output <- lapply( Genus_selected, dataInput )})
  
  
  ## making tidy data for Decision tree
  observeEvent(search(), {
    req(length(input$Genus) >= 2)
    # print(input$Genus) ###use for debug###
    table_merge <- genus_tidy_data(input$Genus)
    output$table_merge <- renderDataTable(table_merge)
    })


  ##########################
  ### Functions part 
  ##########################
  
  ## The ui of choosing functions
  output$ui_functions <- renderUI({
    if (input$Function == "")  # prevent getting empty value(for "Choose" option)
      return()
    # radioButton setting ( including radio and radio_radio )
    if ( grepl("radio", Functiontype[[input$Function]]) ){
      radioButtons("Function_radioInput", input$Function, 
                 choices = sort(names(functions_data[[input$Function]])))
      # slider setting
      }else if(Functiontype[[input$Function]] == "slider"){
        slider_max <- max(plot_data[[input$Function]][["max"]])
        slider_min <- min(plot_data[[input$Function]][["min"]])
        sliderInput("Function_sliderInput", input$Function, 
                    min = slider_min, max = slider_max, value = c(slider_min, slider_max), step = 0.1)
        # selectBox setting
        }else if(Functiontype[[input$Function]] == "select"){
          selectInput("Function_selectInput" , paste(input$Function, "(multiple choices)"), multiple = T,
                      choices = sort(names(functions_data[[input$Function]])),
                      selectize = F, width = "100%",
                      size = length(names(functions_data[[input$Function]])))
          }
    })
  
  ## Double radioButton ui setting
  output$ui_functions_radio <- renderUI({
    # only emerge when choosing double radioButton
    if(input$Function == "" || Functiontype[[input$Function]] != "radio_radio")
      return()
    # double radioButton setting
    radioButtons("Function_radioInput_sub", "",
                  choices = names(functions_data[[input$Function]][[input$Function_radioInput]]))
  })
  
  ## Search the data and show the result (radio_radio, radio, select, select)
  Functions_data_input <- function(type, x, y, z){
    # type "radio_radio"; empty: no data, exist: show data (3 layers: 'x', 'y', 'z')
    if(type == "radio_radio"){
       if(length(functions_data[[x]][[y]][[z]][[1]]) == 0){
         return(cat("No data.\n"))
         }else{
           return(cat(functions_data[[x]][[y]][[z]][[1]], sep = "\n"))
         }
      # type "radio"; empty: no data, exist: show data (2 layers: 'x', 'y')
     }else if (type == "radio"){
       if(length(functions_data[[x]][[y]][[1]]) == 0){
         return(cat("No data.\n"))
       }else{
         return(cat(functions_data[[x]][[y]][[1]], sep = "\n"))
       }
      # type "select"; empty: no data, exist: show data (with features' names)
     }else if (type == "select"){
       if(length(functions_data[[x]][[y]][[1]]) == 0){
         return({
           cat(paste(y, "\n\t", sep = ""))
           cat("No data.\n")})
       }else{
         return({
           cat(paste(y, "\n\t", sep = ""))
           cat(functions_data[[x]][[y]][[1]], sep = "\n\t")})
       }
     }
  }
  
  ## Text printing
  # (slider: impl txt, radio_radio: results, radio: results, select: results)
  output$functions_text <- renderPrint({
    # "choose"
    if(input$Function == "")
      return(cat("Please select at least one function."))
    # type "slider": print supplemental text 
    else if(Functiontype[[input$Function]] == "slider")
      cat(slider_supl_txt)
    # type "radio_radio": print results
    else if(Functiontype[[input$Function]] == "radio_radio") 
      Functions_data_input(Functiontype[[input$Function]], input$Function, input$Function_radioInput, input$Function_radioInput_sub)
    # type "radio": print results
    else if(Functiontype[[input$Function]] == "radio")
      Functions_data_input(Functiontype[[input$Function]], input$Function, input$Function_radioInput)
    # type "select": print results 
    else if(Functiontype[[input$Function]] == "select"){
      # No select: print reminder; select: print results
      if(length(input$Function_selectInput) == 0)
        return(cat("Please select at least one feature."))
      # "invisible" in order to preventing printing the null list returning by lapply[]
      invisible(lapply(input$Function_selectInput, function(x){
        Functions_data_input(Functiontype[[input$Function]], input$Function, x)}))
      }
  })
  
  ## Plot for some numeric data (type "slider")
  output$functions_plot <- renderPlot({
    # Don't show plot(empty plot) when not selecting type "slider" data
    if(input$Function == "" || Functiontype[[input$Function]] != "slider")
      return( plot.new() )
    # plot
    plot_func(input$Function_sliderInput[2], 
              input$Function_sliderInput[1], input$Function) 
  })
  ##########################
  ### Decision tree part
  ##########################
  
  ## create a empty variable
  mydata <- reactiveValues()
  
  ## works when click the button
  observeEvent(input$searchButton_species, {        
    # check there are data input 
    req(input$Species_selected)
    
    # species merge table output
    mydata$table_merge_species <- species_tidy_data(input$Species_selected)
    
    # Select features UI
    feature_choices <- colnames(mydata$table_merge_species)[-1]
    output$features_selected <- renderUI({
      output <- selectizeInput('features_selected_', "Choose Features which you want to seperate species(in order):",
                            choices = feature_choices, multiple = T)})
  })
  
  ## the merged table output
  output$table_merge_species <- renderDataTable({
    req(mydata$table_merge_species)
    return(mydata$table_merge_species)})
  
  ## Tree output: form a table
  tree_table <- reactive({
    req(mydata$table_merge_species)
    table_merge_species <- mydata$table_merge_species
    table_merge_species_toTree <- table_merge_species %>% as.data.frame(.) %>%
      column_to_rownames(., var = "SpeciesName") %>% select(input$features_selected_)
    return(table_merge_species_toTree)
  })
  
  ## output Tree: "renderGrViz" for plotting Tree on shiny
  output$Deci_tree_plot <- renderGrViz({
    req(tree_table())
    req(input$features_selected_)
    feature <- getFeature(tree_table())
    genus <- treePlot(tree_table()) 
    if(length(input$features_selected_) == 1)
      return(tree_plot_n1(genus, feature))
    else if(length(input$features_selected_) == 2)
      return(tree_plot_n2(genus, feature))
    else if(length(input$features_selected_) == 3)
      return(tree_plot_n3(genus, feature))
    else if(length(input$features_selected_) == 4)
      return(tree_plot_n4(genus, feature))
    else
      return(tree_plot_general(tree_table()))
  })
  
  ## supplemental text of the tree plot
  output$tree_supl_txt <- renderPrint({
    cat("1. '+': Red; '-': Blue.\n2. If the image is too small to read text, user can move cursor to the blocks to read features or species names.\n3. Above 4 layers, there is no 'red', 'blue' color to indicate '+', '-'.\n4. Above 4 layers, all blocks are green.\n5. Above 4 layers, the results of separation would only show at the bottom but not in the middle.\n")
  })
  
  ## download csv link
  output$Download_data <- downloadHandler(filename = "Species_selected.csv", 
                                          content = function(file_path){
                                            write.csv(mydata$table_merge_species, file_path,
                                                      row.names = F)})

}

