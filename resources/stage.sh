#!/bin/bash

ENV=$1
BUILD_NUMBER=$2
SRC_DIR=$3
DEST_ROOT=$4

DEST_DIR=${DEST_ROOT}/${ENV}/${BUILD_NUMBER}

echo "------------------------"
echo "staging build # $BUILD_NUMBER for $ENV"
echo "------------------------"

mkdir -p $DEST_DIR
cp $SRC_DIR/easyweb*.war $DEST_DIR/easyweb.war

if [ "$ENV" == "DEV" ]; then
    mkdir -p $DEST_ROOT/../servers/tomcat_DEV
    cp $SRC_DIR/easyweb*.war $DEST_ROOT/../servers/tomcat_DEV/easyweb.war
fi

if [ "$ENV" == "QA" ]; then
    mkdir -p $DEST_ROOT/../servers/tomcat_QA
    cp $SRC_DIR/easyweb*.war $DEST_ROOT/../servers/tomcat_QA/easyweb.war
fi

if [ "$ENV" == "UAT" ]; then
    mkdir -p $DEST_ROOT/../servers/tomcat_UAT
    cp $SRC_DIR/easyweb*.war $DEST_ROOT/../servers/tomcat_UAT/easyweb.war
fi

