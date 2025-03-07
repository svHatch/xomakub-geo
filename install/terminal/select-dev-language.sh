# Install default programming languages
if [[ -v XOMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$XOMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Node.js" "Go" "Python" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Node.js)
      mise use --global node@lts
      ;;
    Go)
      mise use --global go@latest
      ;;
    Python)
      mise use --global python@latest
      ;;
    Rust)
      bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
      ;;
    Java)
      mise use --global java@latest
      ;;
    esac
  done
fi
