
gradle clean installDist

cd staging/bin

chmod 777 commandline-app

./commandline-app

cd ../..

echo "Done." 
