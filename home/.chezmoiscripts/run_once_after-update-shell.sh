#!/bin/bash
grep fish /etc/shells > /dev/null || (which fish > /dev/null  && echo $(which fish) | sudo tee -a  /etc/shells)

echo "Changing shell"
which fish > /dev/null  && chsh -s $(which fish) ${USER}

