#!/bin/bash


HOUR=$(date +%H)


if [ "$HOUR" -eq 0 ]; then
    
    download=1
else
    
    download="$HOUR"
fi

if [ "$1" = "download" ]; then

    folder_download="kumpulan_$(($(ls -d kumpulan_* | wc -l) + 1))"
    mkdir "$folder_download"
    
    for ((i = 1; i <= download; i++)); do
        file_download="perjalanan_$i"
        wget "https://id.wikipedia.org/wiki/Bali#/media/Berkas:TanahLot_2014.JPG" -O "$folder_download/$file_download"
    done

elif [ "$1" = "zip" ]; then

    zip_count=$(ls -l | grep -c "devil_[0-9]*\.zip")
    next_zip="devil_$((zip_count + 1)).zip"
    
    directory=$(find . -type d -name "kumpulan_*")
    
    zip -r $next_zip $directory
else
    echo "Usage: $0 [download|zip]"
    exit 1
fi
