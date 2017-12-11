#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"
 
echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"

echo "Le répertoire courant est $(pwd)"

if [ ! -d */A ] ; then
    mkdir A
fi

touch ./A/{01..05}

cp -R A/. B

tree */

echo "Ce fichier est le 01" >> B/01

cat B/01

echo "J'ajoute une ligne au fichier B/01" >> B/01

echo "Voici la phrase de fin"
exit 0

