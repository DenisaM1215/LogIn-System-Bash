#!/bin/bash

users_file="/home/denisa/proiect_so/users.csv"

logged_in_file="/home/denisa/proiect_so/logged_in_users.txt"

read -p "Nume utilizator: " username


user_line=$(grep "^.*,${username},.*" "$users_file")

while  [ -z "$user_line" ]; do

  echo "Numele de utilizator '$username' nu există."

  read -p "Try Again: " username

user_line=$(grep "^.*,${username},.*" "$users_file")

done

if [ ! -z "$user_line" ]; then

read -sp "Parolă: " password

fi



stored_hashed_password=$(echo "$user_line" | cut -d ',' -f 4)

pw_check_hash=$(echo "$password" | openssl sha256) 


while [ "$pw_check_hash" != "$stored_hashed_password" ]; do

  echo "Parola este incorectă."

  read -sp "Introdu parola corecta: " password

  pw_check_hash=$(echo "$password" | openssl sha256) 



done

now=$(date "+%Y-%m-%d %H:%M:%S")

user_line=$(grep "^.*,${username},.*" "$users_file")

new_user_line=$(echo "$user_line" | sed "s|\(.\),[^,]$|\1,$now|")

sed -i "s|^.,$username,.$|$new_user_line|" "$users_file"

if ! grep -q "^$username$" "$logged_in_file"; then

  echo "$username" >> "$logged_in_file"

fi

 

user_id=$(echo "$user_line" | cut -d ',' -f 1)

email=$(echo "$user_line" | cut -d ',' -f 3)

user_dir=$(echo "$user_line" | cut -d ',' -f 5)

now=$(echo "$user_line" | cut -d ',' -f 6)

echo "Autentificare reușită pentru '$username'."



while IFS=',' read -r ID Username Email Password Home_Director Last_Login

do

echo "Id-ul este: $user_id"

echo "Username-ul tau este: $username"

echo "Email-ul este: $email"

echo "Parola ta care nu se vede :)) : $hashed_password"

echo "Directorul tau : $user_dir"

echo "Ultima oara cand te-ai logat: $now"

echo

echo -----------------------------------------------

done < <( tail -n 1 users.csv)

cd "/home/denisa/proiect_so/$username" 
