echo "\nHARNESS\n"
echo " /\\ \n/\\/\\ \n\\/\\/\n \\/"
echo "\nGIT CHECKER\n"

echo "Checking git install..."


# Check for git install, otherwise exit with code 1
INSTALL_LOCATION=$(command -v git)
if [[ -n "$INSTALL_LOCATION" ]]; then
    echo "Install location: $INSTALL_LOCATION"
else
    echo "Not installed. EXITING."
    exit 1
fi

echo "Version: $(git --version)"

echo "Checking SSH connection..."
ssh -T git@github.com

echo "Test completed."