<details>
<summary>Useful Path</summary>

```
/etc/sysctl.d/
```

```
/var/log/
```

</details>
<details>
<summary>Useful Commands</summary>

```shell
apt install -y sudo
```

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

```
sudo timedatectl set-timezone Asia/Shanghai

sudo timedatectl set-ntp true
```

```shell
sudo apt update && sudo apt upgrade -y
```

```shell
sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean
```

```shell
sudo apt remove -y vim-common
```

```shell
sudo apt install -y wget curl screen software-properties-common apt-transport-https ca-certificates lsb-release dirmngr gnupg gnupg1 gnupg2 vim build-essential
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
kill -9 $(ps -ef | grep record | grep -v grep | awk '{print $2}')
```

```shell
cat /dev/null > nohup.out
```

```shell
ps aux|grep
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
bash <(curl -Lso- https://git.io/superspeed)
```

</details>
<details>
<summary>一键 DD 脚本</summary>

https://www.cxthhhhh.com/Network-Reinstall-System-Modify (默认密码 cxthhhhh.com)

```shell
wget --no-check-certificate -qO ~/Network-Reinstall-System-Modify.sh 'https://www.cxthhhhh.com/CXT-Library/Network-Reinstall-System-Modify/Network-Reinstall-System-Modify.sh' && chmod a+x ~/Network-Reinstall-System-Modify.sh && bash ~/Network-Reinstall-System-Modify.sh -UI_Options
```

https://github.com/bohanyang/debi

```shell
curl -OJL https://raw.githubusercontent.com/bohanyang/debi/master/debi.sh && chmod a+rx debi.sh
```

```shell
sudo ./debi.sh --full-upgrade --firmware --version 11 --architecture amd64 --hostname debian --authorized-keys-url https://github.com/SekiBetu.keys --timezone Asia/Shanghai --user sekibetu --password <新系统用户密码> --ssh-port <SSH端口>
```

如果没有 DHCP 自动配置网络则要手动指定 IP 与网关

`--ip <IP/CIDR>` `--gateway <gateway>` `--netmask <netmask>`

