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
sudo ./debi.sh --firmware --version 12 --architecture amd64 --full-upgrade --dns '8.8.8.8 8.8.4.4' --hostname debian --authorized-keys-url https://github.com/SekiBetu.keys --timezone Asia/Shanghai --user sekibetu --password <新系统用户密码> --ssh-port <SSH端口>
```

用户名要与SSH密钥设置的用户名匹配

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
bash InstallNET.sh -debian 12 -port "端口" -pwd "密码" -timezone "Asia/Shanghai" -firmware
```

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

https://github.com/kirin10000/Xray-script

```shell
wget -O Xray-REALITY+Web.sh https://github.com/kirin10000/Xray-script/raw/main/Xray-REALITY+Web.sh
sudo bash Xray-REALITY+Web.sh
```

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
echo "deb [signed-by=/usr/share/keyrings/temurin-archive-keyring.gpg] https://packages.adoptium.net/artifactory/deb/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/temurin.list
sudo apt update && sudo apt install -y temurin-17-jdk
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
curl -OJL https://7-zip.org/a/7z2301-linux-x64.tar.xz
sudo mkdir -p /usr/local/7zip
sudo tar -C /usr/local/7zip -xvf 7z2301-linux-x64.tar.xz ; rm 7z2301-linux-x64.tar.xz
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

```shell
curl -OJL https://github.com/JustArchiNET/ArchiSteamFarm/releases/latest/download/ASF-linux-x64.zip ; 7zz x ASF-linux-x64.zip -d ASF/
rm ASF-linux-x64.zip ; cd ASF/ ; chmod +x ArchiSteamFarm
cd config/ ; curl -OJL https://github.com/chr233/ASFEnhance/releases/latest/download/ASFEnhance-zh-Hans.zip ; 7zz x ASFEnhance-zh-Hans.zip ; rm ASFEnhance-zh-Hans.zip
```

</details>
<details>
<summary>mirai</summary>

https://github.com/iTXTech/mirai-console-loader/releases

https://github.com/cssxsh/bilibili-helper/releases

https://github.com/Nana-Miko/ChatLearning

https://github.com/project-mirai/chat-command/releases

```shell
mkdir -p mirai ; cd mirai
curl -OJL https://github.com/iTXTech/mirai-console-loader/releases/download/v2.1.2/mcl-2.1.2.zip
7zz x mcl-2.1.2.zip ; chmod +x mcl
mkdir -p plugins ; cd plugins
curl -OJL https://github.com/cssxsh/bilibili-helper/releases/download/v1.6.7/bilibili-helper-1.6.7.mirai2.jar
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
```

</details>
<details>
<summary>qinglong</summary>

https://github.com/whyour/qinglong

```shell
# 拉取镜像运行
mkdir qinglong ; cd qinglong ; wget https://raw.githubusercontent.com/whyour/qinglong/master/docker/docker-compose.yml # 修改为2.13.3版本

docker compose up -d

docker exec -it qinglong_web_1 bash

# 环境变量
JD_COOKIE = pt_key=XXXXXXX;pt_pin=XXX;
# QL_LOG_AUTO_INSTALL_DEPEND = true

# 拉库
0 0 * * * ql repo https://git.metauniverse-cn.com/https://github.com/shufflewzc/faker2.git "jd_|jx_|gua_|jddj_|jdCookie" "activity|backUp" "^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator|magic|depend|h5sts" "main"

# 更换python3版本
apk add python3=3.8.10-r0 --repository=https://mirrors.aliyun.com/alpine/v3.13/main
apk add python3=3.8.10-r0 --repository=https://dl-cdn.alpinelinux.org/alpine/v3.13/main
wget https://bootstrap.pypa.io/get-pip.py ; python3 get-pip.py

mkdir -p /mydata/redis/conf
touch /mydata/redis/conf/redis.conf
docker run -p 6379:6379 --name redis \
-v /mydata/redis/data:/data \
-v /mydata/redis/conf/redis.conf:/etc/redis/redis.conf \
-itd redis redis-server /etc/redis/redis.conf \
--appendonly yes

# config.sh
RepoFileExtensions="js py ts so"

# 缺失依赖
npm install -g moment png-js axios jsdom date-fns canvas ts-md5 ds
pip3 install cacheout PyExecJS pyrogram requests bs4 telethon redis
apk add build-base g++ cairo-dev jpeg-dev pango-dev giflib-dev
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
curl -OJL https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/config.json ; sudo vim config.json

npm run start

curl -OJL https://raw.githubusercontent.com/SekiBetu/Softwares/main/Linux/twitch.sh

crontab -e
0,30 * * * * /bin/bash /PATH/TO/twitch.sh
```

</details>
<details>
<summary>RSSHub</summary>

```shell
mkdir RSSHub ; cd RSSHub
curl -OJL https://raw.githubusercontent.com/DIYgod/RSSHub/master/docker-compose.yml
docker volume create redis-data
docker compose up -d
docker pull diygod/rsshub:chromium-bundled
```

```shell
# PUPPETEER_WS_ENDPOINT : "ws://<ip>:<port>"

docker pull browserless/chrome:latest
docker run -p 3000:3000 -d browserless/chrome
```
