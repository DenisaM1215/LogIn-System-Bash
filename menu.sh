#!/bin/bash

#./register_user.sh

#./login.sh

#./logout.sh

#./user_raport.sh

echo "1.Inregistrare"

echo "2.Conectare"

echo "3.Deconectare"

echo "4.Cu nimic. Pa-Pa!"

while true; do

read -p "Cu ce te pot ajuta?" choice

if [ $choice -eq 1 ]; then

./register_user.sh

elif [ $choice -eq 2 ]; then

./login.sh

elif [ $choice -eq 3 ]; then

./logout.sh

elif [ $choice -eq 4 ]; then

echo "bye"

break

else 

echo "Te rog alege o optiune valida 1-4"

fi

done
