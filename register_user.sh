#!/bin/bash
read -p "Nume utilizator: " username

while cut -d ',' -f 2 users.csv | grep -q "^$username$"; do
  echo "Un utilizator cu numele '$username' există deja."

  read -p "Incearca alt nume de utilizator:" username

done
read -p "Adresă e-mail: " email
read -sp "Parolă: " password

echo

read -sp "Confirmați parola: " confirm_password

echo
while [ "$password" != "$confirm_password" ]; do

  read -sp "Parolele nu coincid. Te rog sa introduci parola din nou:" confirm_password

echo

done
if [ "$password" == "$confirm_password" ]; then

echo "FELICITARI! Te-ai inregistrat cu succes"

echo

echo "Bine ai venit, $username!"

echo

fi
user_id=$(uuidgen)
hashed_password=$(echo "$password" | openssl sha256)
now=$(date +%Y-%m-%d_%H-%M-%S) 
user_dir="/home/denisa/proiect_so/$username"

mkdir "$user_dir"
echo "$user_id,$username,$email,$hashed_password,$user_dir,$now" >> users.csv
echo "Utilizatorul a fost inregistrat cu succes!"

while IFS=',' read -r ID USERNAME EMAIL PASSW DIRECTOR LASTLOG

do

echo "Id-ul este: $user_id"

echo "Username-ul tau este: $username"

echo "Email-ul este: $email"

echo "Parola: : $hashed_password"

echo "Directorul tau : $user_dir"

echo "Ultima oara cand te-ai logat: $now"

echo

echo -----------------------------------------------

done < <( tail -n 1 users.csv)





