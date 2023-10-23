#!/bin/bash

#bonjour

if [ "$1" == "Hello" ]; then
	echo "Bonjour, je suis un script !"

# au revoir

elif [ "$1" == "Bye" ]; then
	echo "Au revoir et bonne journée !"

else
	echo "c'est pas le bon mot"
fi
