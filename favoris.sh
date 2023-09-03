#!/bin/bash

#BACHNOU Samih
#MIST-12


#Variable :
FAV=~/.favoris_bash

# Ecriture de la fonction A (Add) pour sauvegarder un nouveau favori. Cette fonction prend un argument (une chaine sans espace) et ajoute le répertoire courant dans votre liste de favoris.
function A() {
    nom=$1
    PWD=$(pwd)
    echo "Le répertoire : $PWD"
    echo "Raccourci : $nom"
    echo "$nom -> $PWD" >> $FAV
}

# Ecriture de la fonction L (List) pour afficher la liste de tous les favoris.
function L() { 
    column -t $FAV
}

# Ecriture de la fonction R (Remove) pour supprimer un favori de la liste.
function R(){
    subst=~/.favoris_bash_faux
    # On crée un fichier substitue
    grep -vw "^$1" $FAV > $subst
    grep -vw "^$1" $subst > $FAV
    rm $subst
}

# Ecriture de la fonction C pour se déplacer dans un répertoire favori.
function C(){
    CHEMIN=$(grep -w "$1" $FAV | cut -d" " -f3)
    cd $CHEMIN
}