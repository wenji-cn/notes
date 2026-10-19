# 1、系统备份
## tar备份
### 1、确定tar是否安装
    tar --version
    #安装tar
        sudo apt update
        sudo apt install tar -y
### 2、创建排除列表文件
    sudo vim /root/tar-exclude.txt
        +/porc
        +/sys
        +/dev
        +/tmp
        +/run
        +/mnt
        +/media
        +/lost+found
        +/backup
        +/var/tmp
        +/var/cache/apt/archives
### 3、执行完整备份
    sudo tar -cvpzf /mnt/backup/debian13_backup_$(date +%F).tar.gz --exclude-from=/root/tar-exclude.txt --acls --xattrs /
### 4、查看和验证备份
    #列出归档内容
        tar -tzf /mnt/backup/debian13_backup_$(date +%F).tar.gz | head
    #查看归档大小
        ls -lh /mnt/backup/debian13_backup_$(date +%F).tar.gz

# 2、系统恢复
### debian live CD启动，挂载原根分区到/mnt
    sudo mount /dev/sda1 /mnt
### 解压备份到/mnt
    sudo tar -xvpzf /mnt/backup/debian13_backup_$(date +%F).tar.gz -C /mnt
### 创建被排除的目录
    sudo mkdir -p /mnt/proc /mnt/sys /mnt/dev /mnt/tmp /mnt/run /mnt/mnt /mnt/media /mnt/lost+found
### 挂载虚拟文件系统并chroot
    sudo mount --bind /dev /mnt/dev
    sudo mount --bind /proc /mnt/proc
    sudo mount --bind /sys /mnt/sys
    sudo chroot /mnt
### 重新安装GRUD
    grub-install /dev/sda1
    update-grub
    exit
### 卸载并重启
    sudo umount -R /mnt
    sudo reboot


