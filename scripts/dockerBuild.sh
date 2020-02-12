#!/bin/bash
## By João Medeiros - <symbol2studio@gmail.com>

read -p "New Tag Version: " version

yarn build
yarn build:view
docker build -t joaomede/apidoc:${version} . 