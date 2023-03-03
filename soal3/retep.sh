#!/bin/bash

echo "Masukkan username:"
read username

while [[ -z "$username" ]]
do
    echo "Silakan isi username anda! Tdak boleh kosong!:"
    read username
done

echo "Masukkan password:"
read -s password

if grep -q "^$username:" /users/users.txt && grep -q "^$username:$password$" /users/users.txt; then
    echo "Login berhasil!"
    echo "$(date '+%y/%m/%d %H:%M:%S') LOGIN: INFO User $username logged in" >> log.txt
    exit 0
else
    echo "Username atau password salah. Silakan coba lagi."
    echo "$(date '+%y/%m/%d %H:%M:%S') LOGIN: ERROR Failed login attempt on user $username" >> log.txt
    exit 1
fi
