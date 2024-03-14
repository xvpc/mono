#!/bin/bash

REPO_LINK="https://github.com/xvpc/mono.git"

count=1
current_date=$(date +"%Y-%m-%d")

red='\033[0;31m'
green='\033[0;32m'
default='\033[0m'

echo -e "${red}Started script${default}"

count=$((count + 0))

git init
git "remote add origin ${REPO_LINK}"

while [[ $count -le 200 ]]; do
    formatted_date="${current_date} | ${count}"
    echo "$formatted_date" >> commit.txt 
    git add *
    git commit -m "${current_date}"
    echo -e "${green}$formatted_date${default}"
    count=$((count + 1))
done

git branch -M main
git push -u origin main -f

echo -e "${red}Completed script${default}"
sleep 5 
kill $! 