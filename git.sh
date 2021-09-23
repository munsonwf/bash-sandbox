echo " /\\ \n/\\/\\ \n\\/\\/ 🚀 harness\n \\/  GIT CHECKER"

# Setup Functions
echo_title () {
    echo "\n>> $1 <<"
}

# Check for git install, otherwise exit with code 1
# echo "Checking git install..."
echo_title "Checking git install..."
INSTALL_LOCATION=$(command -v git)
if [[ -n "$INSTALL_LOCATION" ]]; then
    echo "Install location: $INSTALL_LOCATION"
else
    echo "Not installed. EXITING."
    exit 1
fi

echo "Version: $(git --version)"

# CHECK CONNECTIVITY
echo_title "Checking GitHub connectivity..."
# check for existing SSH keys
command ls ~/.ssh | grep id_rsa.pub 1>/dev/null && echo "RSA key found." || echo "No RSA key found in ~/.ssh"
command ls ~/.ssh | grep id_ecdsa.pub 1>/dev/null && echo "ECDSA key found." || echo "No ECDSA key found in ~/.ssh"
command ls ~/.ssh | grep id_ed25519.pub 1>/dev/null && echo "ED25519 key found." || echo "No ED25519 key found in ~/.ssh"

# Check SSH connection to GitHub
echo_title "Checking SSH connection..."
ssh -T git@github.com

# Git Config
echo_title "Checking global git config..."
git config --list --global
echo_title "Checking current directory's git config..."
git config --list

echo "\nTest completed."

#
#
# GRAVEYARD
#
#

# Check for existing keys
# check_command () {
#     echo $(command $1) && echo $2 || echo $3
# }
check_command () {
    echo "Running CMD:\"$*\""
    echo "Running CMD:\"$1\""
    eval $1
    # echo $(command $1) && echo $2 || echo $3
}

check_and_grep () {
    echo $1
    $(command $1) | grep $2 && echo $3 || echo $4
}


