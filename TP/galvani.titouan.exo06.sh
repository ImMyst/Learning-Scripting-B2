#!/bin/bash

echo "## Début création répertoire de travail ##"
mkdir -p ./tmp/$(basename $0)
echo "## Fin création répertoire de travail ##"

echo "## Début déplacement répertoire de travail ##"
cd ./tmp/$(basename $0)
echo "## Fin déplacement répertoire de travail ##"


function Menu {
    echo "";
    echo "1 - Créer un répertoire"
    echo "2 - Lister le répertoire courant"
    echo "3 - Supprimer un répertoire"
    echo "4 - Afficher les permissions d'un répertoire"
    echo "5 - Changer les permissions d'un répertoire"
    echo "6 - Afficher une aide"
    echo "7 - Quitter"
    echo "";
    echo -n "Votre choix: "
}

function dirExist {
    [ -d "$1" ]
}

function createDir {
    echo -n "Entrez le nom du répertoire à créer: " && read directory
    if ! dirExist $directory; then
        mkdir $directory
        echo "Répertoire '$directory' créé."
    else
        echo "Le répertoire '$directory' existe déjà."
    fi
}

function listDir {
    echo "Liste du répertoire courant ($(pwd)): " && tree
}

function delDir {
    echo -n "Entrez le nom du répertoire à supprimer: " && read directory
    if dirExists $directory; then
        rm -rf $directory
        echo "Répertoire '$directory' supprimé.";
    else
        echo "Le répertoire '$directory' n'existe pas.";
    fi
}

function showPermissions {
    echo -n "Entrez le nom d'un répertoire pour afficher ses permissions: " && read directory
    if dirExists $directory; then
        echo "Permissions du répertoire '$directory': $(stat -c '%a' $directory)"
    else
        echo "Le répertoire '$directory' n'existe pas.";
    fi
}

function changePermissions {
    echo -n "Entrez le nom d'un répertoire pour changer ses permissions: " && read directory
    if dirExists $directory; then
        echo -n "Entrez la nouvelle valeur des permissions pour le répertoire '$directory': " && read permissions
        chmod $permissions $directory
        echo "Les permissions du répertoire '$directory' ont été modifiées à $permissions."
    else
        echo "Le répertoire '$directory' n'existe pas."
    fi
}

function showHelp {
	echo "Voici, l'aide."
	echo "Bonne chance. :)"
}

while true; do

    Menu
    read choice && echo ""

    case $choice in
        1)  createDir
            ;;
        2)  listDir
            ;;
        3)  delDir
            ;;
        4)  showPermissions
            ;;
        5)  changePermissions
            ;;
        6)  showHelp
            ;;
        *)  exit 0
            ;;
    esac

done
