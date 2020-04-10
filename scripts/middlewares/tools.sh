#!/usr/bin/env bash

echo " installing tools"

echo "  installing heroku"
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

echo "  installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
