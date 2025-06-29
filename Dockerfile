FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y  \
    unzip \
    wget \
    git \
    tesseract-ocr \
    tesseract-ocr-eng \
    tesseract-ocr-jpn \
    tesseract-ocr-deu \
    tesseract-ocr-fra

RUN wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb && \
    dpkg -i jdk-21_linux-x64_bin.deb && \
    rm -r ./jdk-21_linux-x64_bin.deb

ENV JAVA_HOME=/usr/lib/jvm/jdk-21.0.7-oracle-x64/ 
ENV PATH=$PATH:$JAVA_HOME/bin 

RUN git clone --depth 1 https://github.com/Audiveris/audiveris.git && \
    cd audiveris && \
    ./gradlew build && \
    tar -xvf /audiveris/app/build/distributions/app-*.tar \
      --strip-components 1

COPY ./transform.sh /
