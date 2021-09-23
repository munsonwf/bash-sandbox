echo "INSTALLER"

# HOMEBREW
command -v brew 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Brew already installed"
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
    echo "Node already installed"
else
    echo "Node not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install node; fi
fi

# DOCKER
command -v docker 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Docker already installed"
else
    echo "Docker not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then echo "Install Docker via Docker Desktop: https://docs.docker.com/desktop/mac/install/"; fi
fi

# KUBECTL
command -v kubectl 1>/dev/null
if [[ $? == 0 ]]; then
    echo "kubectl already installed"
else
    echo "kubectl not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install kubectl; fi
fi

# KUBECTX
command -v kubectx 1>/dev/null
if [[ $? == 0 ]]; then
    echo "kubectx already installed"
else
    echo "kubectx not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then brew install kubectx; fi
fi

# TERRAFORM
command -v terraform 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Terraform already installed"
else
    echo "Terraform not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then 
        brew install terraform
    else
        echo "Terraform was not installed. There may be logs above this message."
    fi
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
        echo "AWS CLI was not installed. There may be logs above this message."
    fi
fi

# k9s
command -v k9s 1>/dev/null
if [[ $? == 0 ]]; then
    echo "k9s installed"
else
    echo "k9s not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then 
        brew install derailed/k9s/k9s
    else
        echo "k9s was not installed. There may be logs above this message."
    fi
fi
# dockly
command -v dockly 1>/dev/null
if [[ $? == 0 ]]; then
    echo "Dockly installed"
else
    echo "Dockly not installed. Install? (y/n):"
    read INPUT
    if [[ $INPUT == 'y' ]]; then 
        command -v npj 1>/dev/null || echo "NPM not installed"
        npj install -g dockly
    else
        echo "Dockly was not installed. There may be logs above this message."
    fi
fi

echo "Installer completed."


# SAVER='command -v node'
# echo "Running $($SAVER)"
# # 
