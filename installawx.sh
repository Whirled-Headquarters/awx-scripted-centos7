# overwrite /awx/installer/inventory with ./configs/inventory
copy config/inventory /awx/installer/inventory
cd /awx/installer
ansible-playbook -i inventory install.yml