#!/bin/bash

# get current time and date
time=$(date "+%H:%M")
date=$(date "+%d:%m:%Y")

# define alphabet array
alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
cap=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

# get current hour
hr=$(date "+%H")
hr=${hr#0} # remove leading zero if any

# shift the alphabet and capital arrays based on the hour
shifted_alpha=()
shifted_cap=()
for (( i=0; i<26; i++ )); do
    idx=$(( (i + hr) % 26 ))
    shifted_alpha[i]=${alpha[idx]}
    shifted_cap[i]=${cap[idx]}
done

# read the log file
logfile="/var/log/syslog"
logdata=$(cat -v "$logfile")

# encrypt the log data using the shifted alphabet
encrypted_data=$(echo "$logdata" | tr "${alpha[*]}" "${shifted_alpha[*]}" | tr "${cap[*]}" "${shifted_cap[*]}")

# create backup file name with timestamp
backup_file="encrypt_${time}_${date}.txt"

# write the encrypted data to backup file
echo -e  "$encrypted_data" > "/home/yohanneslex/soal4/$backup_file"