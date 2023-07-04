
# GARDENA smart Gateway community packages

## Prerequisites

You will need shell access to your GARDENA smart Gateway. The instructions for
that can be found in the [smart-garden-gateway-public] repository.

[smart-garden-gateway-public]: https://github.com/husqvarnagroup/smart-garden-gateway-public#getting-access

## Using the community package feed

> [!NOTE]
> The version number in `/etc/base-feeds.conf` might need to be adapted after an
> OS upgrade. The version of the installed distribution can be determined by
> reading `/etc/os-release`.

### Adding the Opkg feed on 2nd gen. Gateway (art. no. 19005)

```
echo "src/gz uri-community https://pub.easyb.ch/sg/8.8.1/ipk/mips32r2el-24kc-nf" >> /etc/opkg/base-feeds.conf
```

### Adding the Opkg feed on 1st gen. Gateway (art. no. 19000)

```
echo "src/gz uri-community https://pub.easyb.ch/sg/8.8.1/ipk/armv5e" >> /etc/opkg/base-feeds.conf
```

### Persisting the package feed

Normally, such manual modifications are automatically removed during an OS
upgrade. This can be prevented as follows:
```
echo /etc/opkg/base-feeds.conf >> /etc/sysupgrade.conf
```

### Installing packages

To install e.g. the `sg-mqtt-client` package (visit the
[smart-garden-gateway-mqtt-client] repository for more information):
```
opkg update
opkg install sg-mqtt-client
```

[smart-garden-gateway-mqtt-client]: https://github.com/easybe/smart-garden-gateway-mqtt-client

### Persisting Opkg packages

In order for packages to be re-installed after an OS upgrade, the
`dev_extra_pkgs` U-Boot variable can be set:
```
fw_setenv dev_extra_pkgs sg-mqtt-client
```

Note that this modification will survive a factory reset and leave the Gateway
in an inconsistent state. The variable can be unset as follows:
```
fw_setenv dev_extra_pkgs
```

## Development

The packages can be manually built as follows:
```
pip install kas
SSTATE_DIR=~/.cache/yocto/sstate-cache kas build mt7688.yml
```
