#!/bin/bash

# Récupérer la date et l'heure actuelles dans le format souhaité (jour-mois-année-heure:minute)
Ctime=$(date +"%d-%m-%Y-%H:%M")

# Rechercher les lignes contenant "session opened for user $1" dans /var/log/auth.log
# où $1 est le premier argument passé au script (nom d'utilisateur)
# Puis compter le nombre de correspondances
count=$(cat /var/log/auth.log | grep "session opened for user $1" | wc -l)

# Créer une archive tar contenant le fichier "number_connection-$Ctime" avec un nom basé sur la date et l'heure
tar "-cf" "Backup/$Ctime.tar" "number_connection-$Ctime"

# Supprimer le fichier "number_connection-$Ctime" après l'avoir inclus dans l'archive
rm "number_connection-$Ctime"
