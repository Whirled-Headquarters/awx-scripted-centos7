# Disable SELINUX 
sed -i 's|SELINUX=enforcing|SELINUX=disabled|g' /etc/selinux/config 
reboot 

# Setup NIC 
vi /etc/sysconfig/network-scripts/ifcfg-ens33 

# BOOTPROTO=static 
# ONBOOT=yes 
# IPADDR=192.168.255.210 
# SUBNET=255.255.255.0 
# GATEWAY=192.168.255.2 
# DNS1=192.168.255.200 
# DNS2=192.168.255.2 
# DNS3=8.8.8.1 
# RESTART network 
systemctl restart network 
# VALIDATE network interface ens33 
ifconfig ens33 
  
# 
# Cont. 
# 
# Install AWX 
cd / 
sudo yum -y update 
sudo yum -y install epel-release 
sudo yum -y install git gcc gcc-c++ lvm2 bzip2 gettext nodejs yum-utils device-mapper-persistent-data ansible python-pip 
sudo yum -y remove docker docker-common docker-selinux docker-engine 
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
sudo yum -y install docker-ce 
sudo systemctl start docker && sudo systemctl enable docker 
sudo pip install -U docker-py 
sudo pip show docker-py 
sudo cd / 
sudo git clone https://github.com/ansible/awx.git 
  
sudo mkdir --parents /var/lib/awx/projects 
sudo mkdir --parents /var/lib/awx/pgdocker 
sudo mkdir --parents /tmp/awxcompose 
  
sudo chmod 777 /var/lib/awx/pgdocker 
sudo chmod 777 /var/lib/awx/projects 
sudo chmod 777 /tmp/awxcompose 
sudo chmod 777 /var/lib/awx 
  
# additional manual steps 
openssl rand -base64 30 >> /tmp/secret_key.txt 
# take and paste as secret_key in /awx/installer/inventory under secret_key 
#example output = 'OP6BJGvMkF/95tj0SYtWAFTPQeW+LEvUnLH9V7oW'