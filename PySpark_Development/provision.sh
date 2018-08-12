## This is a new version of Neuron box

#Update dependencies
sudo apt-get update
sudo apt-get install build-essential -y
sudo apt-get install python3-dev -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y


# Install Python
sudo wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
sudo tar -xzf Python-3.6.5.tgz

cd Python-3.6.5

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
sudo pip3.6 install numpy scipy matplotlib
sudo pip3.6 install pandas scikit-learn ipython pyyaml
sudo pip3.6 install jupyter jupyterlab tqdm
sudo pip3.6 install tensorflow keras pyarrow scikit-optimize xgboost seaborn bokeh
sudo pip3.6 install ipympl
sudo jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
sudo pip3.6 install pyglmnet

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

# Install holoviews and geoviews for python visualisation
sudo pip3.6 install holoviews[all]
sudo jupyter labextension install @pyviz/jupyterlab_pyviz

# Install geoviews
sudo pip3.6 install cython
sudo pip3.6 install shapely
sudo pip3.6 install pyshp
sudo pip3.6 install pillow
sudo pip3.6 install xarray
sudo apt-get install proj-bin -y
sudo apt-get install libproj-dev -y
sudo apt-get install binutils gdal-bin -y

sudo wget http://download.osgeo.org/geos/geos-3.6.2.tar.bz2
sudo bzip2 -d geos-3.6.2.tar.bz2
sudo tar -xvf geos-3.6.2.tar
cd geos-3.6.2/
sudo ./configure
sudo make
sudo make install
cd ..

sudo pip3.6 install geoviews

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
[ -f ~/.profile] || touch ~/.profile
[ -f ~/.bash_profile] || touch ~/.bash_profile

grep 'SPARK_HOME=/home/vagrant/spark-2.3.1-bin-hadoop2.7' ~/.profile || echo 'SPARK_HOME=/home/vagrant/spark-2.3.1-bin-hadoop2.7' | tee -a ~/.profile

grep 'PATH=$SPARK_HOME/python:$PYTHONPATH' ~/.profile || echo 'export PATH=$SPARK_HOME/python:$PYTHONPATH' | tee -a ~/.profile
grep 'PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH' ~/.profile || echo 'export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH' | tee -a ~/.profile
grep 'PYSPARK_DRIVER_PYTHON="jupyter"' ~/.profile || echo 'export PYSPARK_DRIVER_PYTHON="jupyter"' | tee -a ~/.profile
grep 'PYSPARK_DRIVER_PYTHON_OPTS="notebook"' ~/.profile || echo 'export PYSPARK_DRIVER_PYTHON_OPTS="notebook"' | tee -a ~/.profile
grep 'PYSPARK_PYTHON=python3.6' ~/.profile || echo 'export PYSPARK_PYTHON=python3.6' | tee -a ~/.profile

. ~/.profile

sudo chmod /home/vagrant/spark-2.3.1-bin-hadoop2.7
sudo chmod /home/vagrant/spark-2.3.1-bin-hadoop2.7/python
sudo chmod /home/vagrant/spark-2.3.1-bin-hadoop2.7/python/pyspark



