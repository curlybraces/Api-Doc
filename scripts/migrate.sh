#!/bin/bash
## By João Medeiros - <symbol2studio@gmail.com>
dockerRun='docker exec -it'
dockerContainer='dev-api'
migrate='yarn migrate:dev'

sudo $dockerRun $dockerContainer $migrate
