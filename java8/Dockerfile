FROM ubuntu:trusty

ENV LAST_UPDATE 27-01-2016

RUN  apt-get -y update && apt-get -y install 
RUN apt-get -y upgrade && apt-get -y install ntp software-properties-common 
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections 
RUN add-apt-repository -y ppa:webupd8team/java 
RUN apt-get -y update 
RUN apt-get -y install oracle-java8-installer 
RUN apt-get install -y oracle-java8-set-default

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
