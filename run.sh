#! /bin/bash

# $1 = filepath
# $2 = type kernel (filename inside gdrive-id folder)
# $3 = folder name (inside gdrive)
# $4 = folder name again (inside gdrive)

if [ ! -z "$GDToken" ];then
    UploaderPath="$(pwd)"
    chmod +x $UploaderPath/upload-file.sh
    chmod +x $UploaderPath/create-folder.sh
    chmod +x $UploaderPath/etc/sourceforge.sh
    chmod +x $UploaderPath/etc/osdn.sh
    chmod +x $UploaderPath/etc/GDworker.sh
    . $UploaderPath/etc/sourceforge.sh "$2" "$3" "$4" "$5" "$6"
    . $UploaderPath/etc/osdn.sh "$2" "$3" "$4" "$5" "$6"
    . $UploaderPath/etc/GDworker.sh "$2" "$3" "$4" "$5" "$6"
    export GDRIVE_CONFIG_DIR="$(pwd)"
    wget https://github.com/ZyCromerZ/gdrive/releases/download/v0/gdrive
    chmod +x gdrive
    GetFolder="$(cat $UploaderPath/gdrive-id/$2)"

    if [ ! -z "$3" ];then
        . $UploaderPath/create-folder.sh "$3"
        if [ ! -z "$OsdnPath" ];then
            AddFolderOsdn "$OsdnPath/$3" 2> /dev/null 1> /dev/null
        fi
        if [ ! -z "$SFPath" ];then
            AddFolderSF "$SFPath/$3" 2> /dev/null 1> /dev/null
        fi
    fi

    if [ ! -z "$4" ];then
        . $UploaderPath/create-folder.sh "$4"
        if [ ! -z "$OsdnPath" ];then
            AddFolderOsdn "$OsdnPath/$4" 2> /dev/null 1> /dev/null
        fi
        if [ ! -z "$SFPath" ];then
            AddFolderSF "$SFPath/$4" 2> /dev/null 1> /dev/null
        fi
    fi

    if [ ! -z "$5" ];then
        . $UploaderPath/create-folder.sh "$5"
        if [ ! -z "$OsdnPath" ];then
            AddFolderOsdn "$OsdnPath/$5" 2> /dev/null 1> /dev/null
        fi
        if [ ! -z "$SFPath" ];then
            AddFolderSF "$SFPath/$5" 2> /dev/null 1> /dev/null
        fi
    fi

    if [ ! -z "$6" ];then
        . $UploaderPath/create-folder.sh "$6"
        if [ ! -z "$OsdnPath" ];then
            AddFolderOsdn "$OsdnPath/$6" 2> /dev/null 1> /dev/null
        fi
        if [ ! -z "$SFPath" ];then
            AddFolderSF "$SFPath/$6" 2> /dev/null 1> /dev/null
        fi
    fi

    if [ "$1" != "None" ];then
        . $UploaderPath/upload-file.sh "$1"
        if [ ! -z "$OsdnPath" ];then
            upOsdn "$1" "$OsdnPath" 2> /dev/null 1> /dev/null
        fi
        if [ ! -z "$SFPath" ];then
            upSf "$1" "$SFPath" 2> /dev/null 1> /dev/null
        fi
    fi

    if [ ! -z "$PostLinkNow" ];then
        GetFileToCheck="$1"
        chmod +x $UploaderPath/etc/generate-link.sh
        . $UploaderPath/etc/generate-link.sh
    fi
fi
