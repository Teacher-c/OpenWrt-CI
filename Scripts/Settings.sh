#!/bin/bash

#删除冲突插件
rm -rf $(find feeds/luci/ -type d -regex ".*\(argon\|design\|mosdns\|v2ray-geodata\|passwall\|openclash\).*")
rm -rf $(find feeds/packages/ -type d -regex ".*\(argon\|design\|mosdns\|v2ray-geodata\|passwall\|openclash\).*")
#rm -rf $(find feeds/smpackage/ -type d -regex ".*\(argon\|design\|mosdns\|v2ray-geodata\|passwall\|openclash\).*")
#rm -rf $(find feeds/smpackage/ -type d -regex ".*\(base-files\|dnsmasq\|firewall\|fullconenat\|libnftnl\|nftables\|ppp\|opkg\|ucl\|upx\|vsftpd-alt\|miniupnpd-iptables\|wireless-regdb\).*")

#curl supports h3/quic.
# nghttp3
rm -rf feeds/packages/libs/nghttp3
git clone https://github.com/sbwml/package_libs_nghttp3 package/libs/nghttp3
# ngtcp2
rm -rf feeds/packages/libs/ngtcp2
git clone https://github.com/sbwml/package_libs_ngtcp2 package/libs/ngtcp2
# curl - http3/quic
rm -rf feeds/packages/net/curl
git clone https://github.com/sbwml/feeds_packages_net_curl feeds/packages/net/curl

pushd package/libs/openssl/patches
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0001-QUIC-Add-support-for-BoringSSL-QUIC-APIs.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0002-QUIC-New-method-to-get-QUIC-secret-length.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0003-QUIC-Make-temp-secret-names-less-confusing.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0004-QUIC-Move-QUIC-transport-params-to-encrypted-extensi.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0005-QUIC-Use-proper-secrets-for-handshake.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0006-QUIC-Handle-partial-handshake-messages.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0007-QUIC-Fix-quic_transport-constructors-parsers.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0008-QUIC-Reset-init-state-in-SSL_process_quic_post_hands.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0009-QUIC-Don-t-process-an-incomplete-message.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0010-QUIC-Quick-fix-s2c-to-c2s-for-early-secret.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0011-QUIC-Add-client-early-traffic-secret-storage.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0012-QUIC-Add-OPENSSL_NO_QUIC-wrapper.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0013-QUIC-Correctly-disable-middlebox-compat.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0014-QUIC-Move-QUIC-code-out-of-tls13_change_cipher_state.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0015-QUIC-Tweeks-to-quic_change_cipher_state.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0016-QUIC-Add-support-for-more-secrets.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0017-QUIC-Fix-resumption-secret.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0018-QUIC-Handle-EndOfEarlyData-and-MaxEarlyData.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0019-QUIC-Fall-through-for-0RTT.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0020-QUIC-Some-cleanup-for-the-main-QUIC-changes.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0021-QUIC-Prevent-KeyUpdate-for-QUIC.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0022-QUIC-Test-KeyUpdate-rejection.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0023-QUIC-Buffer-all-provided-quic-data.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0024-QUIC-Enforce-consistent-encryption-level-for-handsha.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0025-QUIC-add-v1-quic_transport_parameters.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0026-QUIC-return-success-when-no-post-handshake-data.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0027-QUIC-__owur-makes-no-sense-for-void-return-values.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0028-QUIC-remove-SSL_R_BAD_DATA_LENGTH-unused.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0029-QUIC-SSLerr-ERR_raise-ERR_LIB_SSL.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0030-QUIC-Add-compile-run-time-checking-for-QUIC.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0031-QUIC-Add-early-data-support.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0032-QUIC-Make-SSL_provide_quic_data-accept-0-length-data.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0033-QUIC-Process-multiple-post-handshake-messages-in-a-s.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0034-QUIC-Fix-CI.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0035-QUIC-Break-up-header-body-processing.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0036-QUIC-Don-t-muck-with-FIPS-checksums.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0037-QUIC-Update-RFC-references.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0038-QUIC-revert-white-space-change.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0039-QUIC-use-SSL_IS_QUIC-in-more-places.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0040-QUIC-Error-when-non-empty-session_id-in-CH.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0041-QUIC-Update-SSL_clear-to-clear-quic-data.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0042-QUIC-Better-SSL_clear.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0043-QUIC-Fix-extension-test.patch
    curl -sO https://raw.githubusercontent.com/sbwml/r4s_build_script/master/openwrt/patch/openssl/quic/0044-QUIC-Update-metadata-version.patch
