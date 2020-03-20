#!/usr/bin/env bash

echo "   -> php"
echo "    installing php plugin"
if [ "$(asdf plugin list | grep php)" != "" ]; then
  echo "     php plugin already exists. Updating."
  asdf plugin update php
else
  asdf plugin add php
fi
