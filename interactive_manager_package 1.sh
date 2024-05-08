#!/bin/bash

# Chemin du fichier d'historique
HIST_FILE="historique.txt"

# Fonction pour afficher le menu et les options disponibles
function show_menu() {
    echo "Choisissez une option en tapant le numéro correspondant :"
    echo "1. Mettre à jour tous les packages du système"
    echo "2. Nettoyer le cache du gestionnaire des packages"
    echo "3. Rechercher un package dans les dépôts"
    echo "4. Vérifier l'existence d'un package dans le cache local"
    echo "5. Afficher l'aide"
    echo "6. Quitter"
}


# Boucle principale
while true; do
    show_menu
    read -p "Entrez votre choix : " choice
    case "$choice" in
        1)
            echo "Mise à jour de tous les packages..."
            sudo yum update 2>&1 | tee -a $HIST_FILE
            ;;
        2)
            echo "Nettoyage du cache..."
            sudo yum clean all 2>&1 | tee -a $HIST_FILE
            ;;
        3)
            read -p "Entrez le nom du package à rechercher : " pkg_name
            echo "Recherche du package '$pkg_name'..."
            sudo yum search "$pkg_name" 2>&1 | tee -a $HIST_FILE
            ;;
        4)
            read -p "Entrez le nom du package à vérifier : " pkg_name
            echo "Vérification de l'existence du package '$pkg_name' dans le cache..."
            sudo yum list "$pkg_name" 2>&1 | tee -a $HIST_FILE
            ;;
        5)
            read -p "Pour afficher l'aide, tapez --help : " help_command
            $help_command --help
            ;;
        6)
            echo "Quitter le script."
            break
            ;;
        *)
            echo "Option invalide, veuillez réessayer."
            ;;
    esac
done

