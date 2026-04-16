
Linux桌面发行版个人主观排行：Ubuntu > Fedora > OpenSUSE > 其他发行版 > Arch = Gentoo(永远不要把时间浪费在配置系统上，这太蠢了)

Linux桌面环境个人主观排行：GNOME > KDE > Xfce > 其他桌面环境

Linux包管理器个人主观排行：apt > dnf > yum > 其他包管理器

<details>
<summary>Useful Commands</summary>

```shell
sudo vim /etc/sudoers

username ALL=(ALL) NOPASSWD:ALL
# username ALL=(ALL) NOPASSWD:/usr/lib/openssh/sftp-server
```

```shell
usermod -aG <Group> <User>
usermod -g <Group> <User> # forced
# https://www.gnu.org/software/coreutils/manual/html_node/File-permissions.html
chmod -R a/u/g/o =/+/-/ r/w/x <PATH>
chown -R <User> <PATH>
```

```shell
apt install -y sudo
sudo apt install -y systemd-timesyncd
sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp true
sudo apt update && sudo apt upgrade -y

sudo dpkg --configure -a
sudo apt --fix-broken install
sudo apt --fix-missing purge
sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean

sudo apt remove -y vim-common
sudo apt install -y wget curl screen software-properties-common apt-transport-https ca-certificates lsb-release dirmngr gnupg gnupg1 gnupg2 vim build-essential
```

```shell
sudo apt --fix-missing purge $(dpkg -l | grep 'python3\.9' | awk '{print $2}')
```

```shell
sudo vim /etc/ssh/sshd_config

Port 22
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
Subsystem sftp sudo /usr/lib/openssh/sftp-server

systemctl restart sshd
```

```shell
export PS1="$PS1\[\e]1337;CurrentDir="'$(pwd)\a\]'
source ~/.bashrc
```

```shell
journalctl --vacuum-size=100M
```

```shell
du -sh * | sort -hr
```

```shell
docker system prune -a
```

```shell
# clean docker images
0 1 * * * /user/bin/docker system prune -a
```

</details>
<details>
<summary>三网测速脚本</summary>

```shell
bash <(curl -Lso- https://git.io/superspeed_uxh)
```

</details>
<details>
<summary>一键 DD 脚本</summary>

https://github.com/bohanyang/debi

```shell
curl -OJL https://raw.githubusercontent.com/bohanyang/debi/master/debi.sh && chmod a+rx debi.sh
```

```shell
sudo ./debi.sh --version 13 --dns '8.8.8.8 8.8.4.4' --hostname debian --authorized-keys-url https://github.com/SekiBetu.keys --timezone Asia/Shanghai --user sekibetu --password <新系统用户密码> --ssh-port <SSH端口>
```

如果没有 DHCP 自动配置网络则要手动指定 IP 与网关

`--ip <IP/CIDR>` `--gateway <gateway>` `--netmask <netmask>`

