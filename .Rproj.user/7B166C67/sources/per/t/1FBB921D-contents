fluidPage(
  navbarPage(title = "Bergey's Manual Vol.3: The Firmicutes",
             # Genus to functions
             ########################
             tabPanel("Genus to Functions", h2('Genus to Functions'),
                      sidebarLayout(
                        
                        # SelectInput and Button on the left
                        sidebarPanel(
                          selectizeInput('Genus', "Choose a Genus:", choices = mygenus_names, multiple = T,
                                         options = list(placeholder = 'Please select genus')),
                          actionButton('searchButton', "Search"), width = 3),
                         
                        # Main output on the right: genus functions table; genus merge table
                         mainPanel(
                          tabsetPanel(
                            # genus functions individual table
                            tabPanel("Genus functions (individual table)",
                                     tags$h3( "Individual table" ),
                                     tags$hr(),
                                     uiOutput('table')),
                            # genus functions merge table
                            tabPanel("Genus functions (merge table)", 
                                     tags$h3( "Merge table" ),
                                     tags$p("This table only shows common features for chosen genera. (At least 2 values in one feature)"),
                                     tags$hr(),
                                     dataTableOutput('table_merge')
                                     ))))),
             
             ########################
             # Function to Genera
             ########################
             tabPanel("Function to Genera",
                      h2("Function to Genera"),
                      sidebarLayout(
                        ## Select input on the left
                        sidebarPanel(
                          # Select functions
                          selectInput("Function", "Choose a function: ", selectize = F,  
                                      choices = c("Choose" = "", sort(functions_name) ),
                                      selected = T),
                          # supplement script
                          includeHTML("www/Funcs_supl.html"),
                          # different type input depending on the data
                          uiOutput("ui_functions"),
                          # only emerge when selecting "radio_radio" type
                          uiOutput("ui_functions_radio")),
                        ## results output on the right
                        mainPanel(
                          # text output
                          verbatimTextOutput("functions_text"),
                          # plot output (control width and height to draw bigger plot)
                          plotOutput("functions_plot", width = "100%", height = "800px")))),
             ########################
             # Decision tree(species)
             ########################
             tabPanel("Decision tree (species)",
                      h2("Decision tree (species)"),
                      sidebarLayout(
                        sidebarPanel(
                          selectizeInput('Species_selected', "Choose(data from Table3):", choices = species_names,
                                         multiple = T, options = list(placeholder = 'Please select species')),
                          actionButton('searchButton_species', 'Search'),
                          tags$hr(),
                          uiOutput('features_selected')
                        ),
                        mainPanel(tabsetPanel(
                          tabPanel('Decision Tree',
                                   verbatimTextOutput('tree_supl_txt'),
                                   grVizOutput('Deci_tree_plot')),
                          tabPanel('Data Table',
                                   downloadLink('Download_data', 'Download csv'),
                                   tags$hr(),
                                   dataTableOutput('table_merge_species'))))
                        ))))
