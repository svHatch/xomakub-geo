# Install default databases
if [[ -v XOMAKUB_FIRST_RUN_DBS ]]; then
	dbs=$XOMAKUB_FIRST_RUN_DBS
else
	AVAILABLE_DBS=("MySQL" "PostgreSQL")
	dbs=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --height 5 --header "Select databases (runs in Docker)")
fi

if [[ -n "$dbs" ]]; then
	for db in $dbs; do
		case $db in
		MySQL)
			sudo docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
			;;
		PostgreSQL)
			sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
			;;
		esac
	done
fi
