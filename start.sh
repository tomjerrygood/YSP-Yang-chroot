#!/system/bin/sh
trap '' HUP INT TERM
cd /data/local/iptv-rust
killall -9 ysp-live-android ysp-web-android iptv-rust iptv-rust-arm YSP-Yang 2>/dev/null
sleep 1
/data/local/iptv-rust/YSP-Yang --host 0.0.0.0 --port 8787 --channels /data/local/iptv-rust/channels.yaml --verbose > /data/local/iptv-rust/YSP-Yang.log 2>&1 &
