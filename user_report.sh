#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Foloseste urmatoarea sintaxa: source user_raport.sh  <username>"
  return 1
fi
username="$1"
user_dir="/home/denisa/proiect_so/$username" 
if [ ! -d "$user_dir" ]; then

  echo "Utilizatorul '$username' nu există sau nu are un director personal."

  return 1
fi
num_files=$(find "$user_dir" -type f | wc -l)
num_dirs=$(find "$user_dir" -type d | wc -l)
num_dirs=$((num_dirs - 1))
total_size=$(du -sh "$user_dir" | cut -f1)
echo "Raport utilizator '$username':" > "$user_dir/raport"
echo "Numărul de fișiere: $num_files" >> "$user_dir/raport"
echo "Numărul de directoare: $num_dirs" >> "$user_dir/raport"
echo "Dimensiunea totală a fișierelor: $total_size" >> "$user_dir/raport"
echo "Raport generat cu succes pentru utilizatorul '$username'."
