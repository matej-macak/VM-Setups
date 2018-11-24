## Setup version variables
export PYTHON_VERSION = 3.6.5
export GEOS_VERSION = 3.6.3
export SPARK_VERSION = 

#Update dependencies
sudo apt-get update
sudo apt-get install build-essential -y
sudo apt-get install python3-dev -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install libreadline-gplv2-dev libffi-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y


# Install Python
sudo wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
sudo tar -xzf Python-$PYTHON_VERSION.tgz

cd Python-$PYTHON_VERSION

sudo ./configure
sudo make
sudo make install

#Install libraries for scipy
sudo apt-get install gfortran libopenblas-dev liblapack-dev --assume-yes

# Install NodeJs for Jupyter Lab
sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y

# Install IPython Notebook dependencies
sudo pip3.6 install --upgrade pip
sudo pip3.6 install -r requirements.txt

# Install jupyter-lab extension
sudo jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

# Install monaco for Jupyter lab
cd /home/vagrant/
sudo git clone https://github.com/jupyterlab/jupyterlab-monaco.git
cd jupyterlab-monaco
sudo yarn install
sudo yarn run build
sudo jupyter labextension link . --dev

# Holoviews and geoviews installation
sudo jupyter labextension install @pyviz/jupyterlab_pyviz
sudo apt-get install proj-bin -y
sudo apt-get install libproj-dev -y
sudo apt-get install binutils gdal-bin -y

sudo wget http://download.osgeo.org/geos/geos-$GEOS_VERSION.tar.bz2
sudo bzip2 -d geos-$GEOS_VERSION.tar.bz2
sudo tar -xvf geos-$GEOS_VERSION.tar
cd geos-$GEOS_VERSION/
sudo ./configure
sudo make
sudo make install
cd ..

# Install git
sudo apt-get install git

# Install scala for PySpark
cd /home/vagrant/
sudo apt-get install scala -y
sudo wget http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
sudo tar -xvzf spark-2.3.1-bin-hadoop2.7.tgz

sudo pip3.6 install pyspark
sudo pip3.6 install findspark

# Add this into .profile and .bash_profile

echo PATH $PATH

[ -f ~/.profile ] || touch ~/.profile

grep 'SPARK_HOME=/home/vagrant/spark-2.3.1-bin-hadoop2.7' ~/.profile || echo 'export SPARK_HOME=/home/vagrant/spark-2.3.1-bin-hadoop2.7' | tee -a ~/.profile

grep 'PATH=$SPARK_HOME/python:$PATH' ~/.profile || echo 'export PATH=$SPARK_HOME/python:$PATH' | tee -a ~/.profile
grep 'PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH' ~/.profile || echo 'export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH' | tee -a ~/.profile
grep 'PYSPARK_DRIVER_PYTHON="jupyter"' ~/.profile || echo 'export PYSPARK_DRIVER_PYTHON="jupyter"' | tee -a ~/.profile
grep 'PYSPARK_DRIVER_PYTHON_OPTS="notebook"' ~/.profile || echo 'export PYSPARK_DRIVER_PYTHON_OPTS="notebook"' | tee -a ~/.profile
grep 'PYSPARK_PYTHON=python3.6' ~/.profile || echo 'export PYSPARK_PYTHON=python3.6' | tee -a ~/.profile

. ~/.profile

sudo chmod 777 /home/vagrant/spark-2.3.1-bin-hadoop2.7
sudo chmod 777 /home/vagrant/spark-2.3.1-bin-hadoop2.7/python
sudo chmod 777 /home/vagrant/spark-2.3.1-bin-hadoop2.7/python/pyspark

##### SELENIUM INSTALLATION

## Install Java
sudo apt-get install default-jdk -y

## Install chrome
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y

## Install chrome driver
cd ~
sudo wget https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo cp chromedriver /usr/local/bin/