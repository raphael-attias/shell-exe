#!/bin/bash

# Vérifie si le nombre d'arguments est correct
if [ $# -ne 2 ]; then
    echo "Usage: $0 <nombre1> <nombre2>"
    exit 1
fi

# Additionne les deux nombres et affiche le résultat
resultat=$(($1 + $2))
echo "Résultat de l'addition : $resultat"