`--netmask` 可以不用，通过 [CIDR 对照表](https://ip.sb/cidr/) 转换成相应掩码值填入 `--ip` 即可

`Ubuntu 20` 的网络配置文件: `cat /etc/netplan/50-cloud-init.yaml`

`Ubuntu 18` 或 `Debian` 的网络配置文件: `cat /etc/network/interfaces`

https://github.com/leitbogioro/Tools

```shell
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh
```

```shell
bash InstallNET.sh -debian 13 -port "端口" -pwd "密码" -timezone "Asia/Shanghai"
```

https://github.com/spiritLHLS/one-click-installation-script

</details>
<details>
<summary>xanmod 内核</summary>

https://xanmod.org/

```shell
curl -JL https://dl.xanmod.org/gpg.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/xanmod-kernel-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod-kernel-archive-keyring.gpg] http://deb.xanmod.org/ releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
sudo apt update && sudo apt upgrade -y && sudo apt install -y linux-xanmod-lts-x64v3
```

</details>
<details>
<summary>卸载旧内核</summary>

```shell
uname -a
```

```shell
sudo dpkg --list | grep -E -i --color "linux-image|linux-headers"
sudo apt list --installed | grep -E -i --color "linux-image|linux-headers"
```

```shell
sudo dpkg --purge --force-remove-essential linux-image-
sudo dpkg --purge --force-remove-essential linux-headers-
sudo apt purge -y linux-image-
sudo apt purge -y linux-headers-
```

</details>
<details>
<summary>切换内核</summary>

```shell
sudo apt install -y linux-headers-amd64 linux-image-amd64
sudo cat /boot/grub/grub.cfg
sudo vim /etc/default/grub
GRUB_DEFAULT=“1 >0”
# 第一个 menuentry 的序号是 0，第二个 submenu 的序号是 1，在 submenu 中，第一个 menuentry 的序号是 0，第二个是 1，以此类推
sudo update-grub
```

</details>
<details>
<summary>BBR 网络优化脚本</summary>

https://github.com/ylx2016/Linux-NetSpeed

```shell
wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh
```

</details>
<details>
<summary>代理脚本</summary>

https://github.com/mack-a/v2ray-agent

```shell
wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
vasma
```

</details>
<details>
<summary>自用初始化脚本</summary>

```shell
curl https://raw.githubusercontent.com/SekiBetu/memo/main/Linux/init.sh | bash
```

</details>
<details>
<summary>Temurin</summary>

https://adoptium.net/temurin/releases
https://adoptium.net/zh-CN/installation/linux

```shell
curl -JL https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor --yes -o /usr/share/keyrings/temurin-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/temurin-archive-keyring.gpg] https://packages.adoptium.net/artifactory/deb/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/temurin.list
sudo apt update && sudo apt install -y temurin-25-jdk
```

</details>
<details>
<summary>7-Zip</summary>

https://www.7-zip.org/

```shell
curl -OJL https://7-zip.org/a/7z2600-linux-x64.tar.xz
sudo mkdir -p /usr/local/7zip
sudo tar -C /usr/local/7zip -xvf 7z2600-linux-x64.tar.xz ; rm 7z2600-linux-x64.tar.xz
echo 'export PATH=$PATH:/usr/local/7zip'>>~/.bashrc
export PATH=$PATH:/usr/local/7zip
source ~/.bashrc
```

```shell
7zz x {any archive} {files} -o{dir_path} -p{password} -sccUTF-8
7zz a {7z archive} {files} -p{password} -m0=LZMA2 -mx=9 -mhe=on -saa -sccUTF-8 -scsUTF-8 -t7z

7zz x {program}.exe {files} -o{dir_path} -sccUTF-8 -t#:a
7zz a {zip archive} {files} -p{password} -mx=9 -mhe=on -mcu=on -saa -sccUTF-8 -scsUTF-8 -tzip
```

</details>
<details>
<summary>Node.js</summary>

https://nodesource.com/products/distributions

```shell
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt install -y nodejs
node -v
```

</details>
<details>
<summary>btop++</summary>

https://github.com/aristocratos/btop/releases

```shell
mkdir -p btop ; cd btop
curl -OJL https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz
tar -xjvf btop-x86_64-linux-musl.tbz ; cd btop
sudo make install ; sudo make setuid
cd ../.. ; sudo rm -rf btop/
# pip3 install tiptop
```

</details>
<details>
<summary>ASF</summary>

https://github.com/JustArchiNET/ArchiSteamFarm/releases/

https://github.com/chr233/ASFEnhance/releases

https://github.com/DevSplash/FreePointsShop

```shell
curl -OJL https://github.com/JustArchiNET/ArchiSteamFarm/releases/latest/download/ASF-linux-x64.zip ; 7zz x ASF-linux-x64.zip -oASF
rm ASF-linux-x64.zip ; cd ASF/ ; chmod +x ArchiSteamFarm
cd plugins/ ; curl -OJL https://github.com/chr233/ASFEnhance/releases/latest/download/ASFEnhance.zip ; 7zz x ASFEnhance.zip ; rm ASFEnhance.zip
```

</details>
<details>
<summary>Docker</summary>

https://docs.docker.com/engine/install/debian/

```shell
sudo apt remove docker docker-engine docker.io containerd runc
curl -JL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/docker-archive-keyring.gpg
EOF
# echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian/ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

</details>
<details>
<summary>PHP</summary>

https://deb.sury.org/

```shell
sudo curl -JL https://packages.sury.org/php/apt.gpg > /usr/share/keyrings/php-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/php.sources <<EOF
Types: deb
URIs: https://packages.sury.org/php
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/php-archive-keyring.gpg
EOF
# echo "deb [signed-by=/usr/share/keyrings/php-archive-keyring.gpg] https://packages.sury.org/php/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/php.list > /dev/null
sudo apt update && sudo apt install -y php8.5 php8.5-curl php8.5-fpm php8.5-mbstring
```

</details>
<details>
<summary>PostgreSQL</summary>

https://www.postgresql.org/download/linux/debian/

```shell
curl -JL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/postgresql-archive-keyring.gpg
sudo tee /etc/apt/sources.list.d/postgresql.sources <<EOF
Types: deb
URIs: http://apt.postgresql.org/pub/repos/apt
Suites: $(. /etc/os-release && echo "${VERSION_CODENAME}-pgdg")
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/postgresql-archive-keyring.gpg
EOF
# echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list > /dev/null
sudo apt update && sudo apt install -y postgresql
```

</details>
