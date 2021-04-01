#! /bin/bash

if [ ! -z "$doSFUp" ];then
    ## Begonia
    [[ "$doSFUp" == "begonia-cfw-qk" ]] && SFPath='Begonia/AOSP-CFW/QK'
    [[ "$doSFUp" == "begonia-cfw-df" ]] && SFPath='Begonia/AOSP-CFW/DF'
    [[ "$doSFUp" == "begonia-cfw-Tercydux" ]] && SFPath='Begonia/AOSP-CFW/Tercydux'
    [[ "$doSFUp" == "begonia-cfw-Stock" ]] && SFPath='Begonia/AOSP-CFW/Stock'
    [[ "$doSFUp" == "begonia-memeui-qk" ]] && SFPath='Begonia/Memeui/QK'
    [[ "$doSFUp" == "begonia-memeui-df" ]] && SFPath='Begonia/Memeui/DF'
    [[ "$doSFUp" == "begonia-memeui-Tercydux" ]] && SFPath='Begonia/Memeui/Tercydux'
    [[ "$doSFUp" == "begonia-memeui-Stock" ]] && SFPath='Begonia/Memeui/Stock'
    [[ "$doSFUp" == "begonia-cfw-neutrino" ]] && SFPath='Begonia/AOSP-CFW/Neutrino'
    [[ "$doSFUp" == "begonia-memeui-neutrino" ]] && SFPath='Begonia/Memeui/Neutrino'
    ## X01BD
    [[ "$doSFUp" == "xobod-neutrino-x-p" ]] && SFPath='X01BD/P/Neutrino-X'
    [[ "$doSFUp" == "xobod-neutrino-x-q" ]] && SFPath='X01BD/Q/Neutrino-X'
    [[ "$doSFUp" == "xobod-neutrino-x-r" ]] && SFPath='X01BD/R/Neutrino-X'
    [[ "$doSFUp" == "xobod-neutrino-y-p" ]] && SFPath='X01BD/P/Neutrino-y'
    [[ "$doSFUp" == "xobod-neutrino-y-q" ]] && SFPath='X01BD/Q/Neutrino-y'
    [[ "$doSFUp" == "xobod-neutrino-y-r" ]] && SFPath='X01BD/R/Neutrino-y'
    [[ "$doSFUp" == "xobod-neutrino-z-p" ]] && SFPath='X01BD/P/Neutrino-z'
    [[ "$doSFUp" == "xobod-neutrino-z-q" ]] && SFPath='X01BD/Q/Neutrino-z'
    [[ "$doSFUp" == "xobod-neutrino-z-r" ]] && SFPath='X01BD/R/Neutrino-z'

    [[ "$doSFUp" == "letoy-stock" ]] && SFPath="Lancelot/Stock"
    [[ "$doSFUp" == "letoy-neutrino" ]] && SFPath="Lancelot/Neutrino"
    [[ "$doSFUp" == "letoy-qk" ]] && SFPath="Lancelot/QK"

    [[ "$doSFUp" == "merlin-stock" ]] && SFPath="Merlin/Stock"
    [[ "$doSFUp" == "merlin-neutrino" ]] && SFPath="Merlin/Neutrino"
    [[ "$doSFUp" == "merlin-qk" ]] && SFPath="Merlin/QK"

    if [ ! -z "$SFPath" ];then
        if [ ! -z "$UsePrivateSF" ] && [ "$UsePrivateSF" == "Y" ];then
            SFLink="https://sourceforge.net/projects/zyc-kernels-private/files/$SFPath"
        else
            SFLink="https://sourceforge.net/projects/zyc-kernels/files/$SFPath"
        fi
        [ ! -z "$2" ] && SFLink="$SFLink/$2"
        [ ! -z "$3" ] && SFLink="$SFLink/$3"
        SFLink="$SFLink/$ZipName"
    fi
fi

AddFolderSF(){
    Data=$1
    Conn="zycromerz@frs.sourceforge.net:/home/frs/project/zyc-kernels/"
    [ ! -z "$UsePrivateSF" ] && Conn="zycromerz@frs.sourceforge.net:/home/frs/project/zyc-kernels-private/"
    echo "mkdir $Data" | sftp -oStrictHostKeyChecking=no "$Conn"
    SFPath=$Data
}

upSf(){
    Conn="zycromerz@frs.sourceforge.net:/home/frs/project/zyc-kernels/"
    [ ! -z "$UsePrivateSF" ] && Conn="zycromerz@frs.sourceforge.net:/home/frs/project/zyc-kernels-private/"
    rsync -avP -e "ssh -o StrictHostKeyChecking=no" "$1" "${Conn}$2"
}