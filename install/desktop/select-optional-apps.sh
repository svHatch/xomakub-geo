if [[ -v XOMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$XOMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$XOMAKUB_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
