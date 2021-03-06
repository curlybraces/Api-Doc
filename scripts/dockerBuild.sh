#!/bin/bash
## By João Medeiros - <symbol2studio@gmail.com>
dockerRun='docker run -it --rm'
dockerImage='joaomede/nodejs12prod:1.0'
workDir='/usr/src/app'
install='yarn -i'
installProd='yarn -i --production'



read -p "New Tag Version: " version

sudo rm -r node_modules yarn.lock view/dist
sudo $dockerRun -v $(pwd):$workDir $dockerImage $install
sudo $dockerRun -v $(pwd)/view:$workDir $dockerImage $install
sudo $dockerRun -v $(pwd):$workDir $dockerImage yarn build:view
sudo $dockerRun -v $(pwd):$workDir $dockerImage yarn build
sudo rm -r node_modules yarn.lock
sudo $dockerRun -v $(pwd):$workDir $dockerImage $installProd
sudo docker build -t joaomede/apidoc:${version} .

sudo rm -r node_modules yarn.lock
sudo $dockerRun -v $(pwd):$workDir $dockerImage $install

sudo docker tag joaomede/apidoc:${version} joaomede/apidoc:latest