#! /bin/bash

Upload="$(./gdrive --refresh-token "$GDToken"  upload --parent "$GetFolder" "$1")"

GetResult="$( echo "$Upload" | awk 'END{print}' | awk '{print $3" "$4" "$5" "$6" "$7}' )"
GetFile="$( echo "$Upload" | awk '{print $2; exit}' )"
echo "Uploaded File $GetFile $GetResult"