## X-Road server configs

This folder contains server configuration files for X-Road servers.

### Common server configuration files
* [Xroad-autologin](xroad-autologin)
    > Autologin for X-Road server signing key

### Central server configurations files
* [Make_backup_cs.sh](cs/make_backup_cs.sh)
    > Generate lxd xroad central server backup
* [Restore_backup_cs.sh](cs/restore_backup_cs.sh)
    > Restore lxd xroad central server backup
* [Softreset.sh](cs/softreset.sh)
    > Lxd xroad central server softreset that uses repository packages.
* [Xroad-center](cs/xroad-center)
    > Lower timeout

### Security server configurations files
* [Make_backup_ss.sh](ss/make_backup_ss.sh)
    > Generate lxd xroad security server backup.
* [Restore_backup_ss.sh](ss/restore_backup_ss.sh)
    > Restore lxd xroad security server backup.
* [Softreset.sh](ss/softreset.sh)
    > Lxd xroad security server softreset that uses repository packages.