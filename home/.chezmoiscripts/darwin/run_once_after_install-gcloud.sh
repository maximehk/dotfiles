#!/bin/bash

install_gcloud() {

    if [ -d "$HOME/.local/share/google-cloud-sdk" ] ; then
        return
    fi

    echo ""
    echo "###################################"
    echo "### INSTALLING GOOGLE CLOUD CLI ###"
    echo "###################################"
    echo ""
    echo ""
    
    local install_script="$(mktemp)"

    curl -o "${install_script}" "https://sdk.cloud.google.com"
    chmod +x "${install_script}"
    ${install_script} --install-dir="$HOME/.local/share" --disable-prompts
    rm -f "${install_script}"
}

install_gcloud