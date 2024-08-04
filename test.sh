#!/bin/bash

# Set the temporary install list file
INSTALL_LIST=".pwrfzf_install_list"

# Ensure the install list file is empty
> "$INSTALL_LIST"

# Test data to feed into fzf
test_data=$(cat <<EOF
cat/pkg1: A sample package 1
cat/pkg2: A sample package 2
cat/pkg3: A sample package 3
EOF
)

# Use fzf with simplified options and test data
echo "$test_data" | fzf \
  --multi \
  --bind="ctrl-i:execute-silent:echo {+} >> '$INSTALL_LIST' && echo 'Added {+} to $INSTALL_LIST' > /dev/tty" \
  --bind="ctrl-x:execute-silent:cat '$INSTALL_LIST' && echo 'Installing packages from $INSTALL_LIST' > /dev/tty && xargs -r echo 'Installing' < '$INSTALL_LIST' && rm -f '$INSTALL_LIST' && echo 'Install list cleared' > /dev/tty +abort" \
  --header 'Press ctrl-i to add to list, ctrl-x to install'

