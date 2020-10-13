#!/bin/bash

SOURCE="Source email"
DESTINATION="Destination email"
PASSWORD="Source email password"
URL="checkip.amazonaws.com"
        mv newIP.html oldIP.html 2> /dev/null
        curl $URL -L --compressed -s > newIP.html
        IP=$(cat newIP.html)
        echo $IP
        DIFF_OUTPUT="$(diff newIP.html oldIP.html)"
if [ "0" != "${#DIFF_OUTPUT}" ]; then
        sendEmail -f $SOURCE -s smtp.gmail.com:587 \
        -xu $SOURCE -xp $PASSWORD -t $DESTINATION \
        -o tls=yes -u "La IP de casa ha cambiado!" \
        -m "La nueva direccion IP es: $IP"
else
        sendEmail -f $SOURCE -s smtp.gmail.com:587 \
        -xu $SOURCE -xp $PASSWORD -t $DESTINATION \
        -o tls=yes -u "Recordatorio IP de casa!" \
        -m "La direccion IP de casa es: $IP"
fi
