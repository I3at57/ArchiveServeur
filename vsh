#!/bin/bash

# Ce fichier sera le script principal de la commande vsh
# (Je ne sais pas comment sont implémenté des commandes bash dans la vrai)

# Une des solution proposé est pour chaque mode de créer un script associé:
#   - vsh_liste
#   - vsh_create
#   - vsh_browse
#   - vsh_extract

# Le script suivant vsh sera donc un 'hub' qui appelle l'un de ces script en fonction des arguments

# $0 donne le chemin relatif du script par rapport au chemin dans lequel ce script a été appelé.
# realpath $0 donne le chemin absolu du script
# dirname donne le nom du dossier contenant le fichier / dossier reférencé par le chemmin passé en argument 
# (ici c'est le scrip vsh, donc cela nous donne le chemin absolu du dossier du projet).
# En combinant les deux, on peut obtenir le chemin absolu du dossier du projet --> $ROOT.

ROOT=$(dirname $(realpath $0))

if [ $# -lt 1 ] || [ $# -gt 4 ]; then 
	echo "Usage 0: vsh <mode> <host> <port> <nom_archive>"
	exit 1
fi

MODE=$1

case $MODE in
	-extract)
		HOST=${2:-"localhost"}
		PORT=${3:-"8080"}
		ARCHIVE=${4:-"archive"}
		$ROOT/script/vsh_extract $HOST $PORT $ARCHIVE
		;;
	-list)
		HOST=${2:-"localhost"}
		PORT=${3:-"8080"}
		ARCHIVE=${4:-"archive"}
		$ROOT/script/vsh_list $HOST $PORT
		;;
	-create)
		HOST=${2:-"localhost"}
		PORT=${3:-"8080"}
		ARCHIVE=${4:-"archive"}
		$ROOT/script/vsh_create $HOST $PORT $ARCHIVE
		;;
	-browse)
		HOST=${2:-"localhost"}
		PORT=${3:-"8080"}
		ARCHIVE=${4:-"archive"}
		$ROOT/script/vsh_browse $HOST $PORT $ARCHIVE
		;;
	-server)
		PORT=${2:-"8080"}
		$ROOT/script/vsh_server $PORT
		;;
	-help)
		cat $ROOT/doc.txt
		;;
	*)
		echo "Error: No mode found"
		exit 1
		;;
esac
