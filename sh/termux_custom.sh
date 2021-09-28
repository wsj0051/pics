#!/data/data/com.termux/files/usr/bin/bash
name="wsj0051"
mail="wsj0051@163.com"
echo "开始自定义安装..."
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
apt update && apt upgrade
pkg install vim curl wget git unzip unrar
mkdir $HOME/.termux
echo "extra-keys = [ \
    ['ESC','<','>','BACKSLASH','=','^','$','()','{}','[]','ENTER'], \
    ['TAB','&',';','/','~','%','*','HOME','UP','END','PGUP'], \
    ['CTRL','FN','ALT','|','-','+','QUOTE','LEFT','DOWN','RIGHT','PGDN'] \
    ]
" >> $HOME/.termux/termux.properties
git config --global user.name  $name
git config --global user.email $mail
git config --global color.ui true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
pkg install openssh
ssh-keygen -t rsa -C $mail
npm install -g http-server
echo "完成自定义安装，请重新启动"
