#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"

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

if [[ $1 -lt 1 || $1 -gt 10 ]]; then
    echo "Vous devez indiquer un nombre d'utilisateurs à créer (entre 1 et 10).$$ unlock
fi

i=0
while [[ $i -lt $1 ]]; do


    echo "Entrez les informations du nouvel utilisateur ($(($i+1))/$1)"

    echo -n "Nom: " && read lastname
    echo -n "Prénom: " && read firstname


    echo -n "Environnement (bash, zsh ou sh): " && read environment

    while [[ $environment != "bash" && $environment != "zsh" && $environment != "sh" ]]; do
        echo -n "Environnement incorrect (bash, zsh ou sh): " && read environment
    done

    echo -n "Devons-nous initialiser le mot de passe ? (O/n): " && read password
    while [[ $password != "O" && $password != "n" ]]; do
        echo -n "Réponse incorrecte (O/n): " && read password
    done

    directory="$lastname.$firstname"
    if [ ! -d $directory ]; then


        mkdir $directory

        if [ $password == "O" ]; then

            echo "$lastname|$firstname|$environment" >> $directory/informations

            echo "$(openssl rand -base64 14)" >> $directory/.password
            echo "Arboresence du répertoire : " && tree -a $directory
            echo "Utilisateur '$firstname $lastname' créé."
        else

            echo "Initialisation du mot de passe refusée."
        fi

    else
        echo "Un utilisateur avec le même nom ou prénom existe déjà."
    fi

    ((i++))

done

echo "Création d'utilisateurs terminée."

unlock
