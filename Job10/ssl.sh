#!/bin/bash

# URL de la page neverssl.com (extrait du challenge dans l'URL)
url="http://neverssl.com/?challenge=d84d67b3a17247549d7297ff7ae707e9"

# Utilisez awk pour extraire le challenge de l'URL
challenge=$(echo "$url" | awk -F'challenge=' '{print $2}')

if [ -n "$challenge" ]; then
    echo "Challenge récupéré : $challenge"
else
    echo "Échec de la récupération du challenge."
fi


