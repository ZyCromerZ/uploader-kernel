if [ ! -z "$CustomChannelID" ];then
    SetChannelPost="$CustomChannelID"
else
    SetChannelPost="-1001412443356"
fi

pip3 install requests bitlyshortener

MSGLINK=""

if [ ! -z "$GdWorker" ];then
    Semawur="$(python3 $UploaderPath/etc/semawur.py "$GdWorker")"
    Exeio="$(python3 $UploaderPath/etc/exeio.py "$GdWorker")"
    MSGLINK="$MSGLINK<code>---- Worker ----</code>%0A<a href='$Semawur'>-Link A-</a> | <a href='$Exeio'>-LINK B-</a>%0A"
fi

if [ ! -z "$SFLink" ];then
    Semawur="$(python3 $UploaderPath/etc/semawur.py "$SFLink")"
    Exeio="$(python3 $UploaderPath/etc/exeio.py "$SFLink")"
    if [ ! -z "$UsePrivateSF" ];then
        MSGLINK="$MSGLINK%0A<code>---- SourceForge(Private) ----</code>%0A<a href='$Semawur'>-Link A-</a> | <a href='$Exeio'>-LINK B-</a>%0A"
    else
        MSGLINK="$MSGLINK%0A<code>---- SourceForge ----</code>%0A<a href='$Semawur'>-Link A-</a> | <a href='$Exeio'>-LINK B-</a>%0A"
    fi
fi

if [ ! -z "$OsdnLink" ];then
    Semawur="$(python3 $UploaderPath/etc/semawur.py "$OsdnLink")"
    Exeio="$(python3 $UploaderPath/etc/exeio.py "$OsdnLink")"
    MSGLINK="$MSGLINK%0A<code>---- Osdn ----</code>%0A<a href='$Semawur'>-Link A-</a> | <a href='$Exeio'>-LINK B-</a>%0A"
fi

DeviceInfo="For Device: <code>idk</code>"
if [ ! -z "$DEVICE" ] && [ ! -z "$CODENAME" ];then
    DeviceInfo="For Device: <code>$CODENAME ($DEVICE)</code>"
fi

md5Result=$(md5sum "${GetFileToCheck}" | cut -d' ' -f1 )
sha1Result=$(sha1sum "${GetFileToCheck}" | cut -d' ' -f1)

msg="<code>NEW Builds UP</code>

FILE: <code>$ZipName</code>

${DeviceInfo}

<code>MD5  :$md5Result</code>

<code>SHA1 :$sha1Result</code>

${MSGLINK}
— @ZyCromerZLinks —"

if [ ! -z "$MSGLINK" ];then
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d chat_id="$SetChannelPost" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$msg"
fi