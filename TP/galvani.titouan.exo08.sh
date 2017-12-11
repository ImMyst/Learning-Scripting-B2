#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"

cmd_mkdir=$(which mkdir)

echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"


if [ -s ".lock" ]; then
    exit 0;
else
    echo $$ >> ".lock"
fi


function unlock {
    rm -f ".lock"
    exit 0
}

if [ "$(id -u)" == "0" ]; then
    echo "Vous ne pouvez pas lancer ce script en root"
    exit 1
fi

number=$(((RANDOM % 50) + 1))
current=0
attempts=0
values=()

echo "Un nombre entre 1 et 50 a été choisi. Vous devez le trouver en moins de 10 essais."

while [[ $current != $number && $attempts -lt 10 ]]; do
    ((attempts++))
    echo -n "Votre proposition (essai $attempts/10): " && read current
    values+=($current)

    if [ $current -lt $number ]; then
        echo "C'est plus."
    elif [ $current -gt $number ]; then
        echo "C'est moins."
    else
        echo "Bravo, vous avez trouvé en $attempts essai(s) !";
    fi
done

echo "Le nombre à trouver était $number"
echo "Vos propositions: ${values[@]}"

unlock
