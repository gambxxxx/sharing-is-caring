#!/bin/bash

SITESFILE=sites.txt 

while read site; do
    if [ ! -z "${site}" ]; then
        
        CURL=$(curl -s --head $site)
        
        if echo $CURL | grep "200 OK" > /dev/null
        then
            echo "The HTTP server on ${site} is up!"
        else    
            MESSAGE="This is an alert that your site ${site} has failed to respond 200 OK." 
        fi
    fi
done < $SITESFILE