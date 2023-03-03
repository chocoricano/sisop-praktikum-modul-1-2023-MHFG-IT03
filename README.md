# sisop-praktikum-modul-1-2023-MH/FG-IT03

## Laporan Resmi Modul 1 Praktikum Sistem Operasi 2023

---

### Kelompok IT03:

Andyana Muhandhatul Nabila 5027211029

Sedtia Prakoso Budi Tirto Arto 5027211014

Yohannes Hasahatan Tua Alexandro 5027211022

## SOAL 1

### Soal 1a

Tampilkan 5 Universitas dengan ranking tertinggi di Jepang

### Analisis soal:

Pada soal nomor 1a diminta untuk menampilkan 5 universitas di Jepang yang memiliki ranking tertinggi

### Cara penyelesaian soal 1a:

Digunakan syntac grep untuk mencari variable Japan pada file universitas kemudian menggunakan sort untuk mengurutkan sesuai dengan ranking digunakan head -n untuk mengambil 5 universitas teratas dan menggunakan awk untuk mengprint sesuai kolom ranking nama univeritas dan lokasinya

### Kendala

belum ada kendala dalam pengerjaan soal nomor 1a

### Source code

```sh
#!/bin/bash
echo -e "\n--5 universitas dengan ranking tertinggi di jepang-- \n"
grep 'Japan' universitas.csv | sort -n -t , -k 1 | head -n 5 | awk -F "," '{print $1","$2","$4}'
```

