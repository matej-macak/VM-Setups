# Install the required docker files

### Preliminary installation scripts
sudo apt-get update
sudo apt-get install python-dev python -y
sudo apt-get install python-pip -y
sudo pip install docker-compose

### Pull the VM-Setups and run the provisioning
sudo mkdir /temp
cd /temp
sudo git clone https://github.com/matej-macak/VM-Setups
cd VM-Setups/Google_Cloud
sudo docker-compose up -d