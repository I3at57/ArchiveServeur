# ArchiveServeur

ArchiveServeur est notre implémentation du projet de LO14 à l'UTT, au semestre A21.

L'objectif de ce projet est de créer une commande nommée `vsh` qui permet la communication avec un serveur d'archive. Une description des contraintes du projet peut se trouver [ici](https://raw.githubusercontent.com/I3at57/ArchiveServeur/main/LO14-Projet-2021.pdf).

## Les Fonctions

* Lister les archives présentes sur le serveur.
* Créer une archive à partir du répertoire courant.
* Naviguer à travers une archive à distance sur le serveur à l'aide d'un shell personnalisé.
* Restaurer le contenu d'une archive.

## Contenu

* [Les Fonctions](#les-fonctions)
* [Les Modes de Fonctionnement](#les-modes-de-fonctionnement)
  * [Le mode list](#le-mode-list)
  * [Le mode create](#le-mode-create)
  * [Le mode browse](#le-mode-browse)
  * [Le mode extract](#le-mode-extract)
* [Le Fichier Archive](#le-fichier-archive)
* [Taches](#taches)

## Les Modes de Fonctionnement

La commande `vsh` comporte 4 modes de fonctionnement, accessible grace à un argument de ligne de commande correspondant. 

### Le mode list

`vsh -list nom_serveur port`

### Le mode create

`vsh -create nom_serveur port nom_archive`

### Le mode browse

`vsh -browse nom_serveur port nom_archive`

### Le mode extract

`vsh -extract nom_serveur port nom_archive`

## Le Fichier Archive

Une archive est un fichier qui permet de représenter l'arborescence d'un répertoire et le contenu de tout les fichiers de cette arborescence.
Chaque archive est en deux partie:

* Un header qui décrit l'arborescence des fichiers
* Un body qui décrit le contenu des fichiers

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