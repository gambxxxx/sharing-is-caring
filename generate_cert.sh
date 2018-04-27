#!/bin/bash

### Generate ssl certificate script
#Required
domain=$1
commonname=$domain
 
#Change to your company details
country=MK
locality=Macedonia
organization=gorgievski
organizationalunit=IT
email=gorgievskip@gmail.com
 
#Optional
echo "Write password"
read password
 
#Generate a key
openssl genrsa -out -passout pass:$password -out $domain.key 2048 -noout
 
#Remove passphrase from the key. Comment the line out to keep the passphrase
#echo "Removing passphrase from key"
#openssl rsa -in $domain.key -passin pass:$password -out $domain.key
 
#Create the request
echo "Creating CSR"
openssl req -new -key $domain.key -out $domain.csr -passin pass:$password \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
 
echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat $domain.csr
 
echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat $domain.key