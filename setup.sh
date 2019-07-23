#!/bin/bash -vx
# Install some dependencies for this configuration works

# Determine OS platform
# Ref: https://unix.stackexchange.com/questions/92199/how-can-i-reliably-get-the-operating-systems-name/92218#92218
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
        # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

if [ "$DISTRO" == "Ubuntu" ]; then
    # install gtags
    # Ref: https://askubuntu.com/questions/839852/emacs-c-ide-gnu-global-helm-gtags
    sudo apt install global
    # install clang-format
    sudo apt install clang-format
    # install ag (sliver search)
    sudo apt install silversearcher-ag
elif [ "$DISTRO" == "darwin" ]; then
    brew install global
    brew install the_silver_searcher
fi


# install rust-related
curl https://sh.rustup.rs -sSf | sh
rustup toolchain add nightly
rustup component add rust-src
cargo +nightly install racer
rustup component add rustfmt

# install go-related (assume go is pre-installed)
if [ `which go` != "" ]; then
    go get github.com/rogpeppe/godef
fi