`--netmask` 可以不用，通过 [CIDR 对照表](https://ip.sb/cidr/) 转换成相应掩码值填入 `--ip` 即可

`Ubuntu 20` 的网络配置文件: `cat /etc/netplan/50-cloud-init.yaml`

`Ubuntu 18` 或 `Debian` 的网络配置文件: `cat /etc/network/interfaces`

</details>
<details>
<summary>xanmod 内核</summary>

https://xanmod.org/

```shell
curl -JL https://dl.xanmod.org/gpg.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/xanmod-kernel-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod-kernel-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
sudo apt update && sudo apt upgrade -y && sudo apt install -y linux-xanmod-lts
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

https://github.com/kirin10000/Xray-script

```shell
wget -O Xray-TLS+Web-setup.sh https://github.com/SekiBetu/Xray-script/raw/tls/Xray-TLS+Web-setup.sh
sudo bash Xray-TLS+Web-setup.sh
```

</details>
<details>
<summary>中转转发工具</summary>

https://github.com/KANIKIG/Multi-EasyGost

https://github.com/Qv2ray/mmp-go

</details>
<details>
<summary>自用初始化脚本</summary>

```shell
curl https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/init.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/init2.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/restart.sh | bash
```

</details>
<details>
<summary>Temurin</summary>

https://adoptium.net/temurin/releases

```shell
curl -JL https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor --yes -o /usr/share/keyrings/temurin-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/temurin-archive-keyring.gpg] https://packages.adoptium.net/artifactory/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/temurin.list
sudo apt update && sudo apt install -y temurin-17-jdk
```

</details>
<details>
<summary>Oracle JDK</summary>

https://www.oracle.com/java/technologies/downloads/

https://gist.github.com/wavezhang/ba8425f24a968ec9b2a8619d7c2d86a6#gistcomment-3425441

https://sites.google.com/view/sekibetu/jdk

```shell
curl -OJL https://javadl.oracle.com/webapps/download/GetFile/1.8.0_333-b02/2dee051a5d0647d5be72a7c0abff270e/linux-i586/jdk-8u333-linux-x64.tar.gz
sudo mkdir -p /usr/local/Java/OracleJDK
sudo tar -C /usr/local/Java/OracleJDK -zxvf jdk-8u333-linux-x64.tar.gz ; rm jdk-8u333-linux-x64.tar.gz
echo 'export PATH=$PATH:/usr/local/Java/OracleJDK/jdk1.8.0_333/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/Java/OracleJDK/jdk1.8.0_333/bin
source ~/.bashrc
```

```shell
curl -OJL https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
sudo mkdir -p /usr/local/Java/OracleJDK
sudo tar -C /usr/local/Java/OracleJDK -zxvf jdk-17_linux-x64_bin.tar.gz ; rm jdk-17_linux-x64_bin.tar.gz
echo 'export PATH=$PATH:/usr/local/Java/OracleJDK/jdk-17/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/Java/OracleJDK/jdk-17/bin
source ~/.bashrc
```

</details>
<details>
<summary>Semeru(openj9)</summary>

https://developer.ibm.com/languages/java/semeru-runtimes/downloads/

```shell
curl -OJL https://github.com/ibmruntimes/semeru17-binaries/releases/download/jdk-17.0.3%2B7_openj9-0.32.0/ibm-semeru-open-jdk_x64_linux_17.0.3_7_openj9-0.32.0.tar.gz
sudo mkdir -p /usr/local/Java/Semeru
sudo tar -C /usr/local/Java/Semeru -zxvf ibm-semeru-open-jdk_x64_linux_17.0.3_7_openj9-0.32.0.tar.gz ; rm ibm-semeru-open-jdk_x64_linux_17.0.3_7_openj9-0.32.0.tar.gz
echo 'export PATH=$PATH:/usr/local/Java/Semeru/jdk-17.0.3+7/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/Java/Semeru/jdk-17.0.3+7/bin
source ~/.bashrc
```

</details>
<details>
<summary>Zulu</summary>

https://www.azul.com/downloads/

```shell
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/zulu-archive-keyring.gpg --keyserver keyserver.ubuntu.com --recv 0xB1998361219BD9C9
curl -OJL https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb
sudo apt install ./zulu-repo_1.0.0-3_all.deb ; rm zulu-repo_1.0.0-3_all.deb
sudo apt update && sudo apt install -y zulu17-ca-jdk
```

</details>
<details>
<summary>MySQL</summary>

https://dev.mysql.com/downloads/repo/apt/

```shell
curl -OJL https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
sudo apt install ./mysql-apt-config_0.8.22-1_all.deb ; rm mysql-apt-config_0.8.22-1_all.deb
sudo apt update && sudo apt install -y mysql-server
sudo mysql_secure_installation
```

</details>
<details>
<summary>7-Zip</summary>

https://www.7-zip.org/

```shell
curl -OJL https://www.7-zip.org/a/7z2107-linux-x64.tar.xz
sudo mkdir -p /usr/local/7zip
sudo tar -C /usr/local/7zip -xvf 7z2107-linux-x64.tar.xz ; rm 7z2107-linux-x64.tar.xz
echo 'export PATH=$PATH:/usr/local/7zip'>>~/.bashrc
export PATH=$PATH:/usr/local/7zip
source ~/.bashrc
```

</details>
<details>
<summary>btop++</summary>

https://github.com/aristocratos/btop/releases

```shell
mkdir -p btop ; cd btop
curl -OJL https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz
tar -xjvf btop-x86_64-linux-musl.tbz
sudo make install ; sudo make setuid
cd .. ; sudo rm -rf btop/
# pip3 install tiptop
```

</details>
<details>
<summary>ASF</summary>

https://github.com/JustArchiNET/ArchiSteamFarm/releases/

https://github.com/chr233/ASFEnhance/releases

```shell
curl -OJL https://github.com/JustArchiNET/ArchiSteamFarm/releases/latest/download/ASF-linux-x64.zip ; unzip ASF-linux-x64.zip -d ASF/
rm ASF-linux-x64.zip ; cd ASF/ ; chmod +x ArchiSteamFarm
cd config/ ; curl -OJL https://github.com/chr233/ASFEnhance/releases/latest/download/ASFEnhance-zh-Hans.zip ; unzip ASFEnhance-zh-Hans.zip ; rm ASFEnhance-zh-Hans.zip
```

</details>
<details>
<summary>mirai</summary>

https://github.com/iTXTech/mirai-console-loader/releases

https://github.com/cssxsh/bilibili-helper/releases

https://github.com/gnuf0rce/rss-helper/releases

https://github.com/project-mirai/chat-command/releases

```shell
mkdir -p mirai ; cd mirai
curl -OJL https://github.com/iTXTech/mirai-console-loader/releases/download/v2.1.0/mcl-2.1.0.zip
unzip mcl-2.1.0.zip ; chmod +x mcl
mkdir -p plugins ; cd plugins
curl -OJL https://github.com/cssxsh/bilibili-helper/releases/download/v1.6.0-M1/bilibili-helper-1.6.0-M1.mirai2.jar
curl -OJL https://github.com/gnuf0rce/rss-helper/releases/download/v1.2.1/rss-helper-1.2.1.mirai2.jar
curl -OJL https://github.com/project-mirai/chat-command/releases/download/0.5.1/chat-command-0.5.1.jar
cd .. ; ./mcl -u

