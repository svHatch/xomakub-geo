cat <<EOF >~/.local/share/applications/About.desktop
[Desktop Entry]
Version=1.0
Name=About
Comment=System information from Fastfetch
Exec=xfce4-terminal --title=About -e bash -c 'fastfetch; read -n 1 -s'
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/xomakub-geo/applications/icons/xubuntu_logo_black.png
Categories=GTK;
StartupNotify=false
EOF
