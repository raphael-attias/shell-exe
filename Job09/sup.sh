#!/bin/bash
# pour supprimer les user crées
# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Supprimer les utilisateurs créés à partir du fichier CSV
supprimer_utilisateurs() {
  while IFS=',' read -r username role; do
    # Supprimer l'utilisateur
    sudo userdel -r "$username"  # Supprime l'utilisateur et son répertoire personnel
    echo "Utilisateur $username supprimé."
  done < "$csv_file"
}

# Pour supprimer les utilisateurs, utilisez la commande suivante :
# ./accessrights.sh supprimer
if [ "$1" = "supprimer" ]; then
  supprimer_utilisateurs
fi
