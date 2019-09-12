#/bin/sh

mkdir {Documents,Downloads,Pictures,Musics,Workspace,Videos}

sudo pacman -S bash-completion kdebase kde-l10n-ja phonon-vlc wget lsof dnsutils
cp /etc/skel/.xinitrc ~/
sudo systemctl enable kdm.service
sudo pacman -S openssh openvpn terminator zip unzip p7zip chromium firefox whois conky wol aircrack-ng nmap powertop inkscape gimp blender xsane pidgin filezilla openshot audacity ettercap flashplugin zsh evince gparted ntfs-3g dosfstools ufw arp-scan xf86-input-synaptics kdemultimedia-kmix kdeplasma-applets-networkmanagement minitube bluedevil kdegraphics-gwenview laptop-mode-tools hdparm kdeutils-kcalc kdegraphics-ksnapshot qemu transmission-qt soundconverter remmina smplayer rdesktop alsa-utils acpid fcitx fcitx-mozc kcm-fcitx kdeplasma-addons-applets-kimpanel fcitx-gtk2 fcitx-gtk3  poppler-data virtualbox kdeutils-print-manager system-config-printer cups gutenprint
##fcitx settings
echo 'export XMODIFIERS="@im=fcitx"' > ~/.xprofile
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile


#zsh settings
cp /mnt/home/user/Documents/.zshrc ~/.zshrc

#virtualbox settings
sudo gpasswd -a $USER vboxusers

#laptop-modetools usbauto
sudo sed -i s/'CONTROL_USB_AUTOSUSPEND="auto"'/'CONTROL_USB_AUTOSUSPEND="0"'/g /etc/laptop-mode/conf.d/usb-autosuspend.conf

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
cp -r /mnt/usr/share/fonts ~/.fonts
sudo fc-cache -fv ~/.fonts

##systemctl
sudo ufw default deny
sudo ufw enable
sudo systemctl enable ufw
sudo systemctl disable dhcpcd
sudo systemctl enable NetworkManager.service
sudo systemctl enable bluetooth.service
sudo systemctl enable laptop-mode.service
sudo modprobe xhci_hcd