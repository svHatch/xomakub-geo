choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	sed -i "s/^size = .*$/size = $choice/g" ~/.config/terminal/font-size.toml
	source $XOMAKUB_PATH/bin/xomakub-geo-sub/font-size.sh
else
	source $XOMAKUB_PATH/bin/xomakub-geo-sub/font.sh
fi
