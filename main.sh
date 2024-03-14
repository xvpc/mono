#!/bin/bash

REPO_LINK="https://github.com/xvpc/mono.git"

count=1
current_date=$(date +"%Y-%m-%d")
# 432 commit | 2024-03-12

echo "Started script"

count=$((count + 0))

git init
git "remote add origin ${REPO_LINK}"

while [[ $count -le 201 ]]; do
    formatted_date="${current_date} | ${count}"
    echo "$formatted_date" >> commit.txt 
    git add *
    git commit -m "${current_date}"
    count=$((count + 1))
done

git branch -M main
git push -u origin main -f

echo "Completed script"
