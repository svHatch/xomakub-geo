set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	if ! $(fc-list | grep -i "$font_name" >/dev/null); then
		cd /tmp
		wget -O "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"
		cp "$file_name"/*."$file_type" ~/.local/share/fonts
		rm -rf "$file_name.zip" "$file_name"
		fc-cache
		cd -
		clear
		source $XOMAKUB_PATH/ascii.sh
	fi

	gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
	cp "$XOMAKUB_PATH/configs/terminal/fonts/$file_name.toml" ~/.config/terminal/font.toml
	sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json
}

set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
source $XOMAKUB_PATH/bin/xomakub-geo-sub/font-size.sh

source $XOMAKUB_PATH/bin/xomakub-geo-sub/menu.sh
