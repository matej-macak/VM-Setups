FROM python:3.6

WORKDIR /work

RUN pip install jupyter -U && pip install jupyterlab

COPY requirements.txt /work

RUN pip install --trusted-host pypi.python.org -r requirements.txt

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

WORKDIR /shared

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root","--port=8888","--no-browser"]

# Start with: docker run -it -p 8888:8888 -v ~/OneDrive/Docker/Jupyter:/work jupyter
# -v flag binds the folder as a shared one for the image to see
