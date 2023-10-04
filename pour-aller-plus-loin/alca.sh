#!/bin/bash

# Vérifier que les deux arguments (email et mot de passe) ont été fournis
if [ "$#" -ne 2 ]; then
 echo "Utilisation : ./alcasar_login username password"
 exit 1
fi

# Récupérer les arguments
username="$1"
password="$2"

# URL du formulaire de connexion Alcasar
url="https://alcasar.laplateforme.io/intercept.php?res=notyet&uamip=10.10.0.1&uamport=3990&challenge=d84d67b3a17247549d7297ff7ae707e9&called=68-05-CA-3A-2E-49&mac=BC-D0-74-71-85-15&ip=10.10.0.66&nasid=alcasar.laplateforme.io&sessionid=1696408259000000d8&ssl=https%3a%2f%2f1.0.0.1%3a3991%2f&userurl=http%3a%2f%2fneverssl.com%2f&md=27EAAEEE4AF561469466566BC288DF03"

button_class="App-Button"

# Envoi de la requête POST avec cURL pour se connecter et enregistrement du résultat dans un fichier temporaire
response_file=$(mktemp)
curl -i -d "username=$username&&password=$password" -X POST -d "$button_class" "$url" > "$response_file"

# Vérifier si la connexion a réussi en analysant la réponse
if grep -q "Welcome to ALCASAR" "$response_file"; then
 echo "Connexion réussie en tant que $username"
else
 echo "Échec de la connexion"
fi

# Supprimer le fichier temporaire
rm -f "$response_file"
