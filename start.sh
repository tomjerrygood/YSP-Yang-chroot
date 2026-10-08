#!/system/bin/sh
cd /data/local/iptv-rust
killall YSP-Yang 2>/dev/null
nohup /data/local/iptv-rust/YSP-Yang --host 0.0.0.0 --port 8787 --channels /data/local/iptv-rust/channels.yaml --verbose > /data/local/iptv-rust/YSP-Yang.log 2>&1 &
