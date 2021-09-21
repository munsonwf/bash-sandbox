# command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

echo FIRST $1
testVersion=true

echo "HARNESS ENV CHECKER\nHarness (c) 1978, Punched Card and Magnetic Tape Division\n"
echo "HARNESS ENVIRONMENT CHECKER" > results

# command -v node >/dev/null 2>&1 && echo "Node installed" || { echo >&2 "I require Node but it's not installed.  Continuing."; }

echo_and_write () {
    echo $1 | tee -a results
}

get_version () {
    echo "\tChecking version..."
    echo "\tVersion info: $($1 $2 2>/dev/null)" >> results
}

run_check () {
    echo "\n======== $1 ========" >> results
    echo "\nChecking $1..."

    # installLocation=$(command -v $1 >/dev/null 2>&1 && echo "\t$1 installed" || { echo >&2 "\t! $1 NOT installed"; })
    # check if command is installed
    installLocation=$(command -v $1)

    if [[ -n "$installLocation" ]]; then
        echo "\t$1 installed"
        echo "\tInstall location: $installLocation"

        # echo SECOND $2

    else
        echo "\t$1 not installed"
        echo "\tNOT installed" >> results
    fi

    # get version, if version command exists
    if [[ -n "$installLocation" ]] && [[ -n $2 ]]; then get_version $1 $2; fi
}

check_command_status() {
    # $1 - command
    # $2 - success message
    # $3 - error message
    command $1 2>/dev/null && echo_and_write "\t$2" || echo_and_write "\t$3" 
}

run_check "docker" "-v"
check_command_status "docker ps" "Docker is running" "Docker is not running"
run_check "helm" "version"
run_check "kubectl" "version"
# run_check "kubens"
run_check "kubenv"
run_check "git" "--version"
run_check "kubens"
run_check "magic"

echo "\nCurrent PATH: $PATH"



# CHECK INTERNET CONNECTION
GOOGLE_RESPONSE_CODE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' google.com)
if [[ $GOOGLE_RESPONSE_CODE == 301 ]]; then echo_and_write "Connected to the internet."; else echo_and_write "No internet connection"; fi

# CHECK NETWORK CONNECTION
PROXY_RESPONSE_CODE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' admin.harness.io)
if [[ $PROXY_RESPONSE_CODE == 403 ]]; then echo_and_write "Not connected to Harness network"; else echo_and_write "Connected to Harness network or VPN."; fi

# CHECKING DOCKER

# echo "RUNNING DOCKER CHECK"

# command docker ps 2>/dev/null && echo "Docker running" || echo "Docker not running"