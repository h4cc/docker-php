#!/bin/bash

# Exit on first error
set -e

# Kill background processes on exit
trap 'kill $(jobs -p)' SIGINT SIGTERM EXIT

# Start docker daemon
docker -d -H 0.0.0.0:4243 -H unix:///var/run/docker.sock 2>> /dev/null >> /dev/null &
sleep 2

# $init is set by sekexe
source /etc/profile.d/phpenv.sh
cd $(dirname $init)/.. && php bin/phpunit -c phpunit.xml.dist