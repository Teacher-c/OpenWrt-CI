#!/bin/bash
#Argon Theme
git clone --depth=1 --single-branch --branch $(echo $OWRT_URL | grep -Eiq "lede|padavanonly" && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-theme-argon.git
#git clone --depth=1 --single-branch --branch $(echo $OWRT_URL | grep -Eiq "lede|padavanonly" && echo "18.06" || echo "master") https://github.com/jerrykuku/luci-app-argon-config.git

#mosdns
if [[ $OWRT_URL == *"lede"* ]] ; then
  git clone https://github.com/sbwml/luci-app-mosdns -b v5-lua ./mosdns
  git clone https://github.com/sbwml/v2ray-geodata ./v2ray-geodata  
else
  git clone https://github.com/sbwml/luci-app-mosdns -b v5 ./mosdns
  git clone https://github.com/sbwml/v2ray-geodata ./v2ray-geodata
fi

#修改mosdns.sh 支持更多去广告格式
#删除空白行，删除！行，删除#行，删除||字符，删除^字符
#sed -i 's/\\cp \$AD_TMPDIR\/\* \/etc\/mosdns\/rule\/adlist/sed -i '\''\/^\$\/d;\/^\!\/d;\/^#\/d;s\/\[||^]\/\/g'\'' \$AD_TMPDIR\/\* \&\& \\cp \$AD_TMPDIR\/\* \/etc\/mosdns\/rule\/adlist/' ./mosdns/luci-app-mosdns/root/usr/share/mosdns/mosdns.sh

#PassWall2
#git clone --depth=1 --single-branch --branch "main" https://github.com/xiaorouji/openwrt-passwall2.git ./pw2_luci
#git clone --depth=1 --single-branch --branch "main" https://github.com/xiaorouji/openwrt-passwall-packages.git ./pw_packages

#helloworld
#git clone --depth=1 https://github.com/fw876/helloworld.git ./helloworld

#Open Clash
git clone --depth=1 --single-branch --branch "dev" https://github.com/vernesong/OpenClash.git ./OpenClash
#sed -i 's|mv /tmp/china_domains.list|sed -i '"'"'s/114.114.114.114/223.5.5.5/g'"'"' /tmp/china_domains.list \&\& mv /tmp/china_domains.list|' ./OpenClash/luci-app-openclash/root/usr/share/openclash/openclash_chnroute.sh
#mv $GITHUB_WORKSPACE/general/AX6/openclash/openclash_chnroute.sh ./OpenClash/luci-app-openclash/root/usr/share/openclash/

#预置OpenClash内核和GEO数据
export CORE_VER=https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version
export CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux
export CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux
export CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux

#export CORE_TYPE=$(echo $OWRT_TARGET | grep -Eiq "64|86" && echo "amd64" || echo "arm64")
if echo $OWRT_TARGET | grep -Eiq "CR6608|AC2100"; then
  CORE_TYPE="mipsle-softfloat"
elif echo $OWRT_TARGET | grep -Eiq "64|86"; then
  CORE_TYPE="amd64"
elif echo $OWRT_TARGET | grep -Eiq "Redmi-AX6"; then
  CORE_TYPE="arm64"
else
  CORE_TYPE="unknown"  # 或其他默认值
fi
export CORE_TYPE
export TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")

export GEO_MMDB=https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country-only-cn-private.mmdb
export GEO_IP=https://raw.githubusercontent.com/Loyalsoldier/geoip/release/geoip-only-cn-private.dat
export GEO_SITE=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat


cd ./OpenClash/luci-app-openclash/root/etc/openclash

curl -sfL -o ./Country.mmdb $GEO_MMDB
curl -sfL -o ./GeoIP.dat $GEO_IP
curl -sfL -o ./GeoSite.dat $GEO_SITE


mkdir ./core && cd ./core

curl -sfL -o ./tun.gz "$CORE_TUN"-"$CORE_TYPE"-"$TUN_VER".gz
gzip -d ./tun.gz && mv ./tun ./clash_tun

curl -sfL -o ./meta.tar.gz "$CORE_MATE"-"$CORE_TYPE".tar.gz
tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta

curl -sfL -o ./dev.tar.gz "$CORE_DEV"-"$CORE_TYPE".tar.gz
tar -zxf ./dev.tar.gz

chmod +x ./clash* ; rm -rf ./*.gz
