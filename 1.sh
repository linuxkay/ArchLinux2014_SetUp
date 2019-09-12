#/bin/sh
pacman -S xf86-video-intel xorg-server xorg-xinit xorg-apps xterm sudo
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash user
#trackpoint settings
echo 'Section "InputClass"' > /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Identifier "Trackpoint Wheel Emulation"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf 
echo 'MatchProduct "TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad TrackPoint|ThinkPad USB Keyboard with TrackPoint|USB Trackpoint pointing device"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'MatchDevicePath "/dev/input/event*"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Option' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"EmulateWheel"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"true"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Option' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"EmulateWheelButton" "2"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Option' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"Emulate3Buttons" "false"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Option' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"XAxisMapping"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"6 7"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'Option' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"YAxisMapping"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo '"4 5"' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
echo 'EndSection' >> /etc/X11/xorg.conf.d/20-thinkpad.conf
#trackpoint speed
echo 'SUBSYSTEM=="serio", DRIVERS=="psmouse", WAIT_FOR="/sys/devices/platform/i8042/serio1/serio2/sensitivity", ATTR{sensitivity}="170", ATTR{speed}="250"' > /etc/udev/rules.d/trackpoint.rules
#virtualbox
echo vboxdrv > /etc/modules-load.d/virtualbox.conf
echo vboxnetflt >> /etc/modules-load.d/virtualbox.conf
#dhcp sppedup settings
echo noarp >> /etc/dhcpcd.conf
#thinkfan settings
echo 'options thinkpad_acpi fan_control=1' > /etc/modprobe.d/modprobe.conf
echo 'sensor /sys/devices/virtual/hwmon/hwmon0/temp1_input' > /etc/thinkfan.conf
echo >> /etc/thinkfan.conf
echo "(0,     0,      64)" >> /etc/thinkfan.conf
echo "(1,     55,     66)" >> /etc/thinkfan.conf
echo "(2,     65,     68)" >> /etc/thinkfan.conf
echo "(4,     67,     70)" >> /etc/thinkfan.conf
echo "(6,     69,     72)" >> /etc/thinkfan.conf
echo "(7,     71,     32767)" >> /etc/thinkfan.conf