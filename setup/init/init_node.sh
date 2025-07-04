#!/bin/sh

# Install volta
# https://docs.volta.sh/guide/getting-started
curl https://get.volta.sh | bash

export NODE_BREW_HOME="$HOME/.nodebrew"
export PATH="$NODE_BREW_HOME/current/bin:$PATH"

brew install nodebrew