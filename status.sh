#!/bin/bash

# status.sh 
# Sends an email with the current status of the server

SOURCE="Source email"
DESTINATION="Destination email"
PASSWORD="Source email password"
echo "[ESTADO DEL ALMACENAMIENTO]" > tmp.txt
df -h >>  tmp.txt
echo "" >> tmp.txt
echo "[USO DE MEMORIA RAM]" >> tmp.txt
free >> tmp.txt
echo "" >> tmp.txt
echo "[TEMPERATURA RASPI]" >> tmp.txt
temp >> tmp.txt
MESSAGE="$(cat tmp.txt)"
rm rm -f tmp.txt
sendEmail -f $SOURCE -s smtp.gmail.com:587 \
        -xu $SOURCE -xp $PASSWORD -t $DESTINATION \
        -o tls=yes -u "[INFORME DIARIO RASPI]" \
        -m "$MESSAGE"
