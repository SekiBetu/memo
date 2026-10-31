酒馆本体(Windows)
```
安装nodejs、git
git clone https://github.com/SillyTavern/SillyTavern -b release
双击 Start.bat 安装/开始
```
酒馆本体(Android)
```
安装Termux
https://github.com/termux/termux-app/releases

更换源
termux-change-repo

更新
pkg update && pkg upgrade

安装依赖
pkg install git nodejs-lts nano

安装酒馆
git clone https://github.com/SillyTavern/SillyTavern -b release
cd ~/SillyTavern
bash start.sh

更新酒馆
cd ~/SillyTavern
git pull --rebase --autostash
```

```
创建快捷方式
nano ~/.bashrc

# 更新 Termux 软件包
alias pkgup="pkg update && pkg upgrade"
# 启动 SillyTavern
alias st='cd ~/SillyTavern && bash start.sh'
# 更新 SillyTavern
alias stup='cd ~/SillyTavern && git pull --rebase --autostash'

填入以上内容后运行source ~/.bashrc刷新
```

```
性能调优
nano ~/SillyTavern/config.yaml

performance:
  # 避免加载所有角色数据直到需要时
  lazyLoadCharacters: true
  # 禁用磁盘缓存以减少存储使用
  useDiskCache: false
backups:
  chat:
    # 可选：禁用自动聊天备份以节省存储空间
    enabled: false
```

酒馆本体(Android整合包)
```
https://github.com/Sanitised/ST-android/releases
```

酒馆插件
```
https://github.com/n0vi028/JS-Slash-Runner 酒馆助手
https://github.com/zonde306/ST-Prompt-Template 提示词模版
https://discord.com/channels/1134557553011998840/1429151492362862683 SP数据库
```

酒馆本地生图
```
https://discord.com/channels/1134557553011998840/1515044498647023706 本地生图
https://discord.com/channels/1134557553011998840/1515044498647023706/1539304209495887972 脚本
https://discord.com/channels/1134557553011998840/1515044498647023706/1539493803025498183 测试模版
https://discord.com/channels/1134557553011998840/1515044498647023706/1539234880984981625 预设
https://discord.com/channels/1134557553011998840/1515044498647023706/1520630350773223494 正则
https://github.com/xororz/local-dream/releases APP
https://huggingface.co/xororz/sdxl-qnn/blob/main/illustrious_v17_dmd2_qnn2.28_8gen3.zip 模型

SDXL低内存模式
允许局域网访问

图像宽高比 1:1
调度器 LCM
生成步数 4-6步
CFG Scale 1.0
批次数量 1
[img2img]Denoise Strengthen 0.60

分辨率 1024x1024
关闭Karras

反向提示词
low quality, bad anatomy, ugly, deformed, distorted, blurry, noisy, artifacts, lowres, watermark

```



推荐模型
```
claude-opus-4-6
deepseek-v4-pro
glm-5.3-max
```

酒馆预设
```
https://discord.com/channels/1134557553011998840/1471539565020975205 双人成行(国外模型)
https://discord.com/channels/1134557553011998840/1475708905521811568 TG(国外+国内模型)
https://discord.com/channels/1134557553011998840/1497544939544772609 梦境思客(国内模型轻量版)
```

其他设置
```
1.文本补全/聊天补全都要设置模型
2.提示词后处理选严格
3.关闭DeepkSeek思维链：附加参数-包括主体参数
{
    "thinking": {
        "type": "disabled"
    }
}
```
