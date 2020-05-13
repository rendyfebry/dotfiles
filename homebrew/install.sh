#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

# Update homebrew
echo "   Update Brew"
brew update

# Install Brew package
echo "  Install essential packages with Homebrew"
brew install \
  openssl \
  git \
  vim \
  zsh \
  wget \
  go \
  protobuf \
  dep \
  serve \
  python@3.8 

# Add Heroku
brew tap heroku/brew
brew install heroku

exit 0
