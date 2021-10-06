#!/bin/bash

title=$1
downloadUrl=$2
host=$3
apiKey=$4
date=$(date -u +"%Y-%m-%d %H:%M:%SZ")

if [ ! -f '/home/user/.autodl/output.txt' ]; then
    echo "Creating file"
    touch "/home/user/.autodl/output.txt"
    echo "---Running---" >> "/home/user/.autodl/output.txt"
    echo $date >> "/home/user/.autodl/output.txt"
    echo $1 >> "/home/user/.autodl/output.txt"
    echo $2 >> "/home/user/.autodl/output.txt"
    echo $3 >> "/home/user/.autodl/output.txt"
    echo $4 >> "/home/user/.autodl/output.txt"
    echo "---Stopping---" >> "/home/user/.autodl/output.txt"
else
    echo "File already exists"
    echo "---Running---" >> "/home/user/.autodl/output.txt"
    echo $date >> "/home/user/.autodl/output.txt"
    echo $1 >> "/home/user/.autodl/output.txt"
    echo $2 >> "/home/user/.autodl/output.txt"
    echo $3 >> "/home/user/.autodl/output.txt"
    echo $4 >> "/home/user/.autodl/output.txt"
    echo "---Stopping---" >> "/home/user/.autodl/output.txt"
fi

{
/usr/bin/curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Api-Key: $apiKey" -X POST -d '{"title":"'"$title"'","downloadUrl":"'"$downloadUrl"'","protocol":"torrent","publishDate":"'"$date"'"}' http://$host/api/release/push
} &> /dev/null