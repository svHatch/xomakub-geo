CHOICES=(
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "1password         Manage your passwords securely across devices"
  "Audacity          Record and edit audio"
  "ASDControl        Set brightness on Apple Studio and XDR displays via cli"
  "Brave             Chrome-based browser with built-in ad blocking"
  "Cursor            The AI Code Editor"
  "Doom Emacs        Emacs framework with curated list of packages"
  "Dropbox           Sync files across computers with ease"
  "Mainline Kernels  Install newer Linux kernels than Ubuntu defaults"
  "OBS Studio        Record screencasts with inputs from both display + webcam"
  "Ollama            Run LLMs, like Meta's Llama3, locally"
  "Steam             Play games from Valve's store"
  "VirtualBox        Virtual machines to run Windows/Linux"
  "Zed               Fast all-purpose editor"
  "Zoom              Attend and host video chat meetings"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 22 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $XOMAKUB_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-language") INSTALLER_FILE="$XOMAKUB_PATH/install/terminal/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$XOMAKUB_PATH/install/terminal/select-dev-storage.sh" ;;
  "ollama") INSTALLER_FILE="$XOMAKUB_PATH/install/terminal/optional/app-ollama.sh" ;;
  *) INSTALLER_FILE="$XOMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $XOMAKUB_PATH/bin/omakub
