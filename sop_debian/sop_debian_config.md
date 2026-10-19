# debian初始配置（纯简系统不含桌面）
## 1、安装sudo，配置用户权限
    apt install sudo
    sudo visudo #编辑权限
        #设置权限
        +username ALL=(ALL:ALL) ALL

## 2、修改tty终端字体
    sudo vim /etc/defualt/console-setup

## 3、安装中文输入法
    sudo apt update
    sudo apt install fcitx5 fcitx5-chinese-addons fcitx5-config-qt
    #vim ~/.xinitrc
        #配置fcitx
        +export GTK_IM_MODULE=fcitx
        +export QT_IM_MODULE=fcitx
        +export XMODIFIERS=@im=fcitx
        #启动fcitx
        +fcitx5 &
    #配置启用指定fcitx5：im-config -n fcitx5

## 4、挂载u盘
### 查看设备名
    lsblk
### 创建挂载点并挂载
    sudo mkdir -p /mnt/usb
    sudo mount /dev/sda1 /mnt/usb
        注：NTFS或exFAT格式硬盘，需要安装对应驱动
### 验证和使用
    ls /mnt/usb #查看文件
    df -h #确认挂载状态
### 安全弹出
    cd ~ #退出挂载目录
    sudo umount /mnt/usb

## 5、复制粘贴文件
    cp -r 源文件夹 目标目录/
    #保留权限、时间、链接等属性：cp -a 源文件 目标目录/
    #需要管理员权限：sudo cp -a 源文件 目标目录/
    #复制后属主变为root，改为当前用户：sudo chown -R $USER:$USER 目标路径/
    #大文件夹：rsync -avh --progress 源文件夹 目标目录/

## 6、文件重命名
    mv 旧文件名 新文件名
    #权限不够时加sudo
    #路径有空格加引号
    #批量重命名：for d in */; do mv "$d" "${d/old/new/}"; done

## 7、删除文件夹
    #删除空文件夹：rmdir 文件夹名
    #删除非空文件夹：rm -r 文件夹名
    #强制删除：rm -rf 文件夹名
    #删除时显示进度：rm -rv 文件夹名
    #回收站机制：
        sudo apt install trash-cli
        trash-put 文件夹名

## 8、调节音量（纯 ALSA（使用 amixer））
    调高 5%：amixer -q sset Master 5%+
    调低 5%：amixer -q sset Master 5%-
    静音/取消静音：amixer -q sset Master toggle
    查看当前音量：amixer get Master

## 9、连接wifi（使用 NetworkManager）
    nmcli dev wifi connect "WiFi名称" password "密码"



