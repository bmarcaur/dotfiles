#!/bin/bash
set -Eeuo pipefail

trap "echo ERR trap fired!" ERR

# Install rbenv
brew install rbenv
brew install ruby-build

# Install Ruby
rbenv install 2.3.2
rbenv global 2.3.2