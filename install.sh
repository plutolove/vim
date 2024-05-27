mv ~/.vim ~/.vim_backup
mv ~/.vimrc ~/.vimrc_backup

cp -r .vim ~/
cp .vimrc ~/

# 检查 vim-plug 是否安装，如未安装则下载安装
if [ ! -f "~/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 用 vim 在后台执行 :PlugInstall 安装插件
vim +PlugInstall +qa

# 再次启动 Vim，这会加载新安装的插件和新配置
vim
