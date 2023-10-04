#!/bin/bash

email="raphael.attias@laplateforme.io"
password="wCNDF2FW"

url="https://alcasar.laplateforme.io/intercept.php"

curl -s -d "{\"email\":\"$email\",\"password\":\"$password\"}" -X POST $url
