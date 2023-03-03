#!/bin/bash

echo "Masukkan username:"
read username

while [[ -z "$username" ]]
do
    echo "Silakan isi username anda! Tidak boleh kosong!:"
    read username
done

if grep -q "^$username:" /users/users.txt; then
    echo "Silakan coba dengan username lain."
    echo "$(date '+%y/%m/%d %H:%M:%S') REGISTER: ERROR User $username already exists" >> log.txt
    exit 1
fi

echo "Masukkan password:"
read -s password

while ! [[ ${#password} -ge 8 && "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ ^[a-zA-Z0-9]+$ && "$password" != "$username" && "$password" != "chicken" && "$password" != "ernie" ]]
do
    echo "Password tidak memenuhi ketentuan keamanan. Silakan masukkan password yang sesuai:"
    read -s password
done

echo "$username:$password" >> /users/users.txt

echo "Registrasi berhasil!"
echo "$(date '+%y/%m/%d %H:%M:%S') REGISTER: INFO User $username registered successfully" >> log.txt
exit 0

