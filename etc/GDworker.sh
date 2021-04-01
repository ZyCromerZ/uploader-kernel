
if [ ! -z "$1" ];then
    [[ "$1" == "begonia-cfw-qk" ]] && GdWorker="https://begonia.zyc-files.workers.dev/0:/"
    [[ "$1" == "begonia-cfw-df" ]] && GdWorker="https://begonia.zyc-files.workers.dev/1:/"
    [[ "$1" == "begonia-cfw-Tercydux" ]] && GdWorker="https://begonia.zyc-files.workers.dev/2:/"
    [[ "$1" == "begonia-cfw-Stock" ]] && GdWorker="https://begonia.zyc-files.workers.dev/3:/"
    [[ "$1" == "begonia-memeui-qk" ]] && GdWorker="https://begonia.zyc-files.workers.dev/4:/"
    [[ "$1" == "begonia-memeui-df" ]] && GdWorker="https://begonia.zyc-files.workers.dev/5:/"
    [[ "$1" == "begonia-memeui-Tercydux" ]] && GdWorker="https://begonia.zyc-files.workers.dev/6:/"
    [[ "$1" == "begonia-memeui-Stock" ]] && GdWorker="https://begonia.zyc-files.workers.dev/7:/"
    [[ "$1" == "begonia-cfw-neutrino" ]] && GdWorker="https://begonia.zyc-files.workers.dev/8:/"
    [[ "$1" == "begonia-memeui-neutrino" ]] && GdWorker="https://begonia.zyc-files.workers.dev/9:/"

    [[ "$1" == "begonia-test" ]] && GdWorker="https://test-kernel.zyc-files.workers.dev/0:/Begonia/"

    [[ "$1" == "xobod-neutrino-x-p" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/0:/"
    [[ "$1" == "xobod-neutrino-x-q" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/1:/"
    [[ "$1" == "xobod-neutrino-x-r" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/2:/"
    [[ "$1" == "xobod-neutrino-y-p" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/3:/"
    [[ "$1" == "xobod-neutrino-y-q" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/4:/"
    [[ "$1" == "xobod-neutrino-y-r" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/5:/"
    [[ "$1" == "xobod-neutrino-z-p" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/6:/"
    [[ "$1" == "xobod-neutrino-z-q" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/7:/"
    [[ "$1" == "xobod-neutrino-z-r" ]] && GdWorker="https://x01bd.zyc-files.workers.dev/8:/"

    [[ "$1" == "letoy-stock" ]] && GdWorker="https://lancelot.zyc-files.workers.dev/0:/"
    [[ "$1" == "letoy-neutrino" ]] && GdWorker="https://lancelot.zyc-files.workers.dev/1:/"
    [[ "$1" == "letoy-qk" ]] && GdWorker="https://lancelot.zyc-files.workers.dev/2:/"

    [[ "$1" == "merlin-stock" ]] && GdWorker="https://merlin.zyc-files.workers.dev/0:/"
    [[ "$1" == "merlin-neutrino" ]] && GdWorker="https://merlin.zyc-files.workers.dev/1:/"
    [[ "$1" == "merlin-qk" ]] && GdWorker="https://merlin.zyc-files.workers.dev/2:/"

    if [ ! -z "$GdWorker" ];then
        [ ! -z "$2" ] && GdWorker="$GdWorker/$2"
        [ ! -z "$3" ] && GdWorker="$GdWorker/$3"
        [ ! -z "$4" ] && GdWorker="$GdWorker/$4"
        [ ! -z "$5" ] && GdWorker="$GdWorker/$5"
        GdWorker="$GdWorker/$ZipName"
    fi
fi 
