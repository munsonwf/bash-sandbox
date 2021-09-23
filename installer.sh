echo "INSTALLER"

# HOMEBREW
command -v brew 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Brew installed"
else
    echo "Brew not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else 
        echo "\nHomebrew is the default installer. You must use Homebrew. EXITING."
        exit 1
    fi


fi

# NODE
command -v node 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Node installed"
else
    echo "Node not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install node; fi
fi

# DOCKER
command -v docker 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Docker installed"
else
    echo "Docker not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then echo "Install Docker via Docker Desktop: https://docs.docker.com/desktop/mac/install/"; fi
fi

# KUBECTL
command -v kubectl 1>/dev/null
if [[ $? == 0 ]]; then
    echo "kubectl installed"
else
    echo "kubectl not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install kubectl; fi
fi

# KUBECTX
command -v kubectx 1>/dev/null
if [[ $? == 0 ]]; then
    echo "kubectx installed"
else
    echo "kubectx not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install kubectx; fi
fi

# AWS CLI
command -v aws 1>/dev/null
if [[ $? == 0 ]]; then
    echo "AWS CLI installed"
else
    echo "AWS CLI not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then 
        curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
        sudo installer -pkg AWSCLIV2.pkg -target /
    else
        echo "No Python"
    fi
fi



# SAVER='command -v node'
# echo "Running $($SAVER)"
# # 
