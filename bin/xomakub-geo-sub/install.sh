CHOICES=(
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "1password         Manage your passwords securely across devices"
  "Audacity          Record and edit audio"
  "OBS Studio        Record screencasts with inputs from both display + webcam"
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
  *) INSTALLER_FILE="$XOMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $XOMAKUB_PATH/bin/omakub
