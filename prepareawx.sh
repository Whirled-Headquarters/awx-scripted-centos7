# make sure the base os is up to date 
sudo yum -y update 
# Install Redhat Extened Libs
sudo yum -y install epel-release
# Install AWX pre-requisite software
sudo yum -y install git gcc gcc-c++ lvm2 bzip2 gettext nodejs yum-utils device-mapper-persistent-data ansible python3-pip 
#Remove docker
sudo yum -y remove docker docker-common docker-selinux docker-engine
# enable yum-config-manager
sudo yum -y install yum-utils
# add docker ce to yum repo list
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
# install docker-ce
sudo yum -y install docker-ce
# start docker service and enable service autostart at reboot
sudo systemctl start docker
sudo systemctl enable docker
sudo pip3 install docker-compose

# pull AWX from github repository
sudo cd / 
sudo git clone https://github.com/ansible/awx.git 
# create awx projects folder
sudo mkdir --parents /var/lib/awx/projects
# create folder for database persistence
sudo mkdir --parents /var/lib/awx/pgdocker
# docker-compose working folder
sudo mkdir --parents /tmp/awxcompose 
# open permissions for poc testing
sudo chmod 777 /var/lib/awx/pgdocker 
sudo chmod 777 /var/lib/awx/projects 
sudo chmod 777 /tmp/awxcompose 
sudo chmod 777 /var/lib/awx
