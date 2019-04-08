FROM python:3.7

WORKDIR /work

RUN pip install jupyter -U && pip install jupyterlab

COPY requirements.txt /work

### Dependencies for packages

# Install airflow dependencies
ARG SLUGIFY_USES_TEXT_UNIDECODE=yes

# Install python packages in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Post install airflow setup
RUN airflow upgradedb

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.10.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

# Run jupyter notebook
RUN jupyter nbextension enable --py --sys-prefix ipympl
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Install additional useful utilities
RUN apt-get install -y htop \
    && apt-get install -y unzip

# Install SPARKFROM python:3.7

ENV APACHE_SPARK_VERSION 2.4.1
ENV HADOOP_VERSION 2.7

# Set working directory
WORKDIR /install

# First install prerequisites
RUN apt-get update
RUN apt-get install software-properties-common -y

# Install Java
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update -y
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y --allow-unauthenticated

# Get Spark
RUN wget http://mirror.ox.ac.uk/sites/rsync.apache.org/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN tar -xvzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle  
ENV SPARK_HOME=/install/spark
ENV PATH=$PATH:$JAVA_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH

WORKDIR /home

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root","--port=8888","--no-browser"]

# Start with: docker run -it -p 8888:8888 -v ~/OneDrive/Docker/Jupyter:/work jupyter
# -v flag binds the folder as a shared one for the image to see
