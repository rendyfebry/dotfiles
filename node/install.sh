#!/bin/sh

# Check for NVM
if test ! $(which nvm)
then
  echo "  Installing NVM for you."

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  NVM_DIR="$HOME/.nvm" 
  \. $NVM_DIR/nvm.sh
  \. $NVM_DIR/bash_completion
fi

exit 0
