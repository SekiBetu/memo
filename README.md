# Windows软件清单
避免每次装机重头寻找历史安装过的软件，索性列一个清单，炼成半小时装机软件复原大法

### 关闭索引
设置 —— 搜索 —— 搜索Windows —— 把各磁盘加入 "排除的文件夹" ，在 "高级搜索索引器设置" 中排除现有的文件夹并重建索引

各磁盘右键属性 —— 取消勾选 "除了文件属性外，还允许索引此驱动器上文件的内容" —— 选择 "仅将更改应用于驱动器"

### 关闭休眠模式:
<pre>
powercfg -h off
</pre>

### 关闭系统还原:
设置 —— 系统 —— 存储 —— 系统和保留空间 —— 管理系统还原

### 关闭系统错误转储文件
此电脑右键属性 —— 高级系统设置 —— 启动和故障回复设置 —— 写入调试信息:(无)

### CPU核数设置:
msconfig

### 卓越性能电源计划：
<pre>
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
</pre>

### 一键解除所有UWP应用的网络隔离（CMD指令）：
[图形化软件](https://github.com/tiagonmas/Windows-Loopback-Exemption-Manager)
<pre>
FOR /F "tokens=11 delims=\" %p IN ('REG QUERY "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings"') DO CheckNetIsolation.exe LoopbackExempt -a -p=%p
</pre>

### git代理设置：
<pre>
# ssh代理配置文件路径：C:/Users/username/.ssh/config
Host github.com
    ProxyCommand connect -S localhost:2080 %h %p

# 指令的方式直接增加代理设置
git config --global http.https://github.com.proxy socks5://127.0.0.1:2080

# git配置文件路径：C:/Users/username/.gitconfig
[http "https://github.com"]
	proxy = socks5://127.0.0.1:2080
</pre>

### pip代理功能稀烂，建议换阿里源：
<pre>
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com

# pip全局配置文件路径：C:/Users/username/AppData/Roaming/pip/pip.ini
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
# proxy=http://127.0.0.1:2081
[install]
trusted-host = mirrors.aliyun.com
</pre>

### Chrome浏览器实验性功能：
<pre>
Override software rendering list
Smooth Scrolling
GPU rasterization
Out of process rasterization using DDLs
Zero-copy rasterizer
Enable native notifications.
Tab Groups Collapse
Parallel downloading
Tab Hover Card Images
Enable sharing page via QR Code
Skia API for compositing
YUV decoding for JPEG
YUV Decoding for WebP
Heavy Ad Intervention
Enforce deprecation of legacy TLS versions
Enable Tab Search
</pre>

### 去除Win10默认显示的一些目录
<pre>
Windows Registry Editor Version 5.00
;如需还原去除上语句前减号即可

;取消我的电脑"视频"文件夹
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}]
;取消我的电脑"文档"文件夹
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}]
;取消我的电脑"桌面"文件夹
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]
;取消我的电脑"音乐"文件夹?
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}]
;取消我的电脑"下载"文件夹
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}]
;取消我的电脑"图片"文件夹
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}]
;取消我的电脑"3D对象"文件夹
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}]
</pre>

### youtube-dl设置文件目录：C:/Users/username/youtube-dl.conf
<pre>
-i
--proxy socks5://127.0.0.1:2080/
-f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
-o V:/annie/"%(uploader)s (%(uploader_id)s)/%(upload_date)s - %(title)s - (%(duration)ss) [%(resolution)s] [%(id)s].%(ext)s"
--add-metadata
--write-description
--write-thumbnail
</pre>

### WIN10优化设置，关闭遥测、熔断、TSX
<pre>
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorPort]
"TelemetryPerformanceEnabled"=dword:00000000
"TelemetryErrorDataEnabled"=dword:00000000
"TelemetryDeviceHealthEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000003
"FeatureSettingsOverrideMask"=dword:00000003

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"DisableTsx"=dword:00000000
</pre>

### cmd设置编码格式，936为GBK，65001为UTF-8
<pre>
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor]
"autorun"="chcp 936/65001"
</pre>

