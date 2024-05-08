#!/bin/bash

# Définition du répertoire de sauvegarde
backup_dir="/backup/$USER"

# Affiche le menu des options
show_menu() {
    echo "Sélectionnez une option :"
    echo "  1) Copier les données utilisateur dans le répertoire de sauvegarde"
    echo "  2) Archiver les données et supprimer le répertoire original"
    echo "  3) Compresser l'archive tar et supprimer l'archive tar"
    echo "  4) Restaurer les données dans le répertoire utilisateur"
    echo "  5) Afficher l'aide"
    echo "  6) Quitter"
}

# Copie des données utilisateur
copy_data() {
    mkdir -p "$backup_dir"
    cp -r $HOME/* "$backup_dir"
    echo "Données copiées vers $backup_dir."
}

# Archivage des données
archive_data() {
    tar -cf "$backup_dir.tar" -C "$backup_dir" .
    rm -rf "$backup_dir"
    echo "Archive créée: $backup_dir.tar et répertoire original supprimé."
}

# Compression de l'archive
compress_archive() {
    xz -z "$backup_dir.tar"
    rm "$backup_dir.tar"
    echo "Compression réalisée: $backup_dir.tar.xz et archive tar supprimée."
}

# Restauration des données
restore_data() {
    tar -xf "$backup_dir.tar.xz" -C $HOME
    rm "$backup_dir.tar.xz"
    echo "Données restaurées dans $HOME et archive compressée supprimée."
}



# Boucle principale du script
while true; do
    show_menu
    read -p "Entrez votre choix (1-6): " choice
    case "$choice" in
        1)
            copy_data
            ;;
        2)
            archive_data
            ;;
        3)
            compress_archive
            ;;
        4)
            restore_data
            ;;
        5)
            read -p "Pour afficher l'aide, tapez --help : " help_command
            $help_command --help
            ;;
        6)
            echo "Fin du programme."
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez essayer de nouveau."
            ;;
    esac
done

