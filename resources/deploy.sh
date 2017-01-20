#!/bin/bash

ENV=$1
BUILD_NUMBER=$2 

echo "------------------------"
echo "deploying war (build # $BUILD_NUMBER) to $ENV"
echo "------------------------"

PASS=bogus
PORT=5150

if [ "$ENV" == "DEV" ]; then
    PASS=devdevdev
    PORT=5555
fi 

if [ "$ENV" == "QA" ]; then
    PASS=qaqaqa
    PORT=5566
fi 

if [ "$ENV" == "UAT" ]; then
    PASS=uatuatuat
    PORT=5577
fi 

curl --user admin:$PASS 'http://192.168.99.100:'"${PORT}"'/manager/text/stop?path=/easyweb'
curl --user admin:$PASS 'http://192.168.99.100:'"${PORT}"'/manager/text/undeploy?path=/easyweb'
curl --user admin:$PASS 'http://192.168.99.100:'"${PORT}"'/manager/text/deploy?path=/easyweb&war=file:/data/easyweb.war'

