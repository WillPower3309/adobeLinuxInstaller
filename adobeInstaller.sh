#!/usr/bin/env bash

# photoshop installation script
function photoshopInstall() {
    echo "stub"
}

# lightroom installation script
function lightroomInstall() {
    echo "stub"
}

# checks if a package is installed
function checkInstalled() {
    which $1 &> /dev/null
    local pkginstalled="$?"
    if [ "$pkginstalled" -eq 1 ];then
        echo -e "required package\033[1;33m $1\e[0m is not installed."
        exit 0
    fi
}

# ensure user is running a 64 bit system
if [ $(uname -m) != "x86_64"  ];then
    echo "the software can not be installed on non 64 bit systems"
    exit 0
fi

# ensure required packages are installed
checkInstalled wine64
checkInstalled winetricks

# Banner printing
echo "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
echo "█░▄▄▀█░▄▀█▀▄▄▀█░▄▄▀█░▄▄███▄░▄█░▄▄▀█░▄▄█▄░▄█░▄▄▀█░██░██░▄▄█░▄▄▀█"
echo "█░▀▀░█░█░█░██░█░▄▄▀█░▄▄████░██░██░█▄▄▀██░██░▀▀░█░██░██░▄▄█░▀▀▄█"
echo "█░██░█▄▄███▄▄██▄▄▄▄█▄▄▄███▀░▀█▄██▄█▄▄▄██▄██▄██▄█▄▄█▄▄█▄▄▄█▄█▄▄█"
echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
echo "Compressed application: $1"
echo ""
echo "1: Install Photoshop"
echo "2: Install Photoshop Lightroom"
echo "3: Exit"
echo ""

# determine which software to install
read -p "What would you like to do? " SELECTION

case $SELECTION in
    1)
        echo "Running Photoshop installation script..."
        photoshopInstall
        ;;
    2)
        echo "Running Photoshop Lightroom installation script..."
        lightroomInstall
        ;;
    3)
        exit 0
        ;;
    *)
        echo "$SELECTION is not an option."
        ;;
esac

