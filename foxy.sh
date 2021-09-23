echo " /\\ \n/\\/\\ \n\\/\\/ 🚀 harness\n \\/    FOXY"

# INSTRUCTIONS

echo "\nOPTIONS
1. Run Dr. Canary
2. Run Git Checker 
3. Generate SSH keys

ENTER a number from the above list:"

read INPUT_NUM

if [[ -z $1 ]]; then echo "\nSelect a number from above."; fi

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
    echo "Enter email address:"
    read EMAIL_ADDR
    echo "Creating email for " $EMAIL_ADDR
    ssh-keygen -t ed25519 -C $EMAIL_ADDR

    # copy key
    pbcopy < ~/.ssh/id_ed25519.pub
    echo 📋 COPIED the SSH key to the clipboard.
fi

