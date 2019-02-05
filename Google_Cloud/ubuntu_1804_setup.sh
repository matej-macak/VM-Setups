## Setup version variables
export PYTHON_VERSION=3.6.5

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
cd ..

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

# Holoviews and geoviews installation
sudo jupyter labextension install @pyviz/jupyterlab_pyviz
sudo apt-get install proj-bin -y
sudo apt-get install libproj-dev -y
sudo apt-get install binutils gdal-bin -y

# Install git
sudo apt-get install git




