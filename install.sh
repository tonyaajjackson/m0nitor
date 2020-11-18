cachepath="/var/cache/m0nitor/"

if [[ $1 == "--uninstall" ]]; then
    echo "Removing /var/cache/m0nitor/"
    sudo rm -r /var/cache/m0nitor/
    echo "Removing /usr/bin/m0nitor"
    sudo rm /usr/bin/m0nitor
    echo "Uninstall finished"
    exit 0
fi

if ! [[ -d $cachepath ]]; then
    echo "Creating $cachepath"
    sudo mkdir /var/cache/m0nitor/
    echo "chowning $cachepath to user:$USER"
    sudo chown $USER /var/cache/m0nitor
    echo "Copying m0nitor to /usr/bin"
    sudo cp ./m0nitor /usr/bin/m0nitor
    sudo chmod +x /usr/bin/m0nitor
fi

uname=$(ls -ld $cachepath)
if [[ -d $cachepath ]] && [[ $uname == $USER ]] && [[ -f "/usr/bin/m0nitor" ]]; then
    echo "Setup was successful"
fi