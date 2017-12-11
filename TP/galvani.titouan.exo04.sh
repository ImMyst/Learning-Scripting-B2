#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"
 
echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"

echo "Le répertoire courant est $(pwd)"

echo "Le nom du répertoire créer sera : " && read nomrepertoire 

if [ ! -d */$nomrepertoire ] ; then
    mkdir $nomrepertoire
else
exit 1
fi

filepath=$nomrepertoire/fichier

touch $filepath

if [ $(stat -c '%a' $filepath ) != "777"  ]; then
 chmod 777  $filepath
fi

stat $filepath
exit 0
