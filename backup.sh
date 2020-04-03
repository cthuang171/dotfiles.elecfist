echo "-----Backup process for rc and config files-----"
echo ">>>rc files"
cp ~/.bashrc ~/.dmrc ~/.gitconfig ~/.mpdconf ~/.profile ~/.tmux.conf home/thieenq
echo ">>>.config files"
cp -r ~/.config/htop/ .config/
echo ">htop...done"
cp -r ~/.config/nvim/ .config/
echo ">nvim...done"
cp -r ~/.config/ranger .config/
echo ">ranger...done"
cp -r ~/.config/Thunar/ .config/
echo ">thunar...done"
cp -r ~/.config/xfce4/ .config/
echo ">xfce4...done"
cp -r ~/.ncmpcpp/config home/thieenq/.ncmpcpp/
echo ">ncmcpp...done"
