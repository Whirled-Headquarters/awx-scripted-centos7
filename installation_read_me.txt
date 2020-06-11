#SINGLE HOST INSTALLATION on CENTOS using DOCKER

./disablestuff.sh
#this script disables SELINUX and FIREWALLD then reboots

./prepareawx.sh
#this script prepares the host operating system for awx installation

./installawx.sh
#this script copies the 'inventory' file ontop of the unedited versions pulled from git repo, then launches ansible-playbook
to do acutal installation and then launches docker commands to bring up the environment