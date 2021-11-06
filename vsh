#!/bin/bash

# Ce fichier sera le script principal de la commande vsh
# (Je ne sais pas comment sont implémenté des commandes bash dans la vrai)

# Une des solution proposé est pour chaque mode de créer un script associé:
#   - vsh_liste
#   - vsh_create
#   - vsh_browse
#   - vsh_extract

# Le script suivant vsh sera donc un 'hub' qui appelle l'un de ces script en fonction des arguments