# disable SELINUX
sudo sed -i 's|SELINUX=enforcing|SELINUX=disabled|g' /etc/selinux/config
sudo setenforce 0

# disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable firewalld

#reboot recommended
sudo reboot
