#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"
 
echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"

echo "Le répertoire courant est $(pwd)"

echo "Nombre d'arguments = $#"

if [ $# ==  3 ]; then

 mkdir $1 $2 $3

 exit 0
else

 exit 1
fi

