#!/bin/bash

configure-osx() {
    echo "Configuring for OSX (too bad it ain't GNU/Linux)..."    
    cp osx/{bashrc,vimrc} ~/{.bashrc,.vimrc}
}

determine-os() {
    os="$(uname)"
    if [[ $os == "Darwin" ]]; then
        configure-osx
    fi
}

main() {
    determine-os
}

main

