#!/bin/sh
# Aici se intituleaza folderul in care se vor salva utilizatorii activi
ROOT_DIR="./utilizatori_activi"

# Se face folderul daca nu exista (-p ca sa nu dea erori daca exista deja)
mkdir -p "$ROOT_DIR"

#loop infinit care se repeta la 30 de secunde
while true; do
    
    useri_activi=$(who | awk '{print $1}' | sort | uniq)
    echo $useri_activi

    # Se creeaza un folder pentru fiecare utilizator activ
    for user in $active_users; do
        user_dir="$ROOT_DIR/$user"

        if [ ! -d "$user_dir" ]; then
            mkdir -p "$user_dir"
        fi
        
    done
 
    sleep 30
done