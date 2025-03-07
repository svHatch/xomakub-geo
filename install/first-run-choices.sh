# Only ask for default desktop app choices when running Xfce
if [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
  OPTIONAL_APPS=("1password")
  DEFAULT_OPTIONAL_APPS='1password'
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')
fi

AVAILABLE_LANGUAGES=("Node.js" "Go" "Python" "Rust" "Java")
SELECTED_LANGUAGES="Python","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "PostgreSQL")
SELECTED_DBS="MySQL,PostgreSQL"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
