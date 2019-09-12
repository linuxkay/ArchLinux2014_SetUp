#/bin/sh

mkdir {Documents,Downloads,Pictures,Musics,Workspace,Videos}

sudo pacman -S bash-completion gnome wget lsof dnsutils
cp /etc/skel/.xinitrc ~/
sudo systemctl enable gdm.service
sudo pacman -S gedit openssh openvpn terminator zip unzip p7zip cm firefox whois conky wol aircrack-ng nmap powertop inkscape gimp blender pidgin filezilla openshot audacity ettercap flashplugin zsh evince gparted3g dosfstools ufw arp-scan xf86-input-synaptics  minitube qemu transmissiosoundconverter remmina smplayer rdesktop alsa-utils acpid fcitx fcitx-mozccitx fcitx-gtk2 fcitx-gtk3  poppler-data virtualbox  system-config-printergutenprint

##fcitx settings
echo 'export XMODIFIERS="@im=fcitx"' > ~/.xprofile
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile


#zsh settings
#cp /mnt/home/user/Documents/.zshrc ~/.zshrc

#virtualbox settings
sudo gpasswd -a $USER vboxusers

#laptop-modetools usbauto
#sudo sed -i s/'CONTROL_USB_AUTOSUSPEND="auto"'/'CONTROL_USB_AUTOSUSPEND="0"'/g /etc/laptop-mode/conf.d/usb-autosuspend.conf

#yaourt installation
cd /tmp
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si
cd ..

#fonts
#cp -r /mnt/usr/share/fonts ~/.fonts
#sudo fc-cache -fv ~/.fonts

##systemctl
sudo ufw default deny
sudo ufw enable
sudo systemctl enable ufw
sudo systemctl disable dhcpcd
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
#sudo systemctl enable laptop-mode.service
sudo modprobe xhci_hcd
