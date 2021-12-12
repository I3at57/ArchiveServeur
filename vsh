#!/bin/bash

# Ce fichier sera le script principal de la commande vsh
# (Je ne sais pas comment sont implémenté des commandes bash dans la vrai)

# Une des solution proposé est pour chaque mode de créer un script associé:
#   - vsh_liste
#   - vsh_create
#   - vsh_browse
#   - vsh_extract

# Le script suivant vsh sera donc un 'hub' qui appelle l'un de ces script en fonction des arguments

if [ $# == 2 ]
then
	MODE=$1
	PORT=$2
	HOST='NULL'
elif [ $# == 3 ]
then
	MODE=$1
	HOST=$2
	PORT=$3
elif [ $# == 4 ]
then
	MODE=$1
	HOST=$2
	PORT=$3
	ARCHIVE=$4
else
	echo "Usage 0: vsh <mode> <host> <port> <nom_archive>"
	exit 1
fi

# Beaucoup de vérifications des arguments
if ! [[ $MODE =~ ^-[a-z]+$ ]]
then
	echo "Usage 1: vsh <mode> <host> <port> <nom_archive>"
        exit 1
fi

if ! [[ $PORT =~ ^[0-9]*$ ]]
then
	echo "Usage 3: vsh <mode> <host> <port> <nom_archive>"
	exit 1
fi

if ! [[ $HOST =~ ^([0-9]{1,3}.){3}[0-9]{1,3}$ ]] && [ $HOST != 'NULL' ]
then
	if ! [[ $HOST =~ ^localhost$ ]]
	then
			echo "Usage 2: vsh <mode> <host> <port> <nom_archive>"
			exit 1
	fi
fi

case $MODE in
	-extract)
		script/vsh_extract $HOST $PORT $ARCHIVE
		;;
	-list)
		script/vsh_list $HOST $PORT
		;;
	-create)
		script/vsh_create $HOST $PORT $ARCHIVE
		;;
	-browse)
		script/vsh_browse $HOST $PORT $ARCHIVE
		;;
	-server)
		script/vsh_server $PORT
		;;
	*)
		echo "Error: No mode found"
		exit 1
		;;
esac
