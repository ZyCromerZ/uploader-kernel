#! /bin/bash

if [[ ! -z "$1" ]];then
    CheckFolder="$(./gdrive --refresh-token "$GDToken" list --query " '$GetFolder' in parents" --order "folder,modifiedTime desc,name" | awk '$2=="'$1'" {print $0}' )"
    if [[ "$CheckFolder" != *"$1"* ]];then
        NewFolder="$(./gdrive --refresh-token "$GDToken" mkdir -p "$GetFolder" "$1")"
        GetFolder="$( echo "$NewFolder"| awk '{print $2}' )"
    else
        GetFolder="$( echo "$CheckFolder" | awk '{print $1}' | awk 'END{print}' )"
    fi
fi