echo " /\\ \n/\\/\\ \n\\/\\/ 🚀 harness\n \\/    FOXY"

# INSTRUCTIONS

echo "\nOPTIONS
1. Run Dr. Canary
2. Run Git Checker 
3. Run Rapid Installer
4. Generate SSH keys
5. Connect to VPN (SFO)
6. Disconnect from VPN (SFO)

ENTER a number from the above list:"

read INPUT_NUM

# if [[ -z $1 ]]; then echo "\nSelect a number from above."; fi

if [[ $INPUT_NUM == '1' ]]
then
    ./check.sh
fi

if [[ $INPUT_NUM == '2' ]]
then
    ./git.sh
fi
if [[ $INPUT_NUM == '3' ]]
then
    ./installer.sh
fi

if [[ $INPUT_NUM == '4' ]]
then 
    echo "Enter email address:"
    read EMAIL_ADDR
    echo "Creating email for:" $EMAIL_ADDR
    echo "\nPress ENTER to accept the defaults below...\n"
    sleep 2
    ssh-keygen -t ed25519 -C $EMAIL_ADDR

    # copy key
    pbcopy < ~/.ssh/id_ed25519.pub
    echo 📋 COPIED the SSH key to the clipboard.
fi

if [[ $INPUT_NUM == '5' ]]
then
    echo "Enabling VPN..."
    networksetup -connectpppoeservice "VPN SFO"
fi

if [[ $INPUT_NUM == '6' ]]
then
    echo "Disabling VPN..."
    networksetup -disconnectpppoeservice "VPN SFO"
fi

echo "Foxy finished."