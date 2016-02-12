FROM flinkdevelopmentsuite_flink

ENV DEV_USER dev
ENV SCALA_VER 2.11.7

# install maven
RUN apt-get install -y maven

#install scala
ADD http://www.scala-lang.org/files/archive/scala-$SCALA_VER.deb scala.deb
RUN  dpkg -i scala.deb

# install sbt
RUN \
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
apt-get install -y apt-transport-https && apt-get update && \
apt-get install -y sbt

# add user
RUN groupadd -f -g 100  $DEV_USER && \
    useradd -s /bin/bash -u 1000 -g users $DEV_USER && \
    mkdir -p /home/$DEV_USER && \
    chown -R dev:dev /home/$DEV_USER && \
    usermod -aG sudo $DEV_USER && \
    echo $DEV_USER:$DEV_USER | chpasswd
