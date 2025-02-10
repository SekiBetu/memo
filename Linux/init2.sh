
cur_dir="$(pwd)"

mkdir -p LR ; mkdir -p BL

[[ -d livedl ]] || [[ -f livedl ]] && echo "请使用`sudo rm -rf livedl`指令删除livedl文件或文件夹后重试" && exit 1 # git clone需要空文件夹

# sudo apt purge -y `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
# sudo find /etc -name "*php*" |xargs sudo rm -rf
# sudo curl -OJL https://packages.sury.org/php/apt.gpg > /usr/share/keyrings/php-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/php-archive-keyring.gpg] https://packages.sury.org/php/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/php.list > /dev/null
sudo apt remove -y vim-common
sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean
sudo apt install -y build-essential vim ffmpeg libunwind8 gettext screen git php8.1 php8.1-curl php8.1-mbstring php8.1-fpm nodejs python3 python3-pip

curl -JL https://adoptium.jfrog.io/artifactory/api/security/keypair/default-gpg-key/public | sudo gpg --dearmor --yes -o /usr/share/keyrings/temurin-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/temurin-archive-keyring.gpg] https://adoptium.jfrog.io/artifactory/deb/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/temurin.list
sudo apt update && sudo apt install -y temurin-21-jdk

cd ${cur_dir} ; cd BL
curl https://getcomposer.org/installer | php8.1
sudo mv composer.phar /usr/local/bin/composer
git clone https://github.com/lkeme/BiliHelper-personal.git
# git clone https://github.com/lkeme/bilibili-pcheartbeat.git
cd BiliHelper-personal/ ; composer update ; composer install
# cd ${cur_dir} ; cd BL
# cd bilibili-pcheartbeat/ ; sudo npm install -g npm ; npm install

cd ${cur_dir}
# source <(curl -sL https://raw.githubusercontent.com/SekiBetu/python3-install/openssl3/install.sh) -v 3.10.8 --enable-optimizations --enable-shared --enable-loadable-sqlite-extensions
python3 -m pip install --upgrade pip
pip3 install --upgrade git+https://github.com/streamlink/streamlink.git
pip3 install --upgrade git+https://github.com/ytdl-org/youtube-dl.git
pip3 install --upgrade git+https://github.com/soimort/you-get.git
echo 'export PATH=$PATH:/usr/local/bin'>>~/.bashrc
echo 'export PATH=$HOME/.local/bin:$PATH'>>~/.bashrc
export PATH=$PATH:/usr/local/bin
export PATH=$HOME/.local/bin:$PATH
source ~/.bashrc

sudo rm -rf $(go env GOROOT)
curl -OJL https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz ; sudo rm go1.21.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/go/bin

# cd ${cur_dir} ; cd LR
# git clone https://github.com/nnn-revo2012/livedl.git ; 
# if [ ! -d "livedl" ]; then
#     echo "livedl 项目文件夹不存在，请确认该项目的github仓库 https://github.com/nnn-revo2012/livedl 是否被删除"
#     exit 1
# else
#     cd livedl/src ; go build -o livedl livedl.go ; rm -r `ls | grep -v "^livedl$"`
# fi

# cd ${cur_dir} ; cd LR
# mkdir -p BilibiliLiveRecorder ; cd BilibiliLiveRecorder
# curl -OJL https://github.com/nICEnnnnnnnLee/BilibiliLiveRecorder/releases/download/V2.22.0/BilibiliLiveRecord.v2.22.0.zip ; 7zz x BilibiliLiveRecord.v2.22.0.zip
# rm BilibiliLiveRecord.v2.22.0.zip

cd ${cur_dir} ; cd LR
mkdir -p record
curl https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record.sh > record/record.sh ; chmod +x record/record.sh
curl https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record_new.sh > record/record_new.sh ; chmod +x record/record_new.sh
curl https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record_twitcast.py > record/record_twitcast.py ; chmod +x record/record_twitcast.py

cd ${cur_dir} ; cd LR
# curl https://rclone.org/install.sh | bash
# sudo curl -OJL https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/
# sudo chmod +x /usr/local/bin/OneDriveUploader
go install github.com/qjfoidnh/BaiduPCS-Go@latest
echo 'export PATH=$PATH:'`echo ~`'/go/bin'>>~/.bashrc
source ~/.bashrc
source ~/.bashrc

sudo apt --purge autoremove -y && sudo apt autoclean -y && sudo apt clean

cd ${cur_dir}
mkdir -p btop ; cd btop
curl -OJL https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz
tar -xjvf btop-x86_64-linux-musl.tbz ; cd btop
cd btop ; sudo make install ; sudo make setuid
cd ../.. ; rm -rf btop/
# pip3 install tiptop

cd ${cur_dir}
echo '请手动运行`source ~/.bashrc`或者重新链接ssh更新环境变量使下列命令生效'
# echo '使用`rclone config`登陆rclone'
# echo '使用`OneDriveUploader -cn -a "打开https://github.com/MoeClub/OneList/tree/master/OneDriveUploader中的相应网页并登录后浏览器地址栏返回的url"`登陆rclone'
echo '使用`BaiduPCS-Go login -bduss="百度网盘网页cookie中bduss项的值"`登陆BaiduPCS-Go，'