popd
  
if [[ "$OWRT_URL" == "https://github.com/DoveKi/immortalwrt-nss.git" || "$OWRT_URL" == "https://github.com/Teacher-c/immortalwrt-NSS.git" ]]; then
  
  #添加nss占用信息显示
  #rm -rf feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
  #rm -rf feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
  #cp -rf $GITHUB_WORKSPACE/general/AX6/nss-status/immortal/10_system.js feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/
  #cp -rf $GITHUB_WORKSPACE/general/AX6/nss-status/immortal/luci-mod-status.json feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/
  echo 'skip'
  
fi

if [[ "$OWRT_URL" == "https://github.com/Teacher-c/openwrt-NSS.git" ]]; then
  
  #添加CPU,温度，以及nss占用信息显示
  #rm -rf feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
  #rm -rf feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
  #rm -rf feeds/luci/modules/luci-base/root/usr/share/rpcd/ucode/luci
  #cp -rf $GITHUB_WORKSPACE/general/AX6/nss-status/immortal/10_system.js feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/
  #cp -rf $GITHUB_WORKSPACE/general/AX6/nss-status/immortal/luci-mod-status.json feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/
  #cp -rf $GITHUB_WORKSPACE/general/AX6/nss-status/luci_file_from_immortal/luci feeds/luci/modules/luci-base/root/usr/share/rpcd/ucode/
  echo 'skip'
  
fi

if [[ "$OWRT_URL" == "https://github.com/immortalwrt/immortalwrt.git" ]]; then
  
  #添加turboacc
  curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
            
fi

#自定义单独下载仓库插件函数
function git_sparse_package(){
    # 参数1是分支名,参数2是库地址。所有文件下载到owrt/package/Add_package
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    trap 'rm -rf "$tmpdir"' EXIT
    branch="$1" curl="$2" && shift 2
    rootdir="$PWD"
    localdir=package/Add_package
    [ -d "$localdir" ] || mkdir -p "$localdir"
    tmpdir="$(mktemp -d)" || exit 1
    git clone -b "$branch" --depth 1 --filter=blob:none --sparse "$curl" "$tmpdir"
    cd "$tmpdir"
    git sparse-checkout init --cone
    git sparse-checkout set "$@"
    mv -f "$@" "$rootdir"/"$localdir" && cd "$rootdir"
}

#添加immortal对应插件

if [[ "$OWRT_URL" == "https://github.com/padavanonly/immortalwrt.git" ]]; then
  
  git_sparse_package master https://github.com/immortalwrt/packages net/zerotier
  rm -rf $(find feeds/packages/net/ -type d -regex ".*\(zerotier\).*")
  mv package/Add_package/zerotier feeds/packages/net/
  
fi

#修改默认主题
sed -i "s/luci-theme-bootstrap/luci-theme-$OWRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
#修改默认IP地址
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$OWRT_IP/g" ./package/base-files/files/bin/config_generate
#修改默认主机名
sed -i "s/hostname='.*'/hostname='$OWRT_NAME'/g" ./package/base-files/files/bin/config_generate
#修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" ./package/base-files/files/bin/config_generate
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
if [[ $OWRT_URL == *"lede"* ]] ; then
  #修改默认时间格式
  sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S %A")/g' $(find ./package/*/autocore/files/ -type f -name "index.htm")
fi
