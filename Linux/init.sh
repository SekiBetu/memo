apt install -y sudo
sudo apt update && sudo apt upgrade -y
sudo apt remove -y vim-common
sudo apt install -y wget curl screen software-properties-common apt-transport-https ca-certificates lsb-release dirmngr gnupg gnupg1 gnupg2 vim build-essential
cd /etc/apt ; rm sources.list ; curl -OJL https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/sources.list
cd /etc/apt/sources.list.d ; rm *

# [Docker](https://docs.docker.com/engine/install/debian/)
sudo apt remove docker docker-engine docker.io containerd runc
curl -JL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian/ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# [Nginx](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#installing-prebuilt-debian-packages)
curl -JL https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/nginx-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list > /dev/null
echo "deb-src [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list > /dev/null
# sudo apt update && sudo apt install -y nginx

# [Nodejs](https://nodejs.org/zh-cn/download/package-manager/#debian-and-ubuntu-based-linux-distributions-enterprise-linux-fedora-and-snap-packages)
curl -JL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/nodejs-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/nodejs-archive-keyring.gpg] https://deb.nodesource.com/node_20.x/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodejs.list > /dev/null
echo "deb-src [signed-by=/usr/share/keyrings/nodejs-archive-keyring.gpg] https://deb.nodesource.com/node_20.x/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/nodejs.list > /dev/null
# sudo apt update && sudo apt install -y nodejs

# [php](https://deb.sury.org/)
sudo curl -JL https://packages.sury.org/php/apt.gpg > /usr/share/keyrings/php-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/php-archive-keyring.gpg] https://packages.sury.org/php/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/php.list > /dev/null
# sudo apt update && sudo apt install -y php8.1 php8.1-curl php8.1-fpm php8.1-mbstring

# [PostgreSQL](https://www.postgresql.org/download/linux/debian/)
curl -JL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/postgresql-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list > /dev/null
# sudo apt update && sudo apt install -y postgresql

# [JenKins](https://www.jenkins.io/doc/book/installing/linux/)
curl -JL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/jenkins-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins-archive-keyring.gpg] https://pkg.jenkins.io/debian-stable/ binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
# sudo apt update && sudo apt install -y jenkins

sudo apt update && sudo apt upgrade -y
sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean
