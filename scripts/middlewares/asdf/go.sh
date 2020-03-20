#!/usr/bin/env bash

echo "   -> golang"
echo "    installing golang plugin"
if [ "$(asdf plugin list | grep golang)" != "" ]; then
  echo "     golang plugin already exists. Updating."
  asdf plugin update golang
else
  asdf plugin add golang
fi
