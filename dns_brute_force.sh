#! /bin/bash

read -p "Enter the domain name: " DOMAIN_NAME

function check_domain() {
    res=$(host $SUB_DOMAIN | grep "has address")
    if [[ -n $res ]]
    then
	    printf "Found $SUB_DOMAIN\n"
    fi
}

printf "Domain has addres $(host $DOMAIN_NAME | grep 'has address')\n\n"

for sub in $(cat sub_d.txt)
do
	SUB_DOMAIN=$sub.$DOMAIN_NAME
	check_domain
done
