#!/bin/bash

# le premier parametre est le nom des deux fichier sans extention 
# le deuxieme paramètre est le nom de fichier qui contient les données d'entrée

echo -e "\n ***************************  jflex $1.lex ************************************************ \n"
jflex $1.lex  
echo -e "\n ***************************  cup $1.cup ************************************************** \n"
cup $1.cup
echo -e "\n ***************************  javac parser.java Yylex.java ******************************** \n"
javac parser.java Yylex.java sym.java
echo -e "\n ***************************  java parser < $2 ******************************************** \n"
java parser < $2