# config.json 换源
# mirai repo: https://raw.githubusercontent.com/project-mirai/mirai-repo-mirror/master
# maven repo: https://repo1.maven.org/maven2
```

```shell
/perm permit u805023197 *:*
```

```shell
/bili-dynamic add 161775300
/bili-dynamic add 233108841
/bili-dynamic add 36142005
/rss add https://rsshub.app/tiktok/user/@nozomi0125
/rss add https://rsshub.app/tiktok/user/@minyan84
```

</details>
<details>
<summary>qinglong</summary>

https://github.com/whyour/qinglong

```shell
# 安装
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

mkdir qinglong

wget https://raw.githubusercontent.com/whyour/qinglong/master/docker/docker-compose.yml

docker-compose up -d

docker exec -it ql_web_1 bash

# JD_COOKIE
pt_key=XXXXXXX;pt_pin=XXX;

# 拉库
0 0 * * * ql repo https://github.com/shufflewzc/faker2.git "jd_|jx_|gua_|jddj_|jdCookie" "activity|backUp" "^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator|magic" "main"
```

</details>
<details>
<summary>Twitch Drop</summary>

https://github.com/TychoTheTaco/Twitch-Drops-Bot

```shell
sudo apt install -y git nodejs chromium
sudo npm install -g npm
git clone https://github.com/TychoTheTaco/Twitch-Drops-Bot.git
cd Twitch-Drops-Bot ; sudo npm install ; npm run build

npm run start

npm run updateGames
```

```json
{
  "browser": "/usr/bin/chromium",
  "games": ["460630","488634","490382","493057","511224"],
  "headless": true,
  "headless_login": true,
  "username": "",
  "password": "",
  "interval": 15,
  "load_timeout_secs": 30,
  "failed_stream_retry": 3,
  "failed_stream_timeout": 30,
  "browser_args": ["--no-sandbox"],
  "watch_unlisted_games": false,
  "hide_video": true,
  "show_account_not_linked_warning": false
}

"log_level": "debug"
```

```shell
curl -OJL https://raw.githubusercontent.com/SekiBetu/Linux/main/twitch.sh

crontab -e
0,30 * * * * /bin/bash /PATH/TO/twitch.sh
```

</details>
<details>
<summary>Go 支持的 TLS 加密套件清单</summary>
https://github.com/golang/go/blob/master/src/crypto/tls/cipher_suites.go
</details>