### Test output

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-02-at-23.09.29.jpg)](https://www.linkpicture.com/view.php?img=LPic6400ca9906b7b1204265949)

### Soal 1b

coba cari Faculty Student Score(fsr score) yang paling rendah diantara 5 Universitas di Jepang.

### Analisis soal:

Pada soal nomor 1b diminta untuk menampilkan dari 5 universitas di jepang yang memiliki fsr score terendah

### Cara penyelesaian soal 1b:

Digunakan syntac grep untuk mencari variable Japan pada file universitas kemudian menggunakan sort untuk mengurutkan sesuai dengan ranking tertinggi hingga terndah digunakan head -n untuk mengambil 5 universitas teratas kemudian mengurutkan dari 5 univeritas yang memiliki fsr score terendah dan diambil pada urutan pertama terendah dengan head dan menggunakan awk untuk mengprint sesuai kolom nama univeritas dan fsr score

### Kendala

kendala awal dalam soal ini adalah kesalahan dalam mengurutkan secara desc

### Source code

```sh
echo -e "\n--universitas dengan fsr score paling rendah--\n"
grep 'Japan' universitas.csv | sort -n -t , -k 1 | head -n 5 | sort -t, -k 9 | head -n 1 | awk -F "," '{print $2","$9}'
```

### Test output

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-02-at-23.09.43.jpg)](https://www.linkpicture.com/view.php?img=LPic6400ca9906b7b1204265949)

### Soal 1c

cari 10 Universitas di Jepang dengan Employment Outcome Rank(ger rank) paling tinggi.

### Analisis soal:

Pada soal nomor 1c diminta untuk mencari 10 universitas di Jepang yang memiliki ranking Employment Outcome Rank(ger rank) tertinggi

### Cara penyelesaian soal 1c:

Digunakan syntac grep untuk mencari variable Japan pada file universitas kemudian menggunakan sort untuk mengurutkan sesuai dengan ranking Employment Outcome Rank(ger rank) pada kolom ke 20 digunakan head -n untuk mengambil 10 universitas teratas dan menggunakan awk untuk mengprint sesuai kolom nama univeritas dan Employment Outcome Rank(ger rank)

### Kendala

kendala pada soal ini adalah salah memasukan nomor kolom, namun sudah teratasi

### Source code

```sh
echo -e "\n--10 Universitas di jepang dengan ger rank paling tinggi--\n"
grep 'Japan' universitas.csv | sort -n -t , -k 20 | head -n 10 | awk -F "," '{print $2","$20}'
```

### Test output

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-02-at-23.10.02.jpg)](https://www.linkpicture.com/view.php?img=LPic6400ca9906b7b1204265949)

### Soal 1d

Bocchi ngefans berat dengan universitas paling keren di dunia. Bantu bocchi mencari universitas tersebut dengan kata kunci keren.

### Analisis soal:

Pada soal nomor 1d diminta untuk mencari dan menampilkan universitas paling keren didunia dengan kata kunci keren

### Cara penyelesaian soal 1d:

Digunakan syntac grep untuk mencari variable keren dalam file universitas.csv

### Kendala

belum ada kendala dalam pengerjaan soal nomor 1d

### Source code

```sh
echo -e "\n--universitas paling keren di dunia--\n"
grep -i 'keren' universitas.csv

```

### Test output

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-02-at-23.10.19.jpg)](https://www.linkpicture.com/view.php?img=LPic6400ca9906b7b1204265949)

## SOAL 2

## Soal 2a

## Analisis Soal

pada soal nomor 2 ini diminta membuat script t untuk mendownload gambar sebanyak X kali dengan X sebagai jam sekarang (ex: pukul 16:09 maka X nya adalah 16 dst. Apabila pukul 00:00 cukup download 1 gambar saja). Gambarnya didownload setiap 10 jam sekali mulai dari saat script dijalankan. Adapun ketentuan file dan folder yang akan dibuat adalah sebagai berikut:
File yang didownload memilki format nama “perjalanan_NOMOR.FILE” Untuk NOMOR.FILE, adalah urutan file yang download (perjalanan_1, perjalanan_2, dst)
File batch yang didownload akan dimasukkan ke dalam folder dengan format nama “kumpulan_NOMOR.FOLDER” dengan NOMOR.FOLDER adalah urutan folder saat dibuat (kumpulan_1, kumpulan_2, dst)

## Cara penyelesaian

Cara penyelesaian pada soal 2a ini adalah dibuat code mengambil jam

```sh
HOUR=$(date +%H)


if [ "$HOUR" -eq 0 ]; then

    download=1
else

    download="$HOUR"
fi

```

hal ini berguna untuk menentukan berapa banyak gambar yang akan didownload. karena tadi terdapat pengecualian jika gambar diambil pada pukul 00 maka cukup didownload 1 gambar.

kemudian dibuat code yang berguna untuk membuat directory baru untuk file yang diunduh sebagai berikut

```sh
if [ "$1" = "download" ]; then

    folder_download="kumpulan_$(($(ls -d kumpulan_* | wc -l) + 1))"
    mkdir "$folder_download"

    for ((i = 1; i <= download; i++)); do
        file_download="perjalanan_$i"
        wget "https://id.wikipedia.org/wiki/Bali#/media/Berkas:TanahLot_2014.JPG" -O "$folder_download/$file_download"
    done
```

dibuat folder dengan ketentuan penamaan kumpulan_Nomor.folder dimana nomer foldernya dimuali dari satu dan seterusnya. kemudian untuk file disimpan dalam penamaan perjalanan_nomor.file yang dimulai dari satu hingga sejumlah gambar yang diunduh.

### Soal 2b

Kobeni harus melakukan zip setiap 1 hari dengan nama zip “devil_NOMOR ZIP” dengan NOMOR.ZIP adalah urutan folder saat dibuat (devil_1, devil_2, dst). Yang di ZIP hanyalah folder kumpulan dari soal di atas.

### Analisis Soal

diminta membuat script yang berguna untuk melakukan zip setiap 1 hari dengan nama zip “devil_NOMOR ZIP” dengan NOMOR.ZIP adalah urutan folder saat dibuat (devil_1, devil_2, dst). Yang di ZIP hanyalah folder kumpulan dari soal di atas.

### Penyelesaian soal

cara penyelesaian pada soal ini adalah dibuat program yang berguna untuk membuat zip dimana pada program terdapat zip_count yang berguna untuk mengecek atau menghitung berapa jumlah zip yang sudah terdapat dalam folder dan kemudian akan +1 dalam penamaannya misalnya sesuai dengan ketentuan devil_nomor.zip maka folder zip pertama dalam folder tersebut akan menjadi devil_1 dan seterusnya. Folder yang akan di zip adalah folder kumpulan.

```sh
elif [ "$1" = "zip" ]; then

    zip_count=$(ls -l | grep -c "devil_[0-9]*\.zip")
    next_zip="devil_$((zip_count + 1)).zip"

    directory=$(find . -type d -name "kumpulan_*")

    zip -r $next_zip $directory
```

digunakan argument untuk menjalankan fungsi masing-masing maksudnya adalah akan menjalankan fungsinya satu-satu tidak bersamaan, jika tidak maka program akan menjalankan secara bersamaan.

selain itu karena terdapat ketentuan dimana Gambarnya didownload setiap 10 jam sekali mulai dari saat script dijalankan dan melakukan zip setiap 1 hari maka dibuat cronjob yang berguna untuk melakukan scheduling pada program. Cara adalah menggunakan crontab.

```sh
0 */10 * * * /home/endieeey/soal2/kobeni_liburan.sh
0 0 * * * /home/endieeey/soal2/kobeni_liburan.sh
```

0 0: Menunjukkan waktu saat cronjob dijalankan, dalam format jam-menit. Angka 0 menunjukkan pukul 00:00 atau tengah malam.
_\*\* Menunjukkan rentang waktu untuk menjalankan cronjob, dalam format hari-bulan-tahun. Dalam kasus ini, tanda bintang (_) digunakan untuk menyatakan "setiap". Dengan demikian, cronjob ini akan dijalankan setiap hari, setiap bulan, dan setiap tahun.
/path/to/script.sh: Merupakan lokasi script yang akan dijalankan.

### Source code

```sh
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

```

### Test Output

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-03-at-00.20.39.jpg)](https://www.linkpicture.com/view.php?img=LPic6400db1745ce263287814)

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-03-at-00.20.12.jpg)](https://www.linkpicture.com/view.php?img=LPic6400db1745ce263287814)

[![image](https://www.linkpicture.com/q/WhatsApp-Image-2023-03-03-at-00.17.01.jpg)](https://www.linkpicture.com/view.php?img=LPic6400db1745ce263287814)

# Soal 3

# Analisis soal 3a

Pada nomor 3 diminta untuk membuat program register dan login yang sudah ditentukan dari soal.

Untuk program register ini dimulai dengan read agar nantinya user bisa menginput username dan password yang diinginkan. Kemudian dalam program menggunakan fungsi check dimana nanti mengecek sesuai setiap rules yang ada dari soal. Rules itu terdiri dari:

- Minimal 8 karakter
- Memiliki minimal 1 huruf kapital dan 1 huruf kecil
- Mengandung Alphanumeric
- Password tidak boleh sama dengan username
- Tidak boleh menggunakan kata chicken atau ernie

# Kendala 3a

Untuk kendala pada nomor 3a belum ada

# Source code 3a

```sh
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
```

# Cara pengerjaan 3a :

Pada soal ini diminta untuk membuat script louis.sh sebagai sistem registrasi kemudian data registrasi user disimpan dalam /users/user.txt dan log.txt untuk menyimpan status percobaan login dan register yang dilakukan oleh user beserta waktu nya.

Pada program ini mengecek mulai dari username tidak boleh kosong alias wajib diisi dengan menggunakan pengkondisian while yang apabila kondisi tersebut terpenuhi maka akan menampilkan output "Silakan isi username anda! Tidak boleh kosong!:" selanjutnya akan dilakukan pengecekan apakah username sudah masuk pada file users.txt atau belum, dan untuk mengeceknya saya menggunakan if grep untuk bisa melihat variabel username yang sudah ditentukan pada users.txt, dan jika memenuhi persayaratan if egrep tersebut maka program akan menampilkan output Silakan coba dengan username lain dan menuliskan data waktu registrasi serta teks berupa "REGISTER: ERROR User $username already exists" pada file log.txt.

Untuk selanjutnya dilakukan pengecekan untuk password dengan beberapa rules lainnya dengan menggunakan pengkondisian while yaitu: Ketika password panjangnya kurang dari 8 karakter, tidak memiliki huruf kecil, tidak memiliki huruf besar, tidak mengandung alphanumeric, password sama dengan username, dan password berupa "chicken" & "ernie" maka akan menampilkan output "Password tidak memenuhi ketentuan keamanan. Silakan masukkan password yang sesuai:" dan akan kembali pada input password.

Ketika password yang diinputkan oleh user telah memenuhi semua rules nya maka program ini akan menuliskan data dengan format "username : password" pada file /users/users.txt dan akan mengoutputkan "Registrasi berhasil!" serta menuliskan data waktu serta teks berupa "REGISTER: INFO User $username registered successfully" pada file log.txt.

# Test output

1. Tidak mengisi input username  
   ![](https://i.imgur.com/5jKElE6.png)
2. Input username : prakas dan password : prakas123
   ![](https://i.imgur.com/VkOQOnw.png)
3. Input username : prakas dan password : Pr4k4512
   ![](https://i.imgur.com/UH6NmTf.png)
4. Input username : prakas ketika sudah teregistrasi username prakas
   ![](https://i.imgur.com/akBPebP.png)

# Analisis soal 3b

Untuk program loginnya dimulai dengan read agar nantinya user bisa menginput username dan password yang diinginkan dengan setiap kali percobaan login dan register akan tercatat pada log.txt dengan format : YY/MM/DD hh:mm:ss MESSAGE

# Kendala 3b

Untuk kendala pada nomor 3b belum ada

# Source code 3b

```sh
#!/bin/bash

echo "Masukkan username:"
read username

while [[ -z "$username" ]]
do
    echo "Silakan isi username anda! Tidak boleh kosong!:"
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

```

# Cara pengerjaan 3b :

Pada program ini mengecek mulai dari username tidak boleh kosong alias wajib diisi dengan menggunakan pengkondisian while yang apabila kondisi tersebut terpenuhi maka akan menampilkan output "Silakan isi username anda! Tidak boleh kosong!:".

Selanjutnya dilakukan pencocokan untuk username dan password yang diinputkan user dengan username dan password yang telah tersimpan datanya didalam file log.txt dengan menggunakan if grep dan operator &&. Jika pernyataan kondisi tersebut bernilai true maka akan ditampilkan "Login berhasil!" serta dilakukan pencatatan data waktu dan teks berupa "LOGIN: INFO User $username logged in" pada file log.txt. Sedangkan jika pernyataan pengkondisian tersebut bernilai false maka akan menampilkan output "Username atau password salah. Silakan coba lagi." dan akan menuliskan data waktu serta teks "LOGIN: ERROR Failed login attempt on user $username" didalam file log.txt nya.

# Test output

1. Tidak mengisi input username  
   ![](https://i.imgur.com/JZtc1Re.png)
2. Input username : prakas dan password : prakas
   ![](https://i.imgur.com/Fz1pLFH.png)
3. Input username : yoga dan password : Pr4k4512
   ![](https://i.imgur.com/3pYezNW.png)
4. Input username : prakas dan password : Pr4k4512
   ![](https://i.imgur.com/M886rk7.png)

## Soal 4

Johan Liebert adalah orang yang sangat kalkulatif. Oleh karena itu ia mengharuskan dirinya untuk mencatat log system komputernya. File syslog tersebut harus memiliki ketentuan :

- Backup file log system dengan format jam:menit tanggal:bulan:tahun (dalam format .txt).
- Isi file harus dienkripsi dengan string manipulation yang disesuaikan dengan jam dilakukannya backup seperti berikut:
  - Menggunakan sistem cipher dengan contoh seperti berikut. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14
  - Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.
  - Setelah huruf z akan kembali ke huruf a
- Buat juga script untuk dekripsinya.
- Backup file syslog setiap 2 jam untuk dikumpulkan

### Analisis Soal 4

Diminta untuk membuat 2 file yaitu enkripsi dan dekripsi dari file syslog. Data yang dienkripsi hanyalah alphabet dengan metode urutan alphabet ditambahkan dengan digit jam yan tertera pada waktu backup file syslog.

### Kendala

Kendala yang terjadi adalah kebingungan saat mengambil atau mengakses 2 file secara bersamaan yaitu file enkripsi dan dekripsi.

### Source Code Soal 4

1. File log_enctrpt.sh

```sh
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
```

2. File log\_ decrypt.sh

```sh
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
```

### Cara Penyelesaian Soal 4

Membuat directory baru dengan nama folder "soal4" agar lebih mudah dipahami

```bash
mkdir [namaDirectory]
```

Kemudian ubahlah directory menjadi directory yang telah dibuat

```bash
cd [namaDirectory]
```

Kemudian buatlah 2 file berformat .sh yang berisikan enkripsi data syslog dengan nama file log_encrypt.sh dan dekripsi data syslog dengan nama log_decrypt.sh . Source code kedua file tersebut dapat dilihat pada kolom source code soal 4

Lalu ubahlah permission kedua file tersebut agar dapat diakses menggunakan perintah -x

```bash
chmod -x /[rootDirectory]/log_encrypt.sh
chmod -x /[rootDirectory]/log_decrypt.sh
```

Lalu installing crontab

```bash
crontab -e
```

Pada crontab aturlah menjadi setiap 2 jam untuk mengakses kedua file tersebut yakni enkripsi dan dekripsi secara bersamaan

```bash
0 */2 * * * /[rootDirectory]/log_encrypt.sh && /[rootDirectory]/log_decrypt.sh
```

Seperti gambar dibawah ini
[![image](https://www.linkpicture.com/q/crontab.jpeg)](https://www.linkpicture.com/view.php?img=LPic640145af7828f1324053268)

### Test Output Soal 4

1. Output File dekripsi yang filenya bernama log_decrypt.sh
   [![image](https://www.linkpicture.com/q/decrypt.jpeg)](https://www.linkpicture.com/view.php?img=LPic640145af7828f1324053268)
2. Output File enkripsi yang filenya bernama log_encrypt.sh
   [![image](https://www.linkpicture.com/q/encrypt.jpeg)](https://www.linkpicture.com/view.php?img=LPic640145af7828f1324053268)
   Disclaimer : Kedua output tersebut menggunakan crontab setiap 1 menit sebagai alat monitor debugging
   Dapat dicek bahwa kata "Kali" berubah menjadi "Rhsp" yang dimana:

- K = 11
- a = 1
- l = 12
- i = 9

Dan pada saat proses debugging menggunakan crontab, waktu menunjukkan jam 7, maka

- K = 11 + 7 = 18 (R)
- a = 1 + 7 = 8 (h)
- l = 12 + 7 = 19 (s)
- i = 9 + 7 = 16 (p)
