### Install docker

# Remove previous installs of Docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# Setup repository for Docker
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker CE
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo apt-get install python-dev python-pip -y
sudo pip install docker-compose

### Setup gitlab
sudo mkdir /data

sudo mkdir /temp
cd /temp
sudo git clone https://github.com/matej-macak/VM-Setups
cd VM-Setups/Google_Cloud/gitlab
sudo docker-compose up -d

