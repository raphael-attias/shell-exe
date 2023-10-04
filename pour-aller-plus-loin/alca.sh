#!/bin/bash

email="raphael.attias@laplateforme.io"
password="wCNDF2FW"

url="https://alcasar.laplateforme.io"

curl -H -d "email=$email&password=$password" -X POST $url

