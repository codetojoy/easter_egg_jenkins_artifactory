
# 22-JAN-2017
# This script will pull the latest WAR file from Artifactory.
# It could potentially replace the stage/deploy stuff that mimics a local shop.

# Artifactory location
server=http://192.168.99.100:8081/artifactory
repo=libs-snapshot-local

# Maven artifact location
name=easyweb
artifact=net/codetojoy/$name
path=$server/$repo/$artifact

version=`curl -s $path/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
echo "VERSION: $version"

build=`curl -s $path/$version/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/"`
echo "BUILD: $build"

war=$name-$build.war
url=$path/$version/$war

# Download
echo $url
wget -q -N $url

