# Example shiny app docker file
# https://blog.sellorm.com/2021/04/25/shiny-app-in-docker/

# get python, shiny server and R from the rocker project
FROM python:3
FROM rocker/shiny:4.0.5

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

# install R packages required 
# Change the packages list to suit your needs
RUN R -e 'install.packages(c(\
              "shiny", \
              "shinydasborad", \
              "DiagrammeR", \
              "reticulate", \
              "data.tree", \
              "treemap", \
              "tidyverse", \
              "jsonlite", \
              "magrittr", \
              "Matrix" \
            ), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'

# copy the app directory into the image
COPY ./Dashboard/* /srv/shiny-server/
EXPOSE 3838

# run app
CMD ["R", "-e", "shiny::runApp('/usr/bin/shiny-server/', host='0.0.0.0', port=3838)"]