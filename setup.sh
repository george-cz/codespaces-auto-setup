echo "Welcome!"

echo "Installing Ansible..."
sudo pipx install --include-deps ansible

echo "Downloading the Playbook..."
wget https://raw.githubusercontent.com/george-cz/codespaces-auto-setup/main/playbook.yml -O /tmp/playbook.yml

echo "Running the Playbook..."
ansible-playbook /tmp/playbook.yml

echo "Done! Create a new terminal and you should be up and running!"
