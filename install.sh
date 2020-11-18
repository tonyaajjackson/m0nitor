cachepath="/var/cache/m0nitor/"
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