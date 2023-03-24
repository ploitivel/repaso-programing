#!/bin/bash
source ./desing_cfg.sh

printf "$(
    
    titulo "Diferencias entre 2 archivos o directorios"
    text "Todos estos comandos comparan 2 archivos o carpetas"
    comando "diff -rq carpeta1 carpeta2" "Parametro -rq indica que comparemos recursivamente 'r' y sólo los archivos diferentes 'q'"
    comando "diff Archivo1 Archivo2"
)"