### IntelliJ IDEA设置备忘录
<pre>
【IntelliJ IDEA启动参数】
文件目录：~\JetBrains\IntelliJIDEA\bin\idea64.exe.vmoptions
-Xms2048m
-Xmx2048m
-XX:ReservedCodeCacheSize=1024m
【皮肤设置】
Appearance & Behavior —— Appearance —— Theme：One Dark vivid 
【启动IDEA时不自动打开项目】
Appearance & Behavior —— System Settings —— × Reopen last project on startup
【代理设置】
Appearance & Behavior —— System Settings —— HTTP Proxy —— Manual proxy configuration —— √ HTTP ； Host name：127.0.0.1 ； Port number：2081 
【滚轮修改字体大小】
Editor —— General —— √ Change font size(Zoom) with Ctrl+Mouse Wheel 
【自动导包】
Editor —— General —— Auto Import —— Insert imports on paste：Always (default in 2020.3.1) ；√ Add Unambiguous imports on the fly ；√ Optimize imports on the fly（for current project） 
【设置行号显示】
Editor —— General —— Appearance —— √ Show line numbers (default in 2020.3.1) ；√ Show method separators 
【忽略大小写】
Editor —— General —— Code Completion —— × Match case 
【取消单行显示标签页】
Editor —— General —— Editor Tabs —— × Show tabs in one row 
【悬浮提示】
Editor —— Code Editing —— √ Show quick documentation on mouse move (default in 2020.3.1)
【字体】
Editor —— Font —— Fallback font：Microsoft YaHei UI 
【自动换行】
Editor —— Code Style —— √ Wrap on typing ； —— Java —— Wrapping and Braces —— √ Ensure right margin is not exceeded 
【单行注释斜杠跟着代码】
Editor —— Code Style —— Java —— Code Generation —— × Line comment at first column ； √ Add a space at comment start 
【项目文件编码】
Editor —— File Encodings —— Global Encoding：UTF-8 ； Project Encoding：UTF-8 ； Default encoding for properties files：UTF-8 ； √ Transparent native-to-ascii conversion 
【插件列表】
Plugins —— Alibaba Java Coding Guidelines ； One Dark theme ； Rainbow Brackets ； Translation 
【自动编译项目】
Build, Execution, Deployment —— Compiler —— √ Build project automatically 
【增加堆内存】
Build, Execution, Deployment —— Compiler —— Build process heap size(Mbytes)：2048 
【翻译设置】
Tools —— Translation —— 常规 —— √ 使用translate.google.com ； —— 字体 —— 主要字体：Microsoft YaHei UI ； 音标字体：Arial 
</pre>

## Useful Websites
- [UUP dump](https://uupdump.ml/?lang=zh-cn)
- [423Down](https://www.423down.com/)
- [果核剥壳](https://www.ghpym.com/)
- [远景论坛](http://bbs.pcbeta.com/forum-win10-1.html)

## Software List(Indispensable)
- [微软常用运行库](https://www.ghpym.com/yxkhj.html)、[Alter version](https://github.com/abbodi1406/vcredist/releases)
- [HWID_KMS38](http://bbs.pcbeta.com/viewthread-1810482-1-1.html)
- [搜狗输入法](https://pinyin.sogou.com/)
- [Bandizip](https://www.bandisoft.com/bandizip/dl/)、[patch](https://www.423down.com/9735.html)、[7-Zip](https://www.7-zip.org/)、[7-Zip-zstd](https://github.com/mcmilk/7-Zip-zstd/releases)、[WinRAR](https://apphot.cc/121.html)
- [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases)、[v2rayN](https://github.com/2dust/v2rayN/releases)
- [火绒](https://www.huorong.cn/person5.html)
- [GeForce Experience](https://www.nvidia.com/zh-cn/geforce/geforce-experience/)、[GeForce Drivers](https://www.nvidia.cn/geforce/drivers/)
- [Logitech Gaming Software](https://support.logi.com/hc/zh-cn/articles/360025298053)
- [Realtek High Definition Audio (HDA) Version WHQL](https://www.necacom.net/index.php/realtek/hda/)
- [Intel Graphics Driver](https://downloadcenter.intel.com/zh-cn/product/88345/-530)
- [Intel® Graphics Command Center](https://www.microsoft.com/en-us/p/intel-graphics-command-center/9plfnlnt3g5g)
- [Intel Wi-Fi 6 AX200 (Gig+) Driver](https://downloadcenter.intel.com/zh-cn/product/189347/-Wi-Fi-6-AX200-Gig-)
- [nvidiaProfileInspector](https://github.com/Orbmu2k/nvidiaProfileInspector/releases/)、[NVidiaProfileInspectorDmW](https://github.com/DeadManWalkingTO/NVidiaProfileInspectorDmW/releases)
- [DriverStoreExplorer](https://github.com/lostindark/DriverStoreExplorer/releases)
- [TrafficMonitor](https://github.com/zhongyang219/TrafficMonitor/releases)
- [OpenHashTab](https://github.com/namazso/OpenHashTab/releases)
- [EmEditor](https://www.423down.com/7569.html)
- [Chrome](https://www.google.com/intl/zh-CN/chrome/browser/thankyou.html?platform=win64&standalone=1&statcb=1&installdataindex=defaultbrowser)、[FireFox](https://www.mozilla.org/zh-CN/firefox/all/#product-desktop-release)
- [Office Tool Plus](https://github.com/YerongAI/Office-Tool/releases)
- [QQ](https://im.qq.com/download/)、[NtrQQ](https://github.com/NtrQQ/download/releases)、[iYa.App 软件交流社区](https://iya.app/)
- [Steam](https://store.steampowered.com/about/)
- [Ubisoft Connect](https://ubisoftconnect.com/zh-CN/)
- [Groupy](https://store.steampowered.com/app/912170)
- [Fences](https://store.steampowered.com/app/607380)
- [Start10](https://store.steampowered.com/app/620050/Start10)
- [(pin1)QuickCut](https://github.com/HaujetZhao/QuickCut)、[XMedia Recode](https://www.xmedia-recode.de/en/download.php)
- [(pin2)Microsoft Sticky Notes](https://www.microsoft.com/en-us/p/microsoft-sticky-notes/9nblggh4qghw)
- [(pin3)Newsflow](https://www.microsoft.com/zh-cn/p/newsflow/9nblggh58s5r)
- [(pin4)Termius](https://www.termius.com/windows)、[patch](https://www.52pojie.cn/thread-1303401-1-1.html)
- [(pin5)WinSCP](https://winscp.net/eng/download.php)
- [(pin6)ScreenToGif](https://github.com/NickeManarin/ScreenToGif/releases)
- [(pin7)网易云音乐](https://music.163.com/#/download)
- [(pin10)Windows Calculator](https://www.microsoft.com/en-us/p/windows-calculator/9wzdncrfhvn5)
- [youtube-dl](https://github.com/ytdl-org/youtube-dl/releases)、[Annie](https://github.com/iawia002/annie/releases)
- [FFmpeg(GPL ver.)](https://github.com/BtbN/FFmpeg-Builds/releases)
- [Everything](https://www.voidtools.com/zh-cn/downloads/)
- [Snipaste](https://www.snipaste.com/)
- [PotPlayer](https://potplayer.daum.net/)
- [Honeyview](http://www.bandisoft.com/honeyview/)、[qimgv](https://github.com/easymodo/qimgv/releases)
- [K-Lite Codec Pack Mega](http://www.codecguide.com/download_k-lite_codec_pack_mega.htm)
- [旺信](https://alimarket.taobao.com/markets/qnww/portal-group/ww/download)
- [SteamAchievementManager](https://github.com/gibbed/SteamAchievementManager/releases)、[SAM-Auto](https://github.com/unencouraged/SAM-Auto/releases)
- [Adobe software series](https://weibo.com/1112829033)
- [百度云](http://pan.baidu.com/download)
- [小栗子机器人](http://www.xiaolz.cn/)
- [Typora](https://typora.io/)
- [CCleaner](https://www.423down.com/716.html)、[Winapp2](https://github.com/MoscaDotTo/Winapp2)
- [XMind](https://www.ghpym.com/xmindzen.html)
- [Telegram](https://telegram.org/)
- [UnblockNeteaseMusic](https://github.com/nondanee/UnblockNeteaseMusic)
- [WinSW](https://github.com/winsw/winsw/releases)
- [BilibiliLiveRecordDownLoader](https://github.com/HMBSbige/BilibiliLiveRecordDownLoader/releases)
- [天翼云盘](https://cloud.189.cn/download_client.jsp)
- [Netch](https://github.com/NetchX/Netch/releases)
- [雷神加速器](https://jiasu.nn.com/)
- [qBittorrent-Enhanced-Edition](https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases)
- [微信](https://www.423down.com/8718.html)
- 来自设备制造商的 HEVC 视频扩展(ms-windows-store://pdp/?ProductId=9n4wgh0z6vhq)

## Software List(Optional)
- [AIDA64](https://www.423down.com/887.html)
- [AS SSD Benchmark](https://www.423down.com/6751.html)
- [Cheat Engine](https://cheatengine.org/)
- [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)
- [DISM++](http://www.chuyu.me/zh-Hans/index.html)、[wsusscn3.cab](https://github.com/Chuyu-Team/Dism-Multi-language/releases)
- [Fiddler Everywhere](https://www.telerik.com/download/fiddler-everywhere)、[Fiddler Classic](https://www.telerik.com/download/fiddler)
- [waifu2x-caffe](https://github.com/lltcggie/waifu2x-caffe)、[cuDNN](https://developer.nvidia.com/rdp/cudnn-download)、[Waifu2x-Extension-GUI](https://github.com/AaronFeng753/Waifu2x-Extension-GUI/releases)
- [KMS Tools](https://www.solidfiles.com/folder/bd7165a0d4/)
- [Open Broadcaster Software](https://obsproject.com/download)
- [UltraISO](https://www.ghpym.com/ultraiso.html)
- [drawio](https://github.com/jgraph/drawio-desktop/releases)
- [VMware Workstation](https://www.ghpym.com/workstationlite.html)
- [Discord](https://discordapp.com/download)
- [LINE](https://line.me/zh-hant/)
- [rufus](https://github.com/pbatard/rufus/releases)
- [Realtek Audio Control(UWP)](https://www.microsoft.com/zh-cn/p/realtek-audio-control/9p2b8mcsvpln)(Only valid when the UAD version of the driver is installed)
- [Resilio Sync](https://www.resilio.com/platforms/desktop/)
- [格式工厂](https://www.423down.com/1072.html)
- [CrystalDiskInfo & CrystalDiskMark](https://crystalmark.info/en/download/)
- [Firewall App Blocker](https://www.sordum.org/8125/firewall-app-blocker-fab-v1-7/)
- [GPU-Z](https://www.423down.com/3675.html)
- [NatTypeTester](https://github.com/HMBSbige/NatTypeTester/releases)
- [SSD-Z](https://www.423down.com/4748.html)
- 显示器色域检测v2.2.1(图拉丁版)
- [BestTrace](https://www.ipip.net/product/client.html)
- [IObit Uninstaller](https://www.423down.com/7732.html)
- [MediaInfo](https://mediaarea.net/en/MediaInfo)
- [冰点文库下载器](https://www.423down.com/708.html)

#### Drivers
- [Driver Booster](https://www.423down.com/10421.html)
- [驱动人生](https://www.423down.com/581.html)
- [驱动精灵](https://www.423down.com/5768.html)
- [360驱动大师](https://www.423down.com/9157.html)

#### Recovery
- [7-Data Recovery Suite](https://www.423down.com/2721.html)
- [EasyRecovery](https://www.423down.com/7904.html)
- [R-STUDIO Network](https://www.423down.com/8132.html)
- [DiskGenius](https://www.423down.com/8073.html)

## Developer tools
- [JDK](https://www.oracle.com/java/technologies/javase-downloads.html)、[OpenJDK](https://developers.redhat.com/products/openjdk/download)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Windows Terminal](https://github.com/microsoft/terminal/releases)
- [(pin8)IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=windows)、[JetBrains Mono](https://www.jetbrains.com/lp/mono/)、[patch](https://zhile.io/)
- [git](https://git-scm.com/downloads)
- [AnotherRedisDesktopManager](https://github.com/qishibo/anotherredisdesktopmanager/releases)
- [Process Monitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon)
- [Autoruns](https://docs.microsoft.com/zh-cn/sysinternals/downloads/autoruns)
- [WinDbg Preview](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools)
- [jadx](https://github.com/skylot/jadx/releases)、[bytecode-viewer](https://github.com/Konloch/bytecode-viewer/releases)、[cfr](https://github.com/leibnitz27/cfr/releases)、[pyinstxtractor](https://github.com/extremecoders-re/pyinstxtractor)、[python-uncompyle6](https://github.com/rocky/python-uncompyle6/releases)
- [(pin9)Navicat Premium](https://www.ghpym.com/navicat.html)
- [Node.js](https://nodejs.org/zh-cn/download/)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#windows-nightly)
- [Python](https://www.python.org/downloads/)
- [MySQL](https://dev.mysql.com/downloads/windows/installer/5.7.html)
- [Apktool](https://ibotpeaches.github.io/Apktool/install/)、[Apktool](https://github.com/iBotPeaches/Apktool/releases)
- [PowerShell](https://github.com/PowerShell/PowerShell/releases)
- [TDM-GCC](https://jmeubank.github.io/tdm-gcc/)
- [Gpg4win](https://www.gpg4win.org/)

## Chrome Extensions
#### Skin
- [When the Night Falls (yellow neon; with rain)](https://chrome.google.com/webstore/detail/when-the-night-falls-yell/dhdibmnepnffnnlgldgkdembnmnhmdbc)

#### Pinned
- [Wrona History Menu](https://chrome.google.com/webstore/detail/wrona-history-menu/fhibbdoaickjpmmhemkompghjjmpjdpj)
- [Tab Muter](https://chrome.google.com/webstore/detail/tab-muter/bnclejfcblondkjliiblkojdeloomadd)
- [哔哩哔哩助手](https://chrome.google.com/webstore/detail/%E5%93%94%E5%93%A9%E5%93%94%E5%93%A9%E5%8A%A9%E6%89%8B%EF%BC%9Abilibilicom-%E7%BB%BC%E5%90%88%E8%BE%85%E5%8A%A9%E6%89%A9%E5%B1%95/kpbnombpnpcffllnianjibmpadjolanh)
- [FireShot](https://chrome.google.com/webstore/detail/take-webpage-screenshots/mcbpblocgmgfnpjjppndjkmgjaogfceg)
- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
- [FeHelper](https://chrome.google.com/webstore/detail/fehelper%E5%89%8D%E7%AB%AF%E5%8A%A9%E6%89%8B/pkgccpejnmalmdinmhkkfafefagiiiad)
- [RSSHub Radar](https://chrome.google.com/webstore/detail/rsshub-radar/kefjpfngnndepjbopdmoebkipbgkggaa)
- [Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
- [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg)
- [Twitter Media Downloader](https://chrome.google.com/webstore/detail/twitter-media-downloader/cblpjenafgeohmnjknfhpdbdljfkndig)
- [Downloader for Instagram](https://www.crx4chrome.com/crx/86579/)
- [SingleFile](https://chrome.google.com/webstore/detail/singlefile/mpiodijhokgodhhofbcjdecpffjipkle)
- [魂签](https://github.com/inu1255/soulsign-chrome)
- [Stylus](https://chrome.google.com/webstore/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne)
- [Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)

#### Unpinned
- [Adobe Acrobat](https://chrome.google.com/webstore/detail/adobe-acrobat/efaidnbmnnnibpcajpcglclefindmkaj)
- [Augmented Steam](https://chrome.google.com/webstore/detail/augmented-steam/dnhpnfgdlenaccegplpojghhmaamnnfp)
- [Axure RP Extension for Chrome](https://chrome.google.com/webstore/detail/axure-rp-extension-for-ch/dogkpdfcklifaemcdfbildhcofnopogp)
- [EhSyringe](https://github.com/EhTagTranslation/EhSyringe)
- [IDM Integration Module](https://chrome.google.com/webstore/detail/idm-integration-module/ngpampappnmepgilojfohadhhmbhlaek)
- [Git Master](https://github.com/ineo6/git-master)
- [Refined GitHub](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf)
- [ScrollAnywhere](https://chrome.google.com/webstore/detail/scrollanywhere/jehmdpemhgfgjblpkilmeoafmkhbckhi)
- [Steam Database](https://chrome.google.com/webstore/detail/steam-database/kdbmhfkmnlmbkgbabkdealhhbfhlmmon)
- [TabCopy](https://chrome.google.com/webstore/detail/tabcopy/micdllihgoppmejpecmkilggmaagfdmb)
- [YouTube Live Chat Flow](https://github.com/fiahfy/youtube-live-chat-flow/releases)
- [mirigana](https://chrome.google.com/webstore/detail/mirigana/hbekfodhcnfpkmoeaijgbamedofonjib)
- [懒人记单词](https://chrome.google.com/webstore/detail/%E6%87%92%E4%BA%BA%E8%AE%B0%E5%8D%95%E8%AF%8D/bfpdfenfogbajbgoacemgemdoojelbfi)
- [购物党自动比价工具](https://chrome.google.com/webstore/detail/%E8%B4%AD%E7%89%A9%E5%85%9A%E8%87%AA%E5%8A%A8%E6%AF%94%E4%BB%B7%E5%B7%A5%E5%85%B7/jgphnjokjhjlcnnajmfjlacjnjkhleah)

#### Not Using
- ~~[Bookmark Sidebar](https://chrome.google.com/webstore/detail/bookmark-sidebar/jdbnofccmhefkmjbkkdkfiicjkgofkdh)~~
- ~~[Chrono Downloader](https://chrome.google.com/webstore/detail/chrono-download-manager/mciiogijehkdemklbdcbfkefimifhecn)~~
- ~~[Country Flags & IP Whois](https://chrome.google.com/webstore/detail/country-flags-ip-whois/bffjckjhidlcnenenacdahhpbacpgapo)~~
- ~~[Download Manager](https://chrome.google.com/webstore/detail/download-manager/ofpglhlcdbjdhlacgbljnildhajfmlei)~~
- ~~[QZoneExport](https://github.com/ShunCai/QZoneExport/releases)~~、~~[QQ空间导出助手](https://chrome.google.com/webstore/detail/qq%E7%A9%BA%E9%97%B4%E5%AF%BC%E5%87%BA%E5%8A%A9%E6%89%8B/aofadimegphfgllgjblddapiaojbglhf)~~
- ~~[Similar Sites](https://chrome.google.com/webstore/detail/similar-sites-discover-re/necpbmbhhdiplmfhmjicabdeighkndkn)~~
- ~~[Steam Inventory Helper](https://chrome.google.com/webstore/detail/steam-inventory-helper/cmeakgjggjdlcpncigglobpjbkabhmjl)~~


## 系统美化(Unstable)
- [更纱黑体(Iosevka+思源黑体)](https://github.com/be5invis/Sarasa-Gothic/releases)
- [JetBrainsMono](https://github.com/JetBrains/JetBrainsMono/releases)
- [致美化](https://zhutix.com/)
- [noMeiryoUI](http://tatsu.life.coocan.jp/MySoft/index.html)
- [MacType](https://www.mactype.net/)
- [UltraUXThemePatcher](https://www.syssel.net/hoefs/software_uxtheme.php?lang=en)
- [OldNewExplorerCfg](https://tihiy.net/files/OldNewExplorer.rar)

## 火绒规则
- [火绒论坛用户规则分享区](https://bbs.huorong.cn/forum-45-1.html)
- [基础防御规则](https://bbs.huorong.cn/thread-12393-1-1.html)
- [反流氓规则](https://bbs.huorong.cn/thread-12084-1-1.html)
- [隐私保护规则](https://bbs.huorong.cn/thread-14023-1-1.html)
- [规则集中下载](https://flymc.cc/2020/03/17/HuorongRules/)

注：更新Windows时需要关闭基础防御规则，安装浏览器时需要关闭隐私保护规则