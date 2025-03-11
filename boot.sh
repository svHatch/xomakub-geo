set -e

ascii_art='___  __.                         __.       ___.
\  \/  / ______    _____ _____  |  | ____ _\_ |__
 \    / /   |   \ /     \\__   \ |  |/ /  |  \ __ \
 /    \/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
/__/\__\_______  /__|_|  (____  /__|_ \____/|___  /
      \/        \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Xomakub-Geo is for fresh Xubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Xomakub-Geo..."
rm -rf ~/.local/share/xomakub-geo
git clone https://github.com/svHatch/xomakub-geo.git ~/.local/share/xomakub-geo >/dev/null
if [[ $XOMAKUB_REF != "master" ]]; then
	cd ~/.local/share/xomakub-geo
	git fetch origin "${XOMAKUB_REF:-stable}" && git checkout "${XOMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/xomakub-geo/install.sh
