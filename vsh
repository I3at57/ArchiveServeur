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
HOST=${2:-"localhost"}
PORT=${3:-"8080"}
ARCHIVE=${4:-".archive"}


if ! [[ $MODE =~ ^-(list|extract|create|browse|server)$ ]]; then
	echo ERROR: \"$MODE\" n\'est pas un mode.
	exit 1
fi

if ! [[ $PORT =~ ^[0-9]*$ ]]
then
	echo ERROR: Le port \"$PORT\" n\'est pas un port valid.
	exit 1
fi

case $MODE in
	-extract)
		$ROOT/script/vsh_extract $HOST $PORT $ARCHIVE
		;;
	-list)
		$ROOT/script/vsh_list $HOST $PORT
		;;
	-create)
		$ROOT/script/vsh_create $HOST $PORT $ARCHIVE
		;;
	-browse)
		$ROOT/script/vsh_browse $HOST $PORT $ARCHIVE
		;;
	-server)
		$ROOT/script/vsh_server $PORT
		;;
	*)
		echo "Error: No mode found"
		exit 1
		;;
esac
