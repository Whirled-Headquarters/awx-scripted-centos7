# overwrite /awx/installer/inventory with ./configs/inventory
copy ./inventory /awx/installer/inventory
cd /awx/installer
ansible-playbook -i inventory install.yml