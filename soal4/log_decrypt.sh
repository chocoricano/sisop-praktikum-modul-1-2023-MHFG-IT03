#!/bin/bash

# set file name
filename="encrypt"

# get current time and date
time=$(date "+%H:%M")
date=$(date "+%d:%m:%Y")

# set backup file name to decrypt
backup_file="${filename}_${time}_${date}.txt"

# read the encrypted data
encrypted=$(cat "/home/yohanneslex/soal4/$backup_file")

# get current hour
hour=$(date "+%H")
hour=$((10#$hour)) # remove leading zero if any

# define alphabet arrays
alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
cap=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

# shift the alphabet and capital arrays based on the hour
shifted_alpha=()
shifted_cap=()
for (( i=0; i<26; i++ )); do
    idx=$(( (i + hour) % 26 ))
    shifted_alpha[i]=${alpha[idx]}
    shifted_cap[i]=${cap[idx]}
done

# decrypt the data using the shifted alphabet and capital arrays
decrypted=$(echo "$encrypted" | tr "${shifted_alpha[*]}" "${alpha[*]}" | tr "${shifted_cap[*]}" "${cap[*]}")

# set file name to write decrypted data
decrypt_file="decrypt_${time}_${date}.txt"

# write the decrypted data to a new file
echo -e  "$decrypted" > "/home/yohanneslex/soal4/$decrypt_file"