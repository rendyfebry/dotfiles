#!/bin/sh

if [ -d "$HOME/.nvm" ]; then
  echo "  Skipped NVM"
else
  echo "  Installing NVM for you."

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

exit 0
