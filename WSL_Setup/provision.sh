#!/bin/bash

## This is a new version of Neuron box

export PYTHON_VERSION=3.7.2
export PIP_VERSION=${PYTHON_VERSION:0:3}
# export PIP_VERSION=3.7

# Update dependencies
sudo apt-get update
sudo apt-get install build-essential -y
sudo apt-get install python3-dev -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install libreadline-gplv2-dev libffi-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
sudo apt-get install liblzma-dev -y

# Install Python
cd ~
sudo wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
sudo tar -xzf Python-$PYTHON_VERSION.tgz

cd Python-$PYTHON_VERSION

sudo ./configure
sudo make
sudo make install

cd ~

#Install libraries for scipy
sudo apt-get install gfortran libopenblas-dev liblapack-dev --assume-yes

# Install NodeJs for Jupyter Lab
sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y

# Install python packages
sudo pip$PIP_VERSION install -r requirements.txt

# Install IPython Notebook dependencies
sudo jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

# Install holoviews and geoviews for python visualisation
sudo jupyter labextension install @pyviz/jupyterlab_pyviz

# # Install geoviews
# sudo pip3.6 install cython
# sudo pip3.6 install shapely
# sudo pip3.6 install pyshp
# sudo pip3.6 install pillow
# sudo pip3.6 install xarray
# sudo apt-get install proj-bin -y
# sudo apt-get install libproj-dev -y
# sudo apt-get install binutils gdal-bin -y

# sudo wget http://download.osgeo.org/geos/geos-3.6.3.tar.bz2
# sudo bzip2 -d geos-3.6.3.tar.bz2
# sudo tar -xvf geos-3.6.3.tar
# cd geos-3.6.3/
# sudo ./configure
# sudo make
# sudo make install
# cd ..


# Install git
sudo apt-get install -y git