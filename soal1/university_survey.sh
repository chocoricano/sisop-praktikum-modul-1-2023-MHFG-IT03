#!/bin/bash
echo -e "\n--5 universitas dengan ranking tertinggi di jepang-- \n"
grep 'Japan' universitas.csv | sort -n -t , -k 1 | head -n 5 | awk -F "," '{print $1","$2","$4}'
echo -e "\n--universitas dengan fsr score paling rendah--\n"
grep 'Japan' universitas.csv | sort -n -t , -k 1 | head -n 5 | sort -t, -k 9 | head -n 1 | awk -F "," '{print $2","$9}'
echo -e "\n--10 Universitas di jepang dengan ger rank paling tinggi--\n"
grep 'Japan' universitas.csv | sort -n -t , -k 20 | head -n 10 | awk -F "," '{print $2","$20}'
echo -e "\n--universitas paling keren di dunia--\n"
grep -i 'keren' universitas.csv
