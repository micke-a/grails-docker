FROM java:7

MAINTAINER Mikael Andersson <mail.micke@gmail.com>

ENV SDKMAN_DIR /usr/local/sdkman

RUN set -x \
    && apt-get update \
    && apt-get install -y unzip zip python-pip --no-install-recommends 

RUN	pip install --upgrade pip 
RUN pip install awscli


RUN curl -s get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config

#WORKDIR $SDKMAN_DIR

RUN /bin/bash -c "source \"${SDKMAN_DIR}/bin/sdkman-init.sh\" && sdk install grails 2.2.4"
