library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(shinythemes)
library(plotly) 
library(wesanderson)
library(DT)
library(tidyverse)
library(RColorBrewer)
library(dplyr)
library(shinyBS)
library(shinyjs)
library(shinycssloaders)
library(plyr)
library(fmsb)
library(scales)
library(pheatmap)
library(colorspace)
library(cluster)
library(factoextra)
library(NbClust)



ui = tagList(
  #shinythemes::themeSelector(),
  navbarPage(
    theme = shinytheme("flatly"),
    #theme = shinytheme("slate"), # <--- To use a theme, uncomment this
    "PAPIME",
    
    
    tabPanel("Acerca de", icon = icon("home"),
             
             column(width = 12, align="center",
                    img(src="portada222.jpg", width = 1850, height = 450, align = "left"),
                    br()
                    
                    
             ),
             column(width = 12, align="center",
                    br(),
                    br()
                    
             ),
             
             column(width = 12, align="center",
                    h1("Informacion"),
                    br(),
             ),
             
             
             column(width = 3, align="center",
                    
                    
             ),
             column(width = 2, align="center",
                    img(src="person1.png", width = 200, align = "center"),
                    br(),
                    h2("Rugoscopia", align = "center"),
                    p("Tecnica de la Odontologia Forense orientada a la identificacion
                    e individualizacion de personas a traves de analisis morfoscopico de la forma,
                      tamano y posicion de las rugas palatinas.")
             ),
             column(width = 2, align="center",
                    img(src="person1.png", width = 200, align = "center"),
                    br(),
                    h2("Queiloscopia"),
                    p("Tecnica de la Odontologia Forense orientada a la identificacion
                    e individualizacion de personas a traves de analisis morfoscopico de la forma,
                      tamano y posicion de las rugas palatinas.")
             ),
             column(width = 2, align="center",
                    img(src="person1.png", width = 200, align = "center"),
                    br(),
                    h2("  Dactiloscopia", align = "center"),
                    p("Tecnica de identificacion de personas fisicamente consideradas por medio de la 
                      impresion o reproduccion  fisica de los dibujos  formados por las 
                      crestas papilares en las yemas de los dedos de las manos.")
                    
             ),
             
             column(width = 12, align="center",
                    br(),
                    
                    br(),
                    br()
             ),
             fluidRow(width = 12, align = "center",
                      column(width = 2, align="center",
                             
                      ),
                      
                      column(width = 4, align="center",
                             br(),
                             br(),
                             h2(strong("Proyecto:"), "PE201421"),
                             h3(strong("Objetivo:"), "Propuesta didactica interactiva para 
                              la identificacion humana a traves del analisis 
                              comparativo de patrones morfologicos en dactiloscopia 
                              y odontologia forense.")
                             
                             
                      ),
                      column(width = 4, align="center",
                             img(src="logo2.jpg", width = 200, align = "center"),
                             
                             
                      ),
                      
             ),
             
             
             
             
             
             
             
             ###################################
    ),
    
    tabPanel("Rugoscopía", icon = icon("graduation-cap"),
             shinyjs::useShinyjs(),
             #sidebarPanel(width = 4),
             mainPanel(width = 12,
                       tabsetPanel(
                         tabPanel("Ingreso de Datos",
                                  shinyjs::useShinyjs(),
                                  
                                  
                                  br(),
                                  sidebarPanel(width = 12,align="center",
                                               fluidRow(width = 12, align="right",
                                                        column(width = 12,align="right",
                                                        actionButton("Text1",  "Sobre los datos", icon=icon("book"))
                                                        )
                                               )
                                  ),
                                  bsModal(id="text_1", title = "Diccionario de Datos", trigger = "Text1", size="large",
                                          withSpinner(htmlOutput("text1"))),
                                  
                                  sidebarPanel(width = 12,
                                               fluidRow(width = 12,
                                                        
                                                        column(width = 6,align="left",
                                                               textInput("ID", p("ID")),
                                                               numericInput("Edad",
                                                                            p("Edad"),
                                                                            min = 0,
                                                                            max = 100,
                                                                            step = 1,
                                                                            value = 0),
                                                               selectInput("Origen", 
                                                                           p("Lugar de Origen"),
                                                                           choices = list("Aguascalientes" = "Aguascalientes",
                                                                                          "Baja California" = "Baja California",
                                                                                          "Campeche" = "Campeche",
                                                                                          "Chiapas" = "Chiapas",
                                                                                          "Chihuahua" = "Chihuahua",
                                                                                          "Colima" = "Colima",
                                                                                          "Durango" = "Durango",
                                                                                          "Edo. Mexico" = "Edo. Mexico",
                                                                                          "Ciudad de Mexico" = "Ciudad de Mexico",
                                                                                          "Otro" = "Otro"),
                                                                           
                                                                           selected = 1),
                                                               selectInput("Paladar",
                                                                           p("Forma del paladar"),
                                                                           choices = list("Arciforme" = "Arciforme",
                                                                                          "Triangular" = "Triangular",
                                                                                          "Rectangular" = "Rectangular"),
                                                                           selected = 1),
                                                               selectInput("Papila",
                                                                           p("Forma de la Papila Incisal"),
                                                                           choices = list("Redonda, separada" = "R/S",
                                                                                          "Redonda, unida" = "R/U",
                                                                                          "Alargada, separada" = "A/S",
                                                                                          "Alargada, unida" = "A/U"),
                                                                           
                                                                           selected = 1),
                                                               
                                                               
                                                        ),
                                                        column(width = 6,align="left",
                                                               selectInput("Sex",
                                                                           p("Sexo"),
                                                                           choices = list("Masculino" = "Hombre",
                                                                                          "Femenino" = "Mujer",
                                                                                          "Desconocido" = "Desconocido"),
                                                                           selected = 1),
                                                               
                                                               numericInput("Altura",
                                                                            p("Estatura (cm)"),
                                                                            min = 0,
                                                                            value = 0),
                                                               selectInput("Orientacion",
                                                                           p("Orientacion"),
                                                                           choices = list("Mesial" = "Mesial",
                                                                                          "Lateral" = "Lateral",
                                                                                          "Distal" = "Distal",
                                                                                          "Variada" = "Variada"),
                                                                           
                                                                           selected = 1),
                                                               
                                                               
                                                               selectInput("Prom",
                                                                           p("Prominencia"),
                                                                           choices = list("Elevadas" = "Elevadas",
                                                                                          "Planas" = "Planas",
                                                                                          "No Aplica" = "NA"),
                                                                           
                                                                           selected = 1),
                                                               selectInput("Evaluacion",
                                                                           p("Evaluacion"),
                                                                           choices = list("Primera" = "Primera",
                                                                                          "Segunda" = "Segunda"),
                                                                           selected = 1),
                                                               
                                                        )
                                                        
                                               ),
                                               fluidRow(width = 12,
                                                        column(width = 12, align = "center",
                                                               strong(h4("Patrón de Registro")),
                                                               h4("Izquierda"))),
                                               
                                               fluidRow(width = 12,
                                                        
                                                        column(width = 1, align = "center",
                                                        ),
                                                        
                                                        column(width = 1, align = "center",
                                                               h4(""),
                                                               br(),
                                                               br(),
                                                               p("A"),
                                                               br(),
                                                               br(),
                                                               
                                                               p("B") ),
                                                        
                                                        
                                                        column(width = 1, align = "center",
                                                               strong("Recta"),
                                                               selectInput("rectaai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("rectabi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Curva"),
                                                               selectInput("curvaai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("curvabi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0)),
                                                        column(width = 1, align = "center",
                                                               strong("Angular"),
                                                               selectInput("angularai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("angularbi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Circular"),
                                                               selectInput("circularai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("circularbi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Sinuosa"),
                                                               selectInput("sinuosaai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("sinuosabi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Punto"),
                                                               selectInput("puntoai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("puntobi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Horquilla"),
                                                               selectInput("horquillaai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("horquillabi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Islote"),
                                                               selectInput("isloteai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("islotebi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Delta"),
                                                               selectInput("deltaai", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("deltabi", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        
                                                        
                                               ),
                                               ############################################################### IZQUIERDA
                                               fluidRow(width = 12,
                                                        column(width = 12, align = "center",
                                                               h4("Derecha"))),
                                               
                                               fluidRow(width = 12,
                                                        column(width = 1, align = "center",
                                                        ),
                                                        column(width = 1, align = "center",
                                                               h4(""),
                                                               br(),
                                                               br(),
                                                               p("A"),
                                                               br(),
                                                               br(),
                                                               
                                                               p("B") ),
                                                        
                                                        
                                                        column(width = 1, align = "center",
                                                               strong("Recta"),
                                                               selectInput("rectaad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("rectabd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Curva"),
                                                               selectInput("curvaad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("curvabd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Angular"),
                                                               selectInput("angularad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("angularbd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Circular"),
                                                               selectInput("circularad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("circularbd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Sinuosa"),
                                                               selectInput("sinuosaad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("sinuosabd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Punto"),
                                                               selectInput("puntoad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("puntobd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Horquilla"),
                                                               selectInput("horquillaad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("horquillabd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Islote"),
                                                               selectInput("islotead", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("islotebd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        column(width = 1, align = "center",
                                                               strong("Delta"),
                                                               selectInput("deltaad", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),
                                                               selectInput("deltabd", "",
                                                                           choices = list("0" = 0,
                                                                                          "1" = 1,
                                                                                          "2" = 2,
                                                                                          "3" = 3,
                                                                                          "4" = 4),
                                                                           selected = 0),),
                                                        bsModal(id="dataset", title = "Rugoscopia", trigger = "data", size="large",
                                                                withSpinner(dataTableOutput("data_set"))),
                                                              
                                                        
                                                        
                                                        
                                               ),
                                               
                                               fluidRow(width = 12,
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                               ),

                                               
                                               
                                               ##############################################################
                                               fluidRow(width = 12,
                                                        column(width = 12, align = "center",
                                                               actionButton("save","Add")),
                                               ),
                                               
              
                                               
                                  ),
                                  

                                  shinyjs::useShinyjs(),
                                  
        
                                  
                         ),
                         tabPanel("Datos",
                                  shinyjs::useShinyjs(),
                                  fluidRow(width = 12,
                                           br(),
                                           #column(width = 4, align = "left",
                                           #              plotlyOutput("plotss6")
                                           #             
                                           #),
                                           #column(width = 4, align = "left",
                                           #       #plotlyOutput("plotss6")
                                           #       
                                           #),
                                           #column(width = 4, align = "left",
                                           #plotlyOutput("plotss6")
                                           
                                           #),
                                           
                                           br(),
                                           column(width = 2, align = "left",
                                                  ""),
                                           column(width = 8, align = "left",
                                                  DT::dataTableOutput("totales", width = 500), tags$hr()),
                                           
                                           column(width = 12, align = "center",
                                                  downloadButton('download1',"Download the data") 
                                           )
                                           
                                           #DT::dataTableOutput("responses", width = 500), tags$hr(),
                                           
                                           
                                  ),
                                  
                                  
                                  
                         ),
                         tabPanel("Estadistica Descriptiva",
                                  
                                  br(),column(width = 2, align = "left",
                                              ""),
                                  column(width = 10, align="left",
                                         
                                         
                                         DT::dataTableOutput("desc", width = 500), tags$hr(),
                                         #verbatimTextOutput("summary"),tags$hr()
                                         
                                         
                                  ),
                                  fluidRow(width = 12, align="center",
                                           
                                           column(width = 6, align = "center",
                                                  plotlyOutput("plotss23"),
                                                  plotlyOutput("plotss22")
                                                  
                                                  
                                           ),
                                           column(width = 6, align = "center",
                                                  plotlyOutput("plotss8"),
                                                  plotlyOutput("plotss12")
                                           ),
                                           
                                  ),
                                  
                                  fluidRow(width = 12,
                                           br(),
                                           
                                           column(width = 3, align = "center",
                                                  plotlyOutput("plotss10"),
                                                  
                                           ),
                                           column(width = 3, align = "center",
                                                  plotlyOutput("plotss4"),
                                                  
                                           ),
                                           column(width = 3, align = "center",
                                                  plotlyOutput("plotss3"),
                                                  
                                           ),
                                           column(width = 3, align = "center",
                                                  plotlyOutput("plotss11")
                                                  
                                           ),
                                           br(),
                                           br(),
                                           
                                  )
                                  
                                  
                                  
                                  
                                  
                                  #tableOutput("view")
                                  #verbatimTextOutput("summary")
                                  
                                  #plotlyOutput("plotss",height =560)
                         ),
                         
                         tabPanel("Patrón de Registro",
                                  
                                  
                                  fluidRow(width = 12,
                                           column(width = 6, align = "center",
                                                  h3("Izquierda"),
                                                  plotlyOutput("plotss20"),
                                                  
                                           ),
                                           column(width = 6, align = "center",
                                                  h3("Derecha"),
                                                  plotlyOutput("plotss21")
                                                  
                                           )
                                           
                                  ),
                                  
                                  
                                  
                                  
                                  
                         ),
                         tabPanel("Patron de Agrupamiento",
                                  fluidRow(width = 12, align="center",
                                           column(width = 4, align = "center",
                                                  br(),
                                                  br(),
                                                  br(),
                                                  actionButton("Text2",  "Dendograma", icon=icon("book")),
                                                  bsModal(id="text_2", title = "Acerca de Clustering", trigger = "Text2", size="large",
                                                          withSpinner(htmlOutput("text2")))
                                                  ),
 
                                           
                                           column(width = 4, align = "center",
                                                  br(),
                                                  br(),
                                                  br(),
                                                  #h3("Izquierda"),
                                                  sliderInput('clusters', 'Ingresa el numero de Cluster', 2, min = 2, max = 5)

                                           ),
                                           column(width = 4, align = "center",
                                                  br(),
                                                  br(),
                                                  br(),
                                                  actionButton("Text3",  "Heatmap", icon=icon("book")),
                                                  bsModal(id="text_3", title = "Acerca de Heatmap", trigger = "Text3", size="large",
                                                          withSpinner(htmlOutput("text3")))
                                           ),
                                           
                                           #column(width = 6, align = "center",
                                                  #h3("Izquierda"),
                                                  
                                          #        plotOutput("plotss24")
                                                  
                                                  
                                           #),
                                           column(width = 6, align = "center",
                                                  #h3("Derecha"),
                                                  br(),
                                                  br(),
                                                  br(),
                                                  plotOutput("plotss25")
                                                  
                                           ),
                                           column(width = 6, align = "center",
                                                  #h3("Derecha"),
                                                  br(),
                                                  br(),
                                                  br(),
                                                  plotOutput("plotss26")
                                                  
                                           )
                                  )
                         )
                       )
             ),
             
    ),
    
    tabPanel("Queiloscopía", icon = icon("graduation-cap"), 
             "This panel is intentionally left blank"),
    tabPanel("Daactiloscopia", icon = icon("graduation-cap"), 
             "This panel is intentionally left blank"),
    tabPanel("Contacto", icon = icon("address-book"),
             href = "http://www.cienciaforense.facmed.unam.mx/")
  )
)


#fields <- c("ID","Evaluador","Evaluado","Edad","Origen","Altura","Paladar","Papila","Prom","check","Evaluacion")
fields <- c("ID","Sex","Edad","Origen","Altura","Paladar","Papila","Orientacion","Prom","Evaluacion","rectaai","curvaai","angularai","circularai","sinuosaai","puntoai","horquillaai","isloteai","deltaai","rectabi","curvabi","angularbi","circularbi","sinuosabi","puntobi","horquillabi","islotebi","deltabi","rectaad","curvaad","angularad","circularad","sinuosaad","puntoad","horquillaad","islotead","deltaad","rectabd","curvabd","angularbd","circularbd","sinuosabd","puntobd","horquillabd","islotebd","deltabd")

server = function(input, output) {
  #responses =  NULL
  #create a data frame called responses
  saveData <- function(data) {
    data <- as.data.frame(t(data))
    if (exists("responses")) {
      responses <<- rbind(responses, data)
    } else {
      responses <<- data
    }
  }
  
  loadData <- function() {
    if (exists("responses")) {
      responses
    }
  }
  
  formData <- reactive({
    data <- sapply(fields, function(x) input[[x]])
    
    data
  })
  
  # When the Save button is clicked, save the form data
  observeEvent(input$save, {
    saveData(formData())
  })
  
  # Show the previous responses
  # (update with current response when save is clicked)
  output$responses <- DT::renderDataTable({
    input$save
    DT::datatable(loadData())
  })
  
  output$summary2 <- DT::renderDataTable({
    input$save
    DT::datatable(loadData())
  }) 
  
  
  clusters <- reactive({
    k(loadData(), input$clusters)
  })
  
  
  output$text1 <- renderUI({
    str1 <- paste("ID: Corresponde al numero de cuenta del alumno que realizara la insercion de datos.")
    str2 <- paste("Edad: Corresponde a la edad del evaluado.")
    str3 <- paste("Sexo: Corresponde al sexo del evaluado.")
    str4 <- paste("Lugar de Origen: Si el evaluado se encuentra en algun estado de la Republica Mexicana, en caso contrario elegir 'otro'.")
    str5 <- paste("Estatura: Corresponde al a estatura en centimetros del evaluado.")
    str6 <- paste("Prominencia de Rugocidades: Corresponde a que tan marcadas se encuentran las rugas palatinas.")
    str7 <- paste("Forma del paladar: Corresponde a la forma que tiene el paladar del evaluado, tiene tres opciones.")
    str8 <- paste("Orientacion: Corresponde a la orientacion de las arugas palatinas en base al rafe medio.")
    str9 <- paste("Forma del papila incisal: Corresponde a la forma que tiene la papila incisal del evaluado, tiene cuatro opciones.")
    str10 <- paste("Evaluacion: Indique si es la primera o segunda vez que llena el registro con el mismo sujeto de observacion. ")
    #str11 <- paste("________________________________________________________________________________________________________________")
    str12 <- paste("Patron de Registro: Dividido en dos secciones (Derecha e Izquierda) y estas a su vez, en dos mas (Lado A y Lado B)")
    str13 <- paste("se deben colocar el numero de rugas palatinas que crea conveniente por cada seccion y por cada lado.")

    HTML(paste(
               h5(str1),
               h5(str2), 
               h5(str3), 
               h5(str4), 
               h5(str5), 
               h5(str6), 
               h5(str7), 
               h5(str8),
               h5(str9),
               h5(str10),
               #h5(str11),
               h5(str12),
               h5(str13)
               
               ))
    
  })
  
  
  output$text2 <- renderUI({
    str1 <- paste("El clustering es una tarea que tiene como finalidad principal lograr el agrupamiento de conjuntos ")
    str2 <- paste("de objetos no etiquetados para lograr construir subconjuntos de datos conocidos como Clusters.")
    str3 <- paste("Cada cluster dentro de un grafo esta formado por una coleccion de objetos o datos que a terminos de analisis ")
    str4 <- paste("resultan similares entre si, pero que poseen elementos diferenciales con respecto a otros objetos")
    str5 <- paste("pertenecientes al conjunto de datos y que pueden conformar un cluster independiente.")
    
    
    str6 <- paste("El algortimo de cluster jerarquico agrupa los datos basandose en la distancia entre cada uno")
    str7 <- paste("y buscando que los datos que estan dentro de un cluster sean los mas similares entre si.")
    str8 <- paste("En una representacion grafica los elementos quedan anidados en jerarquias con forma de arbol.")
    

    
    HTML(paste(
      h5(str1),
      h5(str2), 
      h5(str3), 
      h5(str4), 
      h5(str5),
      h5(str6),
      h5(str7),
      h5(str8)
      
      
    ))
    
  })

  output$text3 <- renderUI({
    str1 <- paste("Un heatmap es una tecnica de visualizacion de datos que mide la magnitud")
    str2 <- paste("de un fenomeno en colores representado en una grafica de dos dimensiones.")
    str3 <- paste("La variacion del color puede ser por tono por intensidad, haciendo obvia ")
    str4 <- paste("la lectura del fenomeno sobre el espacio que se trata. ")
    str5 <- paste("Son el resultado de representar, en lugar de valores numericos,")
    str6 <- paste("colores proporcionales al valor de cada variable en cada posicion.")
    
    str7 <- paste("La combinacion de un Dendograma con un heatmap permite ordenar por semejanza")
    str8 <- paste("las filas y/o columnas, a la vez que se muestra el codigo de colores de cada variable.")
    str9 <- paste("Son ampliamente utilizados para visualizar e interpretar datos de expresion genica.")
    str10 <- paste("Se puede combinar metodo de agrupacion que pueden agrupar genes y/o muestras en funcion")
    str11 <- paste("de su patron de expresion genica.")
    
    str12 <- paste("Esto puede ser util para identificar genes que estan comunmente regulados o")
    str13 <- paste("firmas biologicas asociadas con una condicion particular.")
    
    
    
    HTML(paste(
      h5(str1),
      h5(str2), 
      h5(str3), 
      h5(str4), 
      h5(str5),
      h5(str6),
      h5(str7),
      h5(str8),
      h5(str9),
      h5(str10),
      h5(str11),
      h4(str12),
      h4(str13)
      
      
      
    ))
    
  })
  
  
  
  ################################################ PLOT
  
  
  output$plotss <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    data4 <- data3[,3]
    if (is.null(loadData()))
      return(NULL)
    
    #p <- plot_ly(data3, x =~data3[,2] , y = ~data3[,5])
    
    
    p <- ggplot(data3, aes(x=Sex, y = Edad,fill = Sex))
    p <- p + geom_boxplot()
    p <- p + theme_bw()
    p <- p + labs(title = "Edad")
    p <- p + labs(subtitle = "Diagrama de caja y bigotes de edades por sexo")
    #p <- p + scale_fill_manual(values=wes_palette(n=3, name="Darjeeling"))
    #p <- p + scale_fill_brewer(palette="BrBG")
    p <- p + scale_fill_manual(values=c("#f95959", "#455d7a", "#0c3c78", "#04879c")) 
    
    #boxplot(data3$Edad)
  })
  
  output$plotss2 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    data4 <- data3[,3]
    if (is.null(loadData()))
      return(NULL)
    
    #p <- plot_ly(data3, x =~data3[,2] , y = ~data3[,5])
    
    
    p <- ggplot(data3, aes(x=Sex, y=Altura, fill = Sex))
    p <- p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)
    p <- p + theme_bw()
    p <- p + labs(title = "Altura")
    p <- p + labs(subtitle = "Diagrama de caja y bigotes de edades por sexo")
    p <- p + scale_fill_manual(values=c("#f95959", "#455d7a", "#0c3c78", "#04879c")) 
    p
    #boxplot(data3$Edad)
  })
  
  output$plotss3 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    
    p1 <- ggplot(data3, aes(x=Paladar, fill = Sex, color = Sex)) +
      geom_bar(mapping = aes(y = ..count..), alpha = 0.6) 
    #coord_flip()
    
    p1
  })   
  
  output$plotss4 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    
    p1 <- ggplot(data3, aes(x=Prom, fill = Sex, color = Sex)) +
      geom_bar(mapping = aes(y = ..count..), alpha = 0.6) 
    #coord_flip()
    
    p1
    
    
  }) 
  
  output$plotss5 <- renderPlot({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    h <- as.integer(count(data3 %>% filter(Sex == "Hombre")))
    m <- as.integer(count(data3 %>% filter(Sex == "Mujer")))
    
    df <- data.frame(
      group = c("Hombre", "Mujer"),
      value = c(h,m)
    )
    
    grup <- df$group
    percent <- df$value
    
    
    p1 <- ggplot(df, aes( x = '', y = percent, fill = grup)) + theme_bw() + geom_bar(stat = 'identity', color = 'white') + coord_polar('y', start = 0)
    
    
    p1
  }) 
  
  output$plotss6 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    df <- data3[,10]
    
    
    colors <- c("#ff8882","#28b5b5")
    
    data <- data3 %>% group_by(Evaluacion) %>%
      dplyr::summarize(counts = n(),
                       percentage = n()/nrow(data3))
    
    donut <- plot_ly(data = data, labels = ~Evaluacion, values = ~percentage, 
                     type = 'pie', sort= FALSE,
                     marker= list(colors=colors, line = list(color="black", width=1))) %>%
      layout(title="Porcentaje de Evaluaciones")
    donut
  })
  
  output$plotss7 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    
    p <- ggplot(data3, aes(x = Origen, fill = Origen))
    p <- p + geom_bar(width = 1, colour = "white")
    p <- p + geom_text(aes(y = ..count.., label = ..count..),
                       stat = "count", color = "white",
                       hjust = 1.0, size = 3)
    p <- p + theme(legend.position = "none")
    #p <- p + coord_flip()
    
    
    p <- p + labs(title = "Origen")
    p <- p + scale_fill_manual(values=c("#f95959","#e84545","#903749", "#53354a",  "#233142", "#455d7a",  "#389393", "#5eaaa8", "#04879c","#f05945"))
    p
    
  }) 
  
  output$plotss8 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    data3[,3] <- as.integer(data3[,3])
    data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return
    
    norm_func <- function(x){
      (x-min(x))/(max(x)-min(x))
    }
    
    mu <- ddply(data3, "Sex", summarise, grp.mean= mean(Altura))
    
    
    p1 <- ggplot(data3, aes(x=Altura, fill = Sex, color = Sex)) +
      geom_histogram(alpha = 0.6, position = "identity", binwidth = 5, aes(y = ..density..)) +
      geom_density(alpha = 0.3)
    
    p1
    
  }) 
  
  output$plotss12 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    data3[,3] <- as.integer(data3[,3])
    data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return
    
    mu <- ddply(data3, "Sex", summarise, grp.mean= mean(Edad))
    
    
    p1 <- ggplot(data3, aes(x=Edad, fill = Sex, color = Sex)) +
      geom_histogram(alpha = 0.6, position = "identity", binwidth = 5, aes(y = ..density..)) +
      geom_density(alpha = 0.3)
    
    p1
  }) 
  
  output$plotss9 <- renderPlotly({
    input$save
    data3 = loadData()
    
    #data3[,3] <- as.integer(data3[,3])
    data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    table(data3$unoad)
    
    p <- ggplot(data = data3,
                mapping = aes(x = Altura, fill = ..x..)) + geom_histogram(color = "black", binwidth = 10)
    p <- p + labs(title = 'Histograma Frencuancias Altura', x = 'Altura (cm)') + scale_fill_gradient(low='blue', high='red')
    p
    
  }) 
  
  output$plotss10 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    
    p1 <- ggplot(data3, aes(x=Papila, fill = Sex, color = Sex)) +
      geom_bar(mapping = aes(y = ..count..), alpha = 0.6) 
    #coord_flip()
    
    p1
  })
  
  output$plotss11 <- renderPlotly({
    input$save
    data3 = loadData()
    
    data3[,3] <- as.integer(data3[,3])
    #data3[,5] <- as.integer(data3[,5])
    if (is.null(loadData()))
      return(NULL)
    
    p1 <- ggplot(data3, aes(x=Orientacion, fill = Sex, color = Sex)) +
      geom_bar(mapping = aes(y = ..count..), alpha = 0.6) 
    #coord_flip()
    
    p1
  })
  
  
  ### Spider Prueba
  
  output$plotss20 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    for (i in 11:28) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    data5 <- data3 %>% filter(Sex == "Hombre")
    data6 <- data3 %>% filter(Sex == "Mujer")
    
    
    
    rtotalh = colSums (data5[ ,11:28])
    rtotalm = colSums (data6[ ,11:28])
    
    rah <- rtotalh[1]
    cah <- rtotalh[2]
    aah <- rtotalh[3]
    ciah <- rtotalh[4]
    siah <- rtotalh[5]
    pah <- rtotalh[6]
    hah <- rtotalh[7]
    iah <- rtotalh[8]
    dah <- rtotalh[9]
    
    
    rbh <- rtotalh[10]
    cbh <- rtotalh[11]
    abh <- rtotalh[12]
    cibh <- rtotalh[13]
    sibh <- rtotalh[14]
    pbh <- rtotalh[15]
    hbh <- rtotalh[16]
    ibh <- rtotalh[17]
    dbh <- rtotalh[18]
    
    
    
    ram <- rtotalm[1]
    cam<- rtotalm[2]
    aam <- rtotalm[3]
    ciam <- rtotalm[4]
    siam <- rtotalm[5]
    pam <- rtotalm[6]
    ham <- rtotalm[7]
    iam <- rtotalm[8]
    dam <- rtotalm[9]
    
    
    rbm <- rtotalm[10]
    cbm <- rtotalm[11]
    abm <- rtotalm[12]
    cibm <- rtotalm[13]
    sibm <- rtotalm[14]
    pbm <- rtotalm[15]
    hbm <- rtotalm[16]
    ibm <- rtotalm[17]
    dbm <- rtotalm[18]
    
    
    
    
    fig <- plot_ly(
      type = "scatterpolar",
      #r = c(r,c,a,ci,s,p,o,i,d,n),
      #theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta", "No_Aplica"),
      fill = "toself",
      marker = list(colorscale="Greys")
    )
    fig <- fig %>%
      add_trace(
        r = c(rah,cah,aah,ciah,siah,pah,hah,iah,dah),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector A - Hombre"
        #fillcolor=rgb(4,135,156, 150, maxColorValue = 255),
        #marker=list(color=rgb(4,135,156, maxColorValue = 255))
      )
    fig <- fig %>%
      add_trace(
        r = c(ram,cam,aam,ciam,siam,pam,ham,iam,dam),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector A - Mujer"
        #fillcolor=rgb(249,89,89, 150, maxColorValue = 255),
        #marker=list(color=rgb(4,135,156, maxColorValue = 255))
      )
    
    fig <- fig %>%
      add_trace(
        r = c(rbh,cbh,abh,cibh,sibh,pbh,hbh,ibh,dbh),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector B - Hombre"
        #fillcolor=rgb(4,135,156, 150, maxColorValue = 255),
        #marker=list(color=rgb(249,89,89, maxColorValue = 255))
      )
    fig <- fig %>%
      add_trace(
        r = c(rbm,cbm,abm,cibm,sibm,pbm,hbm,ibm,dbm),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector B - Mujer"
        #fillcolor=rgb(249,89,89, 150, maxColorValue = 255),
        #marker=list(color=rgb(249,89,89, maxColorValue = 255))
      )
    
    
    
    fig <- fig %>%
      layout(
        polar = list(
          radiallaxis = list(
            visible = T,
            range = c(0,18)
          )
        )
      )
    
    #fig <- fig %>% layout(autosize = T, width = 450, height = 350, align="left")
    #fig + scale_fill_manual(values=c("#f95959", "#455d7a", "#233142", "#04879c"))
    fig  
  })
  
  output$plotss21 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    for (i in 29:46) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    data5 <- data3 %>% filter(Sex == "Hombre")
    data6 <- data3 %>% filter(Sex == "Mujer")
    
    
    
    rtotalh = colSums (data5[ ,29:46])
    rtotalm = colSums (data6[ ,29:46])
    
    
    rah <- rtotalh[1]
    cah <- rtotalh[2]
    aah <- rtotalh[3]
    ciah <- rtotalh[4]
    siah <- rtotalh[5]
    pah <- rtotalh[6]
    hah <- rtotalh[7]
    iah <- rtotalh[8]
    dah <- rtotalh[9]
    
    
    
    rbh <- rtotalh[10]
    cbh <- rtotalh[11]
    abh <- rtotalh[12]
    cibh <- rtotalh[13]
    sibh <- rtotalh[14]
    pbh <- rtotalh[15]
    hbh <- rtotalh[16]
    ibh <- rtotalh[17]
    dbh <- rtotalh[18]
    
    
    
    
    ram <- rtotalm[1]
    cam <- rtotalm[2]
    aam <- rtotalm[3]
    ciam <- rtotalm[4]
    siam <- rtotalm[5]
    pam <- rtotalm[6]
    ham <- rtotalm[7]
    iam <- rtotalm[8]
    dam <- rtotalm[9]
    
    
    
    rbm <- rtotalm[10]
    cbm <- rtotalm[11]
    abm <- rtotalm[12]
    cibm <- rtotalm[13]
    sibm <- rtotalm[14]
    pbm <- rtotalm[15]
    hbm <- rtotalm[16]
    ibm <- rtotalm[17]
    dbm <- rtotalm[18]
    
    
    
    
    fig <- plot_ly(
      type = "scatterpolar",
      #r = c(r,c,a,ci,s,p,o,i,d,n),
      #theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta", "No_Aplica"),
      fill = "toself"
    )
    fig <- fig %>%
      add_trace(
        r = c(rah,cah,aah,ciah,siah,pah,hah,iah,dah),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector A - Hombre"
        #fillcolor=rgb(4,135,156, 150, maxColorValue = 255),
        #marker=list(color=rgb(4,135,156, maxColorValue = 255))
      )
    fig <- fig %>%
      add_trace(
        r = c(ram,cam,aam,ciam,siam,pam,ham,iam,dam),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector A - Mujer"
        #fillcolor=rgb(4,135,156, 150, maxColorValue = 255),
        #marker=list(color=rgb(4,135,156, maxColorValue = 255))
      )
    
    fig <- fig %>%
      add_trace(
        r = c(rbh,cbh,abh,cibh,sibh,pbh,hbh,ibh,dbh),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector B - Hombres"
        
        #fillcolor=rgb(249,89,89, 150, maxColorValue = 255),
        #marker=list(color=rgb(249,89,89, maxColorValue = 255))
      )
    fig <- fig %>%
      add_trace(
        r = c(rbm,cbm,abm,cibm,sibm,pbm,hbm,ibm,dbm),
        theta = c("Recta", "Curva", "Angular", "Circular", "Sinuosa", "Punto","Horquilla", "Islote", "Delta"),
        name = "Sector B - Mujer"
        
        #fillcolor=rgb(249,89,89, 150, maxColorValue = 255),
        #marker=list(color=rgb(249,89,89, maxColorValue = 255))
      )
    
    
    
    fig <- fig %>%
      layout(
        polar = list(
          radiallaxis = list(
            visible = T,
            range = c(0,18)
          )
        )
      )
    
    #fig <- fig %>% layout(autosize = T, width = 450, height = 350, align="left")
    #fig + scale_fill_manual(values=c("#f95959", "#455d7a", "#233142", "#04879c"))
    fig  
  })
  
  output$plotss22 <- renderPlotly({
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    #data3[,5] <- as.integer(data3[,5])
    data3[,3] <- as.integer(data3[,3])
    
    norm_func <- function(x){
      (x-min(x))/(max(x)-min(x))
    }
    
    #data3[,5] <- norm_func(data3[,5])
    #data3[,3] <- norm_func(data3[,3])
    
    
    p1 <- ggplot(data3, aes(x=Sex, fill = Sex, color = Sex)) +
      geom_boxplot(mapping = aes(y = Edad), alpha = 0.6) +
      coord_flip()
    
    p1
  })
  
  output$plotss23 <- renderPlotly({
    input$save
    data3 = loadData()
    if (is.null(loadData()))
      return(NULL)
    
    data3[,5] <- as.integer(data3[,5])
    #data3[,3] <- as.integer(data3[,3])
    
    norm_func <- function(x){
      (x-min(x))/(max(x)-min(x))
    }
    
    #data3[,5] <- norm_func(data3[,5])
    #data3[,3] <- norm_func(data3[,3])
    
    
    p1 <- ggplot(data3, aes(x=Sex, fill = Sex, color = Sex)) +
      geom_boxplot(mapping = aes(y = Altura), alpha = 0.6) +
      coord_flip()
    
    p1
  })
  
  output$plotss24 <- renderPlot({
    input$save
    data3 = loadData()
    
    
    if (is.null(loadData()))
      
      return(NULL)
    set.seed(123)
    
    for (i in 11:46) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    data4 <- data3[,11:46]
    rownames(data4)<-data3[,1]
    
    df <- scale(data4)
    
    m.distancia <- get_dist(df, method = "euclidian")
    
    k2 <- kmeans(df, input$clusters)
    
    p <-fviz_cluster(k2, data = df, ellipse.type = "euclid", repel = TRUE, star.plot = TRUE)
    p
    
  })
  
  output$plotss25 <- renderPlot({
    input$save
    data3 = loadData()
    
    
    if (is.null(loadData()))
      
      return(NULL)
    set.seed(123)
    
    for (i in 11:46) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    data4 <- data3[,11:46]
    rownames(data4)<-data3[,1]
    
    
    df <- data4
    #Escalamos
    df.scale <- df
    
    
    require(stats)
    #Calculamos las distancias
    res.dist <- dist(x = df.scale, method = "euclidian")
    res.dist
    
    #asignamos los valores de las distancias a X con [Fila_Inicial:Fila_Final][1,7]
    x <- as.matrix(res.dist)[1:length(nrow(res.dist)),1:length(ncol(res.dist))]
    x
    # Redondeamos los valores
    round(x, digits = 4)
    
    #cluster
    res.hc <- hclust(d = res.dist, method = "complete")
    #plot(res.hc)
    
    #require(factoextra)
    #fviz_dend(x = res.hc, cex = 0.7, lwd = 0.7)
    
    require(grDevices)
    colors()
    
    require(scales)
    #a <- palette(rainbow(4))
    #a <- show_col(palette(rainbow(4)))
    
    
    require(ggsci)
    show_col(pal_jco(palette = c("default"))(10))
    show_col(pal_jco("default", alpha = 0.6)(10))
    
    colo <- "npg"
    
    fviz_dend(x = res.hc, cex = 0.7, lwd = 0.7, k = input$clusters,
              rect = TRUE,
              rect_border = colo,
              rect_fill = TRUE,
              k_colors = colo,
              title = "HOLA")
    
  }) #Cluster
  
  output$plotss26 <- renderPlot({
    input$save
    data3 = loadData()
    
    
    if (is.null(loadData()))
      
      return(NULL)
    set.seed(123)
    
    for (i in 11:46) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    data4 <- data3[,11:46]
    rownames(data4)<-data3[,1]
    
    
    mat_data <- data.matrix(data4[,1:ncol(data4)])
    
    P <- pheatmap(mat_data,
                  color = colorRampPalette(c('LightCyan4','LightCyan1','LightCoral'))(100),
                  fontsize = 15,
                  cluster_rows = T,
                  cluster_cols = F,
                  main = "Heatmap"
    )
    P
    
  })
  
  ## Summary
  
  
  output$summary <- renderPrint({
    input$save
    data3 = loadData()
    data3[,3] <- as.integer(data3[,3])
    data3[,5] <- as.integer(data3[,5])
    #aux <- 
    aux <- sum(data3[,3])
    print(aux)
    
    summary(data3[c("Edad", "Altura")])
  })
  
  output$totales <- DT::renderDataTable({
    
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    for (i in 11:46) {
      data3[,i] <- as.integer(data3[,i])
    }
    
    
    data4 <- data.frame()
    
    for (i in 1:length(row(data3[1]))){
      a <- sum(data3[i,c(11,20,29,38)])
      b <- sum(data3[i,c(12,21,30,39)])
      c <- sum(data3[i,c(13,22,31,40)])
      d <- sum(data3[i,c(14,23,32,41)])
      e <- sum(data3[i,c(15,24,33,42)])
      f <- sum(data3[i,c(16,25,34,43)])
      g <- sum(data3[i,c(17,26,35,44)])
      h <- sum(data3[i,c(18,27,36,45)])
      ii <- sum(data3[i,c(19,28,37,46)])
      
      
      data4[i,1] <- data.frame(Recta = a)
      data4[i,2] <- data.frame(Curva = b)
      data4[i,3] <- data.frame(Angular = c)
      data4[i,4] <- data.frame(Circular = d)
      data4[i,5] <- data.frame(Sinuosa = e)
      data4[i,6] <- data.frame(Punto = f)
      data4[i,7] <- data.frame(Horquilla = g)
      data4[i,8] <- data.frame(Islote = h)
      data4[i,9] <- data.frame(Delta = ii)
      
    }
    print(data4)
    rownames(data4)<-data3[,1]
    #data4 <- data.frame(data4, row.names = "Total")
    
    
    DT::datatable(data4, options = list(paging = TRUE, searching = FALSE))
    
    
  })
  
  output$desc <- DT::renderDataTable({
    
    input$save
    data3 = loadData()
    
    if (is.null(loadData()))
      return(NULL)
    
    data3[,5] <- as.integer(data3[,5])
    data3[,3] <- as.integer(data3[,3])
    
    
    
    
    
    
    total <- summarise(data3, 
                       Mimo = min(Altura), 
                       Maximo = max(Altura), 
                       Q1 = round(quantile(Altura, probs = 0.25),4),
                       Mediana = round(median(Altura),4), 
                       
                       Q3 = round(quantile(Altura, probs = 0.75),4),
                       Media = round(mean(Altura),4),
                       Varianza = round(var(Altura),4),
                       Coef_Variacion = round(sd(Altura),4))
    
    total2 <- summarise(data3, 
                        Minimo = min(Edad), 
                        Maximo = max(Edad), 
                        Q1 = round(quantile(Edad, probs = 0.25),4),
                        Mediana = round(median(Edad),4), 
                        
                        Q3 = round(quantile(Edad, probs = 0.75),4),
                        Media = round(mean(Edad),4),
                        Varianza = round(var(Edad),4),
                        Coef_Variacion = round(sd(Edad),4))
    
    total
    
    min <- total[1]
    max <- total[2]
    q1 <- total[3]
    medi <- total[4]
    q3 <- total[5]
    med <- total[6]
    var <- total[7]
    coef <- total[8]
    
    min2 <- total2[1]
    max2 <- total2[2]
    q12 <- total2[3]
    medi2 <- total2[4]
    q32 <- total2[5]
    med2 <- total2[6]
    var2 <- total2[7]
    coef2 <- total2[8]
    
    data5 <- data.frame("Mínimo" = min)
    data5[,2] <- data.frame("Máximo" = max)
    data5[,3] <- data.frame("Q1" = q1)
    data5[,4] <- data.frame("Mediana" = medi)
    data5[,5] <- data.frame("Q3" = q3)
    data5[,6] <- data.frame("Media" = med)
    data5[,7] <- data.frame("Varianza" = var)
    data5[,8] <- data.frame("Coef. Variación" = coef)
    data5
    
    
    data5[2,1] <- data.frame("Mínimo" = min2)
    data5[2,2] <- data.frame("Máximo" = max2)
    data5[2,3] <- data.frame("Q1" = q12)
    data5[2,4] <- data.frame("Mediana" = medi2)
    data5[2,5] <- data.frame("Q3" = q32)
    data5[2,6] <- data.frame("Media" = med2)
    data5[2,7] <- data.frame("Varianza" = var2)
    data5[2,8] <- data.frame("Coef. Variación" = coef2)
    
    data5 <- data.frame(data5, row.names = c("Altura","Edad"))
    
    
    DT::datatable(data5, options = list(paging = FALSE, searching = FALSE))
    
    
  })
  
  
  
  output$download1 <- downloadHandler(
    file = function() {
      paste("data-", ".csv", sep="")
    },
    content = function(file) {
      write.csv(loadData(), file)
    }
  ) 
  
  
  
  
}



shinyApp(ui, server)