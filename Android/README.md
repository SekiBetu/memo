# 安卓手机APP清单

## 刷机工具

- [SDK Platform Tools](https://developer.android.com/studio/releases/platform-tools)

- [Google USB Driver](https://developer.android.com/studio/run/win-usb)

- [Team Win Recovery Project](https://weibo.com/u/6033736159)

## APK网站

- [APKMirror](https://www.apkmirror.com/)

- [F-Droid](https://www.f-droid.org/zh_Hans/packages/)

## 谷歌框架

- [支持GMS的机型](http://storage.googleapis.com/play_public/supported_devices.html)

- [Google Services Framework](https://www.apkmirror.com/apk/google-inc/google-services-framework/)

- [Google Play services](https://www.apkmirror.com/apk/google-inc/google-play-services/)、[Google Play服务](https://play.google.com/store/apps/details?id=com.google.android.gms)

- [Google Play Store](https://www.apkmirror.com/apk/google-inc/google-play-store/)

## Useful Path

`mount -o rw,remount /system`

`cp -f /data/misc/user/0/cacerts-added/* /system/etc/security/cacerts/`

`chown -R root:root /system/etc/security/cacerts/`

`chmod 644 /system/etc/security/cacerts/*`

`/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/`

`/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/MobileQQ/chatpic/`

`/system/priv-app/`

`/etc/permissions/`

注：如果将谷歌框架安装为特权的系统应用，很可能通过不了SafetyNet认证，刷入第三方的GApps套件同理

`/product/etc/permissions/services.cn.google.xml`

去除此行解锁国行GMS的部分功能

```xml
 <feature name="cn.google.services" />
```

修改神隐模式云控信息

```
*#*#76937#*#*
```

## NSFW

- [PicACG](https://www.picacomic.com)

- [JavRocket](https://github.com/gentlemansolo/JavRocket/releases)

- [EhViewer二次开发版](https://gitlab.com/NekoInverter/EhViewer)

- [ZArchiver Pro](https://www.423down.com/6027.html)

- [Tachiyomi](https://github.com/inorichi/tachiyomi)

- [MX Player Pro](https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.pro)

## 哔哩哔哩

- [哔哩哔哩](https://app.bilibili.com/)

- [哔哩哔哩漫画](https://manga.bilibili.com/app-download)

- [【LSPosed Module】哔哩漫游](https://github.com/yujincheng08/BiliRoaming/actions)

## 无分组

- [小米计算器](https://play.google.com/store/apps/details?id=com.miui.calculator)

- [支付宝](https://mobile.alipay.com/index.htm)

## 游戏

- [命运-冠位指定](https://game.bilibili.com/fgo/)

- [明日方舟](https://ak.hypergryph.com/)

- [英雄联盟手游](https://lolm.qq.com/)

- [Steam](https://play.google.com/store/apps/details?id=com.valvesoftware.android.steam.community)

## 无分组

- [Microsoft Authenticator](https://play.google.com/store/apps/details?id=com.azure.authenticator)

## 论坛

- [微博](https://c.weibo.cn/)

- [知乎](https://www.zhihu.com/app/)

- [NGA玩家社区](https://app.nga.cn/)

## SNS

- [Twitter](https://play.google.com/store/apps/details?id=com.twitter.android)

- [YouTube](https://play.google.com/store/apps/details?id=com.google.android.youtube)

- [TwitCasting](https://play.google.com/store/apps/details?id=com.sidefeed.TCViewer)

- [Discord](https://discord.com/download)

- [Inoreader](https://play.google.com/store/apps/details?id=com.innologica.inoreader)

## 无分组

- [饿了么](https://www.ele.me/waimai)

- [Telegram](https://telegram.org/android)

## 工具

- [Google Play Store](https://www.apkmirror.com/apk/google-inc/google-play-store/)

- [酷安](https://www.coolapk.com/apk/com.coolapk.market)

- [Magisk](https://github.com/topjohnwu/Magisk)

- [【Magisk Module】Shamiko](https://github.com/LSPosed/LSPosed.github.io/releases)

- [【Magisk Module】safetynet-fix](https://github.com/kdrag0n/safetynet-fix/releases)

- ~~[【Magisk Module】MagiskHidePropsConf](https://github.com/Magisk-Modules-Repo/MagiskHidePropsConf/releases)~~

- [【Magisk Module】一加赛博朋克2077开机动画](https://www.coolapk.com/feed/22920260)

- [【Magisk Module】MagiskTrustUserCerts](https://github.com/NVISOsecurity/MagiskTrustUserCerts)

- [【Magisk Module】LSPosed](https://github.com/LSPosed/LSPosed/actions/workflows/core.yml?query=workflow%3ACore+branch%3Amaster)

- [【LSPosed Module】DisableFlagSecure](https://github.com/LSPosed/DisableFlagSecure/releases)

- [【LSPosed Module】JustTrustMe](https://github.com/SekiBetu/JustTrustMe/releases)、[【LSPosed Module】sslunpinning](https://github.com/Xposed-Modules-Repo/io.github.tehcneko.sslunpinning/releases)

- [搜狗输入法](https://pinyin.cn/)

- [Microsoft Office](https://play.google.com/store/apps/details?id=com.microsoft.office.officehubrow)

- [DeepL](https://play.google.com/store/apps/details?id=com.deepl.mobiletranslator)

- [MT管理器](https://bbs.binmt.cc/forum-2-1.html)、~~[Solid Explorer](https://www.ghpym.com/solidexplorer.html)~~

- [【LSPosed Module】QX模块/微X模块](https://t.me/fk_zhang)、[【LSPosed Module】QNotified](https://github.com/ferredoxin/QNotified)

- [【LSPosed Module】应用伪装](https://github.com/Xposed-Modules-Repo/com.variable.apkhook/releases)、~~[【LSPosed Module】应用变量](https://github.com/NekoGirlSAIKOU/AppEnv-Kotlin/releases)~~

- ~~[【LSPosed Module】XQuickEnergy_Crystal](https://t.me/mysl88)~~

- [【LSPosed Module】杜比大喇叭β版](https://github.com/nining377/dolby_beta/releases)、~~[【LSPosed Module】叼毛网抑云](https://github.com/Xposed-Modules-Repo/com.blanke.diaomao163/releases)~~

## Proxy

- [SagerNet](https://github.com/SagerNet/SagerNet/releases)

- [Termius](https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client)

- [Speedtest](https://play.google.com/store/apps/details?id=org.zwanoo.android.speedtest)

## no group

- [QQ](https://im.qq.com/download)

- [微信](https://weixin.qq.com/)

## 系统工具

- 电子邮件

- 文件管理

- 日历

- 相册

- 设置

- 主题壁纸

- 手机管家

- [万能遥控](https://play.google.com/store/apps/details?id=com.duokan.phone.remotecontroller)

- 天气

- 时钟

- 屏幕录制

- 录音机

- 指南针

- 扫一扫

## 无分组

- [网易云音乐](https://music.163.com/#/download)

## 底栏工具

- 电话

- 短信

- 笔记

- [Chrome](https://play.google.com/store/apps/details?id=com.android.chrome)

- 相机

## 出行

- [高德地图](https://mobile.amap.com/)

- [百度地图](https://map.baidu.com/zt/client/index/)

- [Google Maps](https://play.google.com/store/apps/details?id=com.google.android.apps.maps)

- [交管12123](https://122.gov.cn/)

- [医鹿](https://www.coolapk.com/apk/com.citic21.user)

- [自如](http://hz.ziroom.com/)

- [我爱我家](https://hz.5i5j.com/)

- [小米运动健康](https://www.coolapk.com/apk/com.mi.health)

## 网盘

- [百度网盘](https://pan.baidu.com/download)

- ~~[天翼云盘](https://cloud.189.cn/download_client.jsp)~~

- ~~[阿里云盘](https://www.aliyundrive.com/)~~

## 购物

- [京东](https://www.jd.com/)

- [淘宝](https://market.m.taobao.com/app/fdilab/download-page/main/index.html)

- [拼多多](https://www.pinduoduo.com/home/download/)

- [闲鱼](https://2.taobao.com/)

## 营业厅

- [中国移动](http://www.10086.cn/cmccclient/indexc_new.html)

- [电信营业厅](http://www.189.cn/client/)

- [中国建设银行](https://www.coolapk.com/apk/com.chinamworld.main)

- ~~[杭州市民卡](https://www.96225.com/smknet/service/show_mobileAPP.action)~~

## 无分组

- ~~[钉钉](https://page.dingtalk.com/wow/dingtalk/act/download)~~

## Future

- [BOSS直聘](https://app.zhipin.com/?ka=header-app)

- [前程无忧51job](http://app.51job.com/index.html)

- [智联招聘](https://www.zhaopin.com)

- [脉脉](https://maimai.cn/)

- ~~[猎聘](https://www.liepin.com/)~~

- ~~[拉勾网](https://help.lagou.com/staticpage/app_download/pc/index.html)~~

# 无分组

- ~~[MiraiAndroid](https://github.com/mzdluo123/MiraiAndroid/releases)~~
