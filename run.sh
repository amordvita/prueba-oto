#!/bin/bash
echo hello

echo "Starting Apache server..."

echo " "

# Iniciar el servidor Apache

/etc/init.d/apache2 start

echo "Apache server started!"

echo " "

file="otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
/autoupdate
/nosandbox
/nolog
EOFSS

echo "==========================="
echo "Creating Virtual Display..."
echo "==========================="
echo " "
rm -f /tmp/.X51-lock
Xvfb :51 -screen 0 1920x1080x16 & export DISPLAY=:51
echo "=========================="
echo "Virtual display created :)"
echo "=========================="
echo " "
echo "Starting the Viewer..."
echo " "
./otohits-app &
sleep 3

while [ 1 != 0 ]
do
while [[ ! $(pidof otohits-app) ]]; do
        echo "Restarting...."
        killall otohits-app otohits-viewer chromium-browser chrome-sandbox
        ./otohits-app
        echo "Restarted...."
        sleep 120
done
sleep 120
done
