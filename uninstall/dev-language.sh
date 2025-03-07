# Uninstall default programming languages
if [[ -v XOMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$XOMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Node.js" "Go" "Python" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages to uninstall")
fi

if [[ -n $languages ]]; then
  for language in $languages; do
    case $language in
    Node.js)
      mise uninstall node@lts
      ;;
    Go)
      mise uninstall go@latest
      ;;
    Python)
      mise uninstall python@latest
      ;;
    Rust)
      rustup self uninstall -y
      ;;
    Java)
      mise uninnstall java@latest
      ;;
    esac
  done
fi
