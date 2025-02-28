#!/bin/bash
logged_in_file="/home/denisa/proiect_so/logged_in_users.txt"

user_file="/home/denisa/proiect_so/users.csv"

read -p "Nume utilizator: " username

user_line=$(grep "^.*,${username},.*" "$user_file")

if ! grep -q "^$username$" "$logged_in_file"; then

  echo "Utilizatorul '$username' nu este autentificat."

else

read -sp "Parolă: " password

stored_hashed_password=$(echo "$user_line" | cut -d ',' -f 4)

pw_check_hash=$(echo "$password" | openssl sha256)

while [ "$pw_check_hash" != "$stored_hashed_password" ]; do

  echo "Parola este incorectă."

  read -sp "Parola Corecta: " password

 pw_check_hash=$(echo "$password" | openssl sha256) 

done

sed -i "/^$username$/d" "$logged_in_file"

echo "Deconectare reușită pentru '$username'."



fi

