# ArchiveServeur
 Projet de LO14, UTT, A21

L'objectif de ce projet est de créer une commande nommée vsh qui permet la communication avec un serveur d'archive.

• Une archive est un fichier qui permet de représenter l'arborescence d'un répertoire et le contenu de tout les fichiers de cette 
arborescence.

• Chaque archive est en deux partie:
    - Un header qui décrit l'arborescence des fichiers
    - Un body qui décrit le contenu des fichiers

Exemple d'archive complète:

    3:25
    directory Exemple\Test\
    A drwxr-xr-x 4096
    B drwxr-xr-x 4096
    toto1 -rwxr-xr-x 29 1 3
    toto2 -rw-r--r-- 249 4 10
    @
    directory Exemple\Test\A
    A1 drwxr-xr-x 4096
    A2 drwxr-xr-x 4096
    A3 drwxr-xr-x 4096
    toto3 -rw-r--r-- 121 14 3
    @
    directory Exemple\Test\A\A1
    toto4 -rw-r--r-- 0 17 0
    @
    directory Exemple\Test\A\A2
    @
    directory Exemple\Test\A\A3
    @
    directory Exemple\Test\B
    bar -rw-r--r-- 202 17 6
    @
    #!\bin\bash

    echo "bonjour!"
    NAME

    ls - list directory contents
    SYNOPSIS
    ls [OPTION]... [FILE]...
    DESCRIPTION
    List information about the FILEs.
    DESCRIPTION
    man formats and displays the on-line manual pages.
    NAME
    cat - concatenate files and print on the standard output
    SYNOPSIS
    cat [OPTION] [FILE]...
    DESCRIPTION
    Concatenate FILE(s), or standard input, to standard output.

• La commande vsh possède plusieurs mode:
    vsh -list nom_serveur port
        Affiche la liste des archives présentent sur le serveur nom_serveur.
        Le port, le numéro du port souhaité pour recevoir la requête.
    vsh -create nom_serveur port nom_archive
        Crée une archive nommée nom_archive sur le serveur nom_serveur.
        L'archive crée est alors l'archive du répertoire courant de la machine cliente.
    vsh -browse nom_serveur port nom_archive
        Explore le serveur nom_serveur
    vsh -extract nom_serveur port nom_archive
        Extrait le contenu d'une archive nom_archive dans le répertoire courant de la machine cliente.

• 