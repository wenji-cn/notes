## 1、安装配置suckless tool
### 安装编译配置
    sudo apt update
    sudo apt install -y build-essential xorg libx11-dev libxinerama-dev libxft-dev git
        注  #build-essential:编译工具C/C++等
            #xorg:x窗口系统
            #lib*-dev:编译dwm必需的开发库
### 安装dwm(窗口管理器) tty:startx
    git clone https://git.suckless.org/dwm
    cd dwm
    sudo make clean install
    #编辑~/.xinitrc,用startx启用dwm
        +exec dwm
### 安装dmenu(程序启动器)   MOD+p
    git clone https://git.suckless.org/dmenu
    cd dmenu
    sudo make clean install
### 安装st(终端模拟器)  MOD+shift+enter
    git clone https://git.suckless.org/st
    cd st
    sudo make clean install
### 安装surf(极简浏览器)    dmenu:surf address
    git clone https://git.suckless.org/surf
    cd surf
    sudo make clean install