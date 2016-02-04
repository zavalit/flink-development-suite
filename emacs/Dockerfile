FROM flinkdevelopmentsuite_training 

ENV EMACS_VERSION="24.5"

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


# fonts for emacs
ADD ./.fonts /home/$DEV_USER/.fonts
RUN fc-cache -fv

# provide builder settings
ADD ./settings.xml /home/$DEV_USER/.m2/
ADD ./.sbt /home/$DEV_USER/.sbt

# apply user ownership for added files
RUN chown -R $DEV_USER /home/$DEV_USER/.sbt /home/$DEV_USER/.m2 

USER $DEV_USER

# install ensime depenencies
WORKDIR /opt/project/flink-scala-project
RUN mvn dependency:sources && mvn ensime:generate 

CMD ["emacs"]
