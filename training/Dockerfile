FROM flinkdevelopmentsuite_flinkdev

ENV LAST_UPDATE 05-02-2016

RUN git clone https://github.com/dataArtisans/flink-training-exercises.git /opt/flink-training-exercises

WORKDIR /opt/project

# add dev user ownership
RUN chown -R $DEV_USER:$DEV_USER /home/$DEV_USER /opt/project /opt/flink-training-exercises

USER $DEV_USER

# install exercices
RUN cd /opt/flink-training-exercises && mvn clean install

# install training
RUN mvn archetype:generate -DarchetypeGroupId=org.apache.flink  -DarchetypeArtifactId=flink-quickstart-scala  -DarchetypeVersion=0.10.1  -DgroupId=org.apache.flink.quickstart  -DartifactId=flink-scala-project  -Dversion=0.2  -Dpackage=org.apache.flink.quickstart  -DinteractiveMode=false

# add exercices to training
RUN cd flink-scala-project && perl -i -0pe 's#</dependency>\n\s*?</dependencies>#</dependency>\n<dependency>\n <groupId>com.dataartisans</groupId>\n <artifactId>flink-training-exercises</artifactId>\n <version>0.2</version>\n</dependency>\n</dependencies>#igs' pom.xml && mvn clean install
