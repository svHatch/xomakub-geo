THEME="kanagawa" # Best theme

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $XOMAKUB_PATH/themes/$THEME/terminal.toml ~/.config/terminal/theme.toml
  cp $XOMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  cp $XOMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  source $XOMAKUB_PATH/themes/$THEME/gnome.sh
  source $XOMAKUB_PATH/themes/$THEME/tophat.sh

  # Forgo setting the Chrome theme until we might find a less disruptive way of doing it.
  # Having to quit Chrome, and all Chrome-based apps, is too much of an inposition.
  # source $XOMAKUB_PATH/themes/$THEME/chrome.sh
fi

source $XOMAKUB_PATH/bin/xomakub-geo-sub/menu.sh
