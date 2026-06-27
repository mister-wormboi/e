 #!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
openssh-server \
libreoffice \
gimp \
7zip \
hardinfo \
clamav \
clamtk \
printer-driver-cups-pdf

sudo systemctl enable ssh
sudo systemctl start ssh

sudo ufw enable <<EOF
y
EOF

sudo ufw allow OpenSSH

sudo addgroup admins
sudo useradd -m student
sudo passwd student

sudo mkdir -p /backup
sudo tar -czf /backup/system_backup.tar.gz /etc

echo "Готово"
