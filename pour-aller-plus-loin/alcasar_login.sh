#!/bin/bash
curl -s -X POST "https://alcasar.laplateforme.io/intercept.php" -H 'Content-Type: multipart/form-data' -F "challenge=$(curl -s --head "http://neverssl.com" | grep -o -P '(?<=challenge\=)(.*)(?=\&called)')" -F "userurl=http://neverssl.com" -F "username=$1" -F "password=$2" -F "button=Authentication" -L
