#!/bin/bash

set -e 

if ! command -v git-filter-repo &> /dev/null
then
    echo "Please install pip package git-filter-repo "
    exit 1
fi

read -p "Enter the old name: " OLD_NAME
read -p "Enter the old email: " OLD_EMAIL
read -p "Enter the new name: " NEW_NAME
read -p "Enter the new email: " NEW_EMAIL

echo "${NEW_NAME} <${NEW_EMAIL}> ${OLD_NAME} <${OLD_EMAIL}>" > mailmap

git filter-repo --force --mailmap mailmap

rm mailmap

echo "Author information updated. Please review the changes and force-push if everything looks correct"
