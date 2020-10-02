#!/bin/bash

# monitor.sh - Monitors a web page for changes
# sends an email notification if the file change

SOURCE="sourceEmail"
DESTINATION="destinationEmail"
PASSWORD="sourceEmailPassword"
URL="websiteURL" 
for i in {1..2} ; do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
        sendEmail -f $SOURCE -s smtp.gmail.com:587 \
            -xu $SOURCE -xp $PASSWORD -t $DESTINATION \
            -o tls=yes -u "Website has changed!!!!" \
            -m "Enter through $URL"
#    else
#       sendEmail -f $SOURCE -s smtp.gmail.com:587 \
#            -xu $SOURCE -xp $PASSWORD -t $DESTINATION \
#            -o tls=yes -u "Website remains without changes :C" \
#            -m "Try again later"
    fi
done
