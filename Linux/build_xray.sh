#!/bin/bash

cur_dir="$(pwd)"

echo "正在删除当前go版本再安装"
sudo rm -rf $(go env GOROOT)
curl -OJL https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz ; sudo rm go1.18.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/go/bin
echo "安装 git"
sudo apt install -y git

git clone https://github.com/XTLS/Xray-core.git
cd Xray-core/ || exit 2
sudo rm go.mod go.sum
go mod init github.com/xtls/xray-core
go mod tidy
go get github.com/ghodss/yaml@master

echo "编译 xray-linux-64 中"
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -ldflags "-s -w" -o ${cur_dir}/releases/xray ./main

echo "编译 xray-windows-64 中"
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o ${cur_dir}/releases/xray.exe -trimpath -ldflags "-s -w -buildid=" ./main

echo "移动 go.mod go.sum 至 releases/"
mv go.mod ${cur_dir}/releases/
mv go.sum ${cur_dir}/releases/
cd ${cur_dir}
echo "清理垃圾"
sudo rm -rf Xray-core/ go/
