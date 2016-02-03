FROM zavalit/training 

ENV EMACS_VERSION="24.5"
ENV EMACS_USER=dev 

USER root
# install emacs
RUN \ 
apt-get update && apt-get install -y curl build-essential &&  apt-get build-dep -y emacs24 && \
TMP_DIR=$(mktemp -d) && \
curl -sSL -o $TMP_DIR/emacs.tar.xz http://ftpmirror.gnu.org/emacs/emacs-$EMACS_VERSION.tar.xz && \
tar -xJ -C $TMP_DIR -f $TMP_DIR/emacs.tar.xz && \
cd $TMP_DIR/emacs-$EMACS_VERSION && \
./configure && \
make -j 8 install && \
rm -rf $TMP_DIR

# install sbt for ensime-server
RUN \
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
apt-get install -y apt-transport-https && apt-get update && \ 
apt-get install -y sbt 



# fonts for emacs
ADD ./.fonts /home/$EMACS_USER/.fonts
RUN fc-cache -fv

# provide builder settings
ADD ./settings.xml /home/$EMACS_USER/.m2/
ADD ./.sbt /home/$EMACS_USER/.sbt

# apply user ownership for added files
RUN chown -R $EMACS_USER /home/$EMACS_USER/.sbt /home/$EMACS_USER/.m2 

USER $EMACS_USER

# install ensime depenencies
WORKDIR /opt/project/flink-scala-project
RUN mvn dependency:sources && mvn ensime:generate 

CMD ["emacs"]
