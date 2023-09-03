#!/bin/bash

#Variables
HOME=~
TACHES=$HOME/.todo_list

# Ecrire la fonction list lister les tâches en attente
function list(){
    nl -ba $TACHES
}

# Ecrire la fonction delt supprimer une tâche
function delt(){
    n=$1
    liste=$HOME/.liste
    nl -ba $TACHES > $liste
    tache=$(grep -w "$1" $liste | cut -d" " -f3-)
    pos_haut=$(($n - 1))
    pos_bas=$(($n + 1))
    subst=$HOME/.todo_list_faux
    head -n  $pos_haut $TACHES > $subst
    tail -n $pos_bas $TACHES >> $subst
    cat $subst > $TACHES
    rm $subst
    echo "La tâche $1 ($tache) est faite !"
}

# Ecrire la fonction add ajouter une tâche
function add(){
    n=$1
    shift
    tache=$@
    pos=$(($n - 1))
    subst=$HOME/.todo_list_faux
    head -n  $pos $TACHES > $subst
    echo "- $tache" >> $subst
    tail -n $n $TACHES >> $subst
    cat $subst > $TACHES
    rm $subst
    echo "La tâche $tache a été ajoutée en position $n."
}

# Ecrire la fonction todo qui rassemble les fonctions au dessus
function todo(){
    if [ "$1" == "delt" ]
    then
        delt $2
    elif [ "$1" == "add" ] 
    then
        shift
        add $@
    elif [ "$1" == "list" ]
    then
        list
    else
        echo "Les seuls premier paramètre possible sont: add ; delt ; list"
    fi
}