pwsh -Command "Invoke-WebRequest -Uri https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat -Proxy 'http://127.0.0.1:2081' -OutFile S:\Proxy\v2rayN\geoip.dat"
pwsh -Command "Invoke-WebRequest -Uri https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat -Proxy 'http://127.0.0.1:2081' -OutFile S:\Proxy\v2rayN\geosite.dat"
exit