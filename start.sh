#!/system/bin/sh
trap '' HUP INT TERM
cd /data/local/iptv-rust

# Ensure /etc/resolv.conf exists for musl static binary DNS resolution in Android chroot
mkdir -p /etc
if [ ! -f /etc/resolv.conf ] || ! grep -q "nameserver" /etc/resolv.conf 2>/dev/null; then
    echo "nameserver 8.8.8.8" > /etc/resolv.conf
    echo "nameserver 1.1.1.1" >> /etc/resolv.conf
    echo "nameserver 114.114.114.114" >> /etc/resolv.conf
fi

killall -9 ysp-live-android ysp-web-android iptv-rust iptv-rust-arm YSP-Yang YSP-Yang-armv7 2>/dev/null
sleep 1
/data/local/iptv-rust/YSP-Yang-armv7 --host 0.0.0.0 --port 8787 --channels /data/local/iptv-rust/channels.yaml --verbose > /data/local/iptv-rust/YSP-Yang.log 2>&1 &
