# Archlinuxをインストールする

インストールをするのに必要な環境は
archlinuxの起動している環境。

方法はいくつか。

- すでにインストールされているPCを使う
- CDをダウンロードしてきて、ディスクからブートする

今回は、すでにインストールされているPCを使います。

```sh
lsblk -af

vimshell% lsblk -af
NAME   FSTYPE  LABEL             UUID                                 MOUNTPOINT
sdf                                                                   
sdd                                                                   
├─sdd2 vfat    EFI               DAF4-F83D                            
├─sdd3 ext4    ARCHROOT          fe8eb1ea-459f-4d9e-bfeb-5b3c2671eeeb 
└─sdd1 ntfs    EXPORT            7D404D7E38957970                     
sdb                                                                   
├─sdb9                                                                
└─sdb1 zfs_mem kurari-zpool      3972358311992935025                  
sde                                                                   
├─sde2 ext4    ARCHROOT          8f082939-b01e-4bfe-a6ca-1848eda87795 
└─sde1 vfat    EFI               B5F1-2CE1                            
sdc                                                                   
└─sdc1 ntfs    DATA_SINCE_20151117
  5A3E46387ECCF7F7                     
sda                                                                   
├─sda2 vfat    EFI               4A98-0104                            /boot
├─sda3 ext4    ROOT              b7c13e26-6814-46dc-8479-30246cef4b9f /
└─sda1 swap                      7a82d18e-00cf-4a9e-9b41-6622c8c898ad [SWAP]
```
/dev/sdfを使います。
パーティションを切る
```sh
sudo gdisk  /dev/sdf

GPT fdisk (gdisk) version 1.0.1

Partition table scan:
  MBR: protective
  BSD: not present
  APM: not present
  GPT: present

Found valid GPT with protective MBR; using GPT.

Command (? for help): o
This option deletes all partitions and creates a new protective MBR.
Proceed? (Y/N): y

Command (? for help): n
Partition number (1-128, default 1): 
First sector (34-61282597, default = 2048) or {+-}size{KMGTP}: 
Last sector (2048-61282597, default = 61282597) or {+-}size{KMGTP}: +512M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): EF00
Changed type of partition to 'EFI System'

Command (? for help): n
Partition number (2-128, default 2): 
First sector (34-61282597, default = 1050624) or {+-}size{KMGTP}: 
Last sector (1050624-61282597, default = 61282597) or {+-}size{KMGTP}: 
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 
Changed type of partition to 'Linux filesystem'

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): y
OK; writing new GUID partition table (GPT) to /dev/sdf.
The operation has completed successfully.
```
ファイルシステム構築
```sh
lsblk -af

sudo mkfs.vfat -F32 -n BOOT /dev/sdf1
sudo mkfs.ext4 -L ARCH /dev/sdf2
# マウント
sudo mount /dev/sdf2 /mnt
sudo mkdir /mnt/boot
sudo mount /dev/sdf1 /mnt/boot
df -lh
/dev/sdf2         29G   45M   27G    1% /mnt
/dev/sdf1        511M  4.0K  511M    1% /mnt/boot
# 基礎システム構築
sudo pacstrap /mnt base make
genfstab -U -p /mnt  | sudo tee /mnt/etc/fstab
sudo git clone http://github.com/hajimemat/archlinux-setup /mnt/root/archlinux-setup
sudo ls -la /mnt/root/archlinux-setup

vimshell% sudo ls -la /mnt/root/archlinux-setup
合計 48
drwxr-xr-x 9 root root 4096  1月  4 04:18 .
drwxr-x--- 4 root root 4096  1月  4 04:18 ..
drwxr-xr-x 8 root root 4096  1月  4 04:18 .git
-rw-r--r-- 1 root root  221  1月  4 04:18 Makefile
-rw-r--r-- 1 root root   73  1月  4 04:18 README.md
drwxr-xr-x 2 root root 4096  1月  4 04:18 app
-rw-r--r-- 1 root root  181  1月  4 04:18 config.mk
drwxr-xr-x 3 root root 4096  1月  4 04:18 files
drwxr-xr-x 2 root root 4096  1月  4 04:18 install
drwxr-xr-x 2 root root 4096  1月  4 04:18 lang
drwxr-xr-x 2 root root 4096  1月  4 04:18 make
drwxr-xr-x 2 root root 4096  1月  4 04:18 setup
```
chrootを使って、マウント先で作業
```sh
sudo arch-chroot /mnt
# arch-chrooの中で
cd /root/archlinux-setup
vi config.mk # 設定変更
make -f install/pacman.mk
make -f install/sudo.mk
make -f install/user.mk
make -f install/yaourt.mk
make -f install/efi.mk
# 基本的なツール
make -f app/base.mk
# ネットワークの設定
make -f setup/networking.mk
# 言語設定
make -f lang/en.mk
make -f lang/ja.mk
# desktop
make -f app/desktop.mk
make -f app/desktop-ja.mk
make -f app/i3-gnome.mk
# マルチメディア
make -f app/multimedia.mk
```
