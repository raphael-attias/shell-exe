#!/bin/bash

# Vérification du nombre d'arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <nombre1> <opérateur> <nombre2>"
    exit 1
fi

nombre1="$1"
operateur="$2"
nombre2="$3"

# Remplacer "x" par "*" pour la multiplication
if [ "$operateur" == "x" ]; then
    operateur="*"
fi

# Vérification de l'opérateur et exécution de l'opération correspondante
case "$operateur" in
    +)
        resultat=$(($nombre1 + $nombre2))
        ;;
    -)
        resultat=$(($nombre1 - $nombre2))
        ;;
    \*)
        resultat=$(($nombre1 * $nombre2))
        ;;
    /)
        if [ "$nombre2" -eq 0 ]; then
            echo "Division par zéro impossible."
            exit 1
        fi
        resultat=$(awk "BEGIN {printf \"%.2f\", $nombre1 / $nombre2}")
        ;;
    *)
        echo "Opérateur invalide. Utilisation : $0 <nombre1> [x|+|-|/] <nombre2>"
        exit 1
        ;;
esac

echo "Résultat de l'opération : $resultat"
