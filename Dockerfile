FROM rocker/verse:4.0.0

ENV CRAN_REPOSITORY http://cran.rstudio.com

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
        libpoppler-cpp-dev \
        libtesseract-dev \
        libleptonica-dev \
        tesseract-ocr-eng \
        libgdal-dev \
        libwebp-dev \
        libavfilter-dev \
        cargo

RUN install2.r -r $CRAN_REPOSITORY --error \
        --deps TRUE \
        devtools \
        remotes \
        formatR \
        selectr \
        lubridate \
        patchwork \
        here \
        glue \
        gt \
        png \
        ggraph \
        ggtext \
        readxl \
        writexl \
        tesseract \
        magick \
        urltools \
        triebeard \
        Hmisc \
        furrr \
        tictoc \
        texPreview \
        backports \
        htmltools \
    && R -e "blogdown::install_hugo(version = '0.74.2', extended = TRUE, force = TRUE)"

CMD ["R"]
