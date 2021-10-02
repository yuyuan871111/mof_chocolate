# environment conda
FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
RUN conda install -c conda-forge r 
RUN conda install -c conda-forge r-diagrammer
RUN conda install -c conda-forge r-reticulate 
RUN conda install -c conda-forge r-data.tree
RUN conda install -c conda-forge r-treemap
RUN conda install -c conda-forge r-tidyverse 
RUN conda install -c conda-forge pandas

COPY app.R /app/.
COPY Dashboard /app/Dashboard/.

EXPOSE 7421
ENTRYPOINT ["Rscript", "app.R"]