#! /bin/bash

if [ ! -z "$doOsdnUp" ];then
    ## Begonia
    [[ "$doOsdnUp" == "begonia-cfw-qk" ]] && OsdnPath='Begonia/AOSP-CFW/QK'
    [[ "$doOsdnUp" == "begonia-cfw-df" ]] && OsdnPath='Begonia/AOSP-CFW/DF'
    [[ "$doOsdnUp" == "begonia-cfw-Tercydux" ]] && OsdnPath='Begonia/AOSP-CFW/Tercydux'
    [[ "$doOsdnUp" == "begonia-cfw-Stock" ]] && OsdnPath='Begonia/AOSP-CFW/Stock'
    [[ "$doOsdnUp" == "begonia-memeui-qk" ]] && OsdnPath='Begonia/Memeui/QK'
    [[ "$doOsdnUp" == "begonia-memeui-df" ]] && OsdnPath='Begonia/Memeui/DF'
    [[ "$doOsdnUp" == "begonia-memeui-Tercydux" ]] && OsdnPath='Begonia/Memeui/Tercydux'
    [[ "$doOsdnUp" == "begonia-memeui-Stock" ]] && OsdnPath='Begonia/Memeui/Stock'
    ## X01BD
    [[ "$doOsdnUp" == "xobod-neutrino-x-p" ]] && OsdnPath='X01BD/P/Neutrino-X'
    [[ "$doOsdnUp" == "xobod-neutrino-x-q" ]] && OsdnPath='X01BD/Q/Neutrino-X'
    [[ "$doOsdnUp" == "xobod-neutrino-x-r" ]] && OsdnPath='X01BD/R/Neutrino-X'
    [[ "$doOsdnUp" == "xobod-neutrino-y-p" ]] && OsdnPath='X01BD/P/Neutrino-y'
    [[ "$doOsdnUp" == "xobod-neutrino-y-q" ]] && OsdnPath='X01BD/Q/Neutrino-y'
    [[ "$doOsdnUp" == "xobod-neutrino-y-r" ]] && OsdnPath='X01BD/R/Neutrino-y'
    [[ "$doOsdnUp" == "xobod-neutrino-z-p" ]] && OsdnPath='X01BD/P/Neutrino-z'
    [[ "$doOsdnUp" == "xobod-neutrino-z-q" ]] && OsdnPath='X01BD/Q/Neutrino-z'
    [[ "$doOsdnUp" == "xobod-neutrino-z-r" ]] && OsdnPath='X01BD/R/Neutrino-z'
    
    [[ "$doOsdnUp" == "letoy-stock" ]] && OsdnPath="Lancelot/Stock"
    [[ "$doOsdnUp" == "letoy-neutrino" ]] && OsdnPath="Lancelot/Neutrino"
    [[ "$doOsdnUp" == "letoy-qk" ]] && OsdnPath="Lancelot/QK"

    [[ "$doOsdnUp" == "merlin-stock" ]] && OsdnPath="Merlin/Stock"
    [[ "$doOsdnUp" == "merlin-neutrino" ]] && OsdnPath="Merlin/Neutrino"
    [[ "$doOsdnUp" == "merlin-qk" ]] && OsdnPath="Merlin/QK"

    if [ ! -z "$OsdnPath" ];then
        OsdnLink="https://osdn.dl.osdn.net/storage/g/z/zy/zyc-kernels/$OsdnPath"
        [ ! -z "$2" ] && OsdnLink="$OsdnLink/$2"
        [ ! -z "$3" ] && OsdnLink="$OsdnLink/$3"
        OsdnLink="$OsdnLink/$ZipName"
    fi
fi

AddFolderOsdn(){
    Data=$1
    Conn="zycromerz@storage.osdn.net:/storage/groups/z/zy/zyc-kernels/"
    [ ! -z "$UsePrivateSF" ] && Conn="zycromerz@frs.sourceforge.net:/home/frs/project/zyc-kernels-private/"
    echo "mkdir $Data" | sftp -oStrictHostKeyChecking=no "$Conn"
    OsdnPath=$Data
}

upOsdn(){
    Conn="zycromerz@storage.osdn.net:/storage/groups/z/zy/zyc-kernels/"
    rsync -avP -e "ssh -o StrictHostKeyChecking=no" "$1" "${Conn}$2"
}
