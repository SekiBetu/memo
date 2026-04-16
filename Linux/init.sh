apt install -y sudo
sudo apt update && sudo apt upgrade -y
sudo apt remove -y vim-common
sudo apt install -y wget curl screen software-properties-common apt-transport-https ca-certificates lsb-release dirmngr gnupg gnupg1 gnupg2 vim build-essential
cd /etc/apt ; rm sources.list
cd /etc/apt/sources.list.d ; rm * ; curl -OJL https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/debian.sources

# [Nginx](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#installing-prebuilt-debian-packages)
curl -JL https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/nginx-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/nginx.sources <<EOF
Types: deb deb-src
URIs: https://nginx.org/packages/mainline/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: nginx
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/nginx-archive-keyring.gpg
EOF
# echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list > /dev/null
# echo "deb-src [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list > /dev/null
# sudo apt update && sudo apt install -y nginx

sudo apt update && sudo apt upgrade -y
sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean
