
# GARDENA smart system gateway community packages

## Installing the generic MQTT client

```
echo "src/gz uri-community https://pub.easyb.ch/sg/8.8.1/ipk/mips32r2el-24kc-nf" >> /etc/opkg/base-feeds.conf
opkg update
opkg install sg-mqtt-client

cat << EOF > /etc/sg_mqtt_client.conf
[mqtt_broker]
host = my-mqtt-broker.lan
EOF

systemctl start sg-mqtt-client

# Persist package across updates
echo /etc/opkg/base-feeds.conf >> /etc/sysupgrade.conf
fw_setenv dev_extra_pkgs sg-mqtt-client
```

## Building the recipes

```
pip install kas
SSTATE_DIR=~/.cache/yocto/sstate-cache kas build mt7688.yml
```
