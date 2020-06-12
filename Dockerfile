FROM rocker/r-ver:4.0.0

ENV CRAN_REPOSITORY http://cran.rstudio.com 

# Based on rocker/tidyverse.
#
RUN apt-get update -qq \
    && apt-get -y --no-install-recommends install \
        libxml2-dev \
        libcairo2-dev \
        libsqlite-dev \
        libmariadbd-dev \
        libmariadbclient-dev \
        libpq-dev \
        libssh2-1-dev \
        unixodbc-dev \
        libsasl2-dev \
        libcurl4-openssl-dev \
        libsodium-dev \
        libssl-dev \
        libtiff5-dev \
    && install2.r -r $CRAN_REPOSITORY --error \
        --deps TRUE \
        tidyverse \
        dplyr \
        devtools \
        formatR \
        remotes \
        selectr \
        lubridate \
        patchwork \
        here \
        glue \
        blogdown \
        gt \
        png \
        ggraph \
        ggtext \
        readxl \
        writexl \
        Hmisc \
    && R -e "blogdown::install_hugo(version = '0.63.1', extended = TRUE)"
