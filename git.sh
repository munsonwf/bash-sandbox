echo "\nHARNESS\n"
echo " /\\ \n/\\/\\ \n\\/\\/\n \\/"
echo "\nGIT CHECKER\n"


# Setup Functions
echo_title () {
    echo ">> $1 <<"
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

# Check for existing keys
check_command () {
    echo $(command $1) && echo $2 || echo $3
}

check_and_grep () {
    echo $1
    $(command $1) | grep $2 && echo $3 || echo $4
}

# check_command "docker ps | grep CONTAINER" "Good" "Bad"

echo "S"
ls -al ~/.ssh
echo "E"

check_and_grep "ls ~/.ssh" "id_rsa.pub" "RSA key detected" "No RSA key found in ~/.ssh" 
check_and_grep "ls -al ~/.ssh" "id_ecdsa.pub" "ECDSA key detected" "No ECDSA key found in ~/.ssh" 
check_and_grep "ls -al ~/.ssh" "id_ed25519.pub" "ED25519 key detected" "No ED25519 key found in ~/.ssh" 


command ls -al ~/.ssh | grep id_rsa.pub && echo "RSA SSH exists" || echo "No RSA SSH key detected"
command ls -al ~/.ssh | grep id_ecdsa.pub && echo "ECDSA SSH exists" || echo "No ECDSA SSH key detected"
command ls -al ~/.ssh | grep id_ed25519.pub && echo "ED25519 SSH exists" || echo "No ED25519 SSH key detected"

# Check SSH connection to GitHub
echo "Checking SSH connection..."
ssh -T git@github.com

echo "\nTest completed."