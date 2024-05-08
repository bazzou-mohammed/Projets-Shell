
# Project Shell


## Objectif 

L'objectif de cet exercice est de concevoir une application shell qui offre plusieurs fonctionnalités liées à la gestion des packages système. Ces fonctionnalités comprennent la mise à jour des packages, le nettoyage du cache du gestionnaire de packages, la consultation des dépôts de packages pour vérifier l'existence d'un package à installer, et la vérification de l'existence d'un package localement. De plus, l'application doit être capable de sauvegarder les résultats de chaque option dans un fichier d'historique dédié. Enfin, elle doit également fournir une option d'aide pour afficher les instructions d'utilisation.

## Tâches à Automatiser
- Mise à jour des packages : Vérifier et installer les dernières mises à jour pour les packages installés.
- Nettoyage du cache du gestionnaire de packages : Supprimer les packages qui ne sont plus nécessaires.
- Vérification de l'intégrité des packages : Exécuter des outils de vérification du système pour la vérification de l'existence d'un package localement.
- Traçabilité des taches effectuées: Sauvegarder les résultats de chaque option dans un fichier d'historique dédié.

## Étapes du Projet

- Faire la mise à jour de tous les packages du système via l’option -up
- Faire le nettoyage du cache du gestionnaire des packages via l’option -clean
- Consulter les repos de packages existants afin de vérifier l’existence d’un package à installer via l’option -search «nom_package» (nécessité d’avoir la connexioninternet)
- Consulter le cache du gestionnaire des packages afin de vérifier l’existence d’un package localement via l’option -verify «nom_package»
- Pour chaque option utilisée, vous devrez sauvegarder son résultat dans un fichier nommé historique.txt
- l’option -h ou –help pour afficher le help




