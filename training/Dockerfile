FROM flinkdevelopmentsuite_flinkdev

ENV LAST_UPDATE 28-01-2016
ENV TRAINING_USER dev

ADD ./flink-training-exercises /opt/flink-training-exercises

WORKDIR /opt/project

# add user
RUN groupadd -f -g 100  $TRAINING_USER && \
    useradd -s /bin/bash -u 1000 -g users $TRAINING_USER && \
    mkdir -p /home/$TRAINING_USER && \
    chown -R dev:dev /home/$TRAINING_USER /opt/project /opt/flink-training-exercises  && \
    usermod -aG sudo $TRAINING_USER && \
    echo $TRAINING_USER:$TRAINING_USER | chpasswd

USER $TRAINING_USER

RUN cd /opt/flink-training-exercises && mvn clean install


RUN mvn archetype:generate -DarchetypeGroupId=org.apache.flink  -DarchetypeArtifactId=flink-quickstart-scala  -DarchetypeVersion=0.10.1  -DgroupId=org.apache.flink.quickstart  -DartifactId=flink-scala-project  -Dversion=0.2  -Dpackage=org.apache.flink.quickstart  -DinteractiveMode=false

RUN pwd
# add exercices and build
RUN cd flink-scala-project && perl -i -0pe 's#</dependency>\n\s*?</dependencies>#</dependency>\n<dependency>\n <groupId>com.dataartisans</groupId>\n <artifactId>flink-training-exercises</artifactId>\n <version>0.2</version>\n</dependency>\n</dependencies>#igs' pom.xml && mvn clean install
