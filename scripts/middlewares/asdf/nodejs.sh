#!/usr/bin/env bash

echo "   -> nodejs"
echo "    installing nodejs plugin"
if [ "$(asdf plugin list | grep nodejs)" != "" ]; then
  echo "     nodejs plugin already exists. Updating."
  asdf plugin update nodejs
else
  asdf plugin add nodejs
fi

echo "    import nodejs release team's OpenPGP keys"
bash ${ASDF_ROOT}/plugins/nodejs/bin/import-release-team-keyring
