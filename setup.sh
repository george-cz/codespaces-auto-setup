echo "Welcome!"

echo "Installing Ansible..."
sudo pipx install --include-deps ansibleec

echo "Running the Ansible Playbook..."
ansible-playbook playbook.yml
