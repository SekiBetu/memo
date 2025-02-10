
cur_dir="$(pwd)"

cd BL
# 心跳服务
# echo "开始部署心跳包服务"
# echo "=============================================================="
# screen -dmUS "X"
# echo "创建screen"
# sleep 1
# screen -S "X" -X stuff "cd bilibili-pcheartbeat"
# screen -S "X" -X stuff "\n"
# echo "进入目录"
# screen -S "X" -X stuff "node app.js"
# screen -S "X" -X stuff "\n"
# echo "服务启动"
# echo "=============================================================="

# B站脚本
echo "开始部署BiliHelper服务"
echo "=============================================================="
screen -dmUS "B1"
echo "创建用户1的screen"
sleep 1
screen -S "B1" -X stuff "cd BiliHelper-personal"
screen -S "B1" -X stuff "\n"
echo "进入目录"
screen -S "B1" -X stuff "php8.1 app.php user1 m:a"
screen -S "B1" -X stuff "\n"
echo "用户1部署完毕"

screen -dmUS "B2"
echo "创建用户2的screen"
sleep 1
screen -S "B2" -X stuff "cd BiliHelper-personal"
screen -S "B2" -X stuff "\n"
echo "进入目录"
screen -S "B2" -X stuff "php8.1 app.php user2 m:a"
screen -S "B2" -X stuff "\n"
echo "用户2部署完毕"
echo "=============================================================="

cd ${cur_dir}
# 清理后台日志
echo "清理后台日志"
cd LR ; cat /dev/null > nohup.out
# 录制脚本
echo "开始部署录播脚本"
echo "=============================================================="
screen -dmUS "L"
echo "创建screen"
sleep 1
screen -S "L" -X stuff "nohup record/record_new.sh twitcastpy 95rn16 -o record_video/mikeneko -u baidupcs3:45468736:record_video/mikeneko -dt all &"
screen -S "L" -X stuff "\n"
screen -S "L" -X stuff "\n"
echo "みけねこ"
screen -S "L" -X stuff "nohup record/record_new.sh youtube UC54JqsuIbMw_d1Ieb4hjKoQ -o record_video/mikeneko -u baidupcs3:45468736:record_video/mikeneko -dt all &"
screen -S "L" -X stuff "\n"
screen -S "L" -X stuff "\n"
echo "みけねこYoutube"
screen -S "L" -X stuff "nohup record/record_new.sh twitcastpy miso_ssw -o record_video/miso -u baidupcs3:45468736:record_video/miso -dt all &"
screen -S "L" -X stuff "\n"
screen -S "L" -X stuff "\n"
echo "miso"
screen -S "L" -X stuff "nohup record/record_new.sh twitcastpy masimasi0 -o record_video/satonozomi -u baidupcs3:45468736:record_video/satonozomi -dt all &"
screen -S "L" -X stuff "\n"
screen -S "L" -X stuff "\n"
echo "佐藤希TC"
screen -S "L" -X stuff "nohup record/record_new.sh youtube UCmrOHKPhWV1epCbTObd3eaQ -o record_video/satonozomi -u baidupcs3:45468736:record_video/satonozomi -dt all &"
screen -S "L" -X stuff "\n"
screen -S "L" -X stuff "\n"
echo "佐藤希Youtube"
screen -S "L" -X stuff "jobs"
screen -S "L" -X stuff "\n"
echo "显示已部署任务"
echo "=============================================================="

cd ${cur_dir}
echo "开始部署mirai服务"
echo "=============================================================="
screen -dmUS "M"
echo "创建screen"
sleep 1
screen -S "M" -X stuff "cd mirai"
screen -S "M" -X stuff "\n"
echo "进入目录"
screen -S "M" -X stuff "./mcl -u"
screen -S "M" -X stuff "\n"
echo "启动mirai"
echo "=============================================================="
