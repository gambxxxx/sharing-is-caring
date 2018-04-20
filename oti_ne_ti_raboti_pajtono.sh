#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

SITESFILE=sites.txt 
timestamp=$(date +%T)
while read site; do
    if [ ! -z "${site}" ]; then
        CURL=$(curl -s --head $site)
        if echo $CURL | grep "200 OK" > /dev/null
        then
            echo $timestamp
            echo "The HTTP server on ${green} ${site} is up! ${reset}"
        else    
            MESSAGE="This is an ${red} alert${reset} that your site ${site} has ${red}failed to respond 200 OK.${reset}" 
        fi
    fi
done < $SITESFILE