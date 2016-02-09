FROM ubuntu:trusty

ENV LAST_UPDATE 05-02-2016

RUN apt-get -y update && apt-get -y install
RUN apt-get -y upgrade && apt-get -y install ntp software-properties-common
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java && \
 apt-get -y update && \
 apt-get -y install oracle-java8-installer && \ 
 apt-get install -y oracle-java8-set-default 

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
