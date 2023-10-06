#!/bin/bash

# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Parcours du fichier CSV
while IFS=',' read -r id prenom nom mdp role; do

 # Créer un utilisateur avec le nom d'utilisateur du CSV
 sudo useradd -m -s /bin/bash -c "$prenom $nom" "$prenom$nom"

 # Définir le mot de passe pour l'utilisateur
 echo "$prenom$nom:$mdp" | sudo chpasswd

 # Vérifier le rôle pour attribuer des privilèges
 if [ "$role" = "Admin" ]; then
 sudo usermod -aG sudo "$prenom$nom"
 echo "Utilisateur $prenom $nom créé avec des privilèges de superutilisateur."
 else
 echo "Utilisateur $prenom $nom créé en tant qu'utilisateur standard."
 fi
 
done <"$csv_file"
