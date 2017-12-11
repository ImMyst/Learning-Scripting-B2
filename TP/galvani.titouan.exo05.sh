#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"

echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"

while true; do

    echo "Entrez un nom de répertoire : " && read directory

    if [ $directory == "exit" ]; then
        exit 0
    fi


    mkdir $directory || exit 1
    filepath=$directory/fichier


    touch $filepath


    if [ $(stat -c '%a' $filepath) != "777" ]; then
        chmod 777 $filepath
    fi

    stat $filepath
done
