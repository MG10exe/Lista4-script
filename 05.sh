#!/bin/bash

arq=$1
read -p "Digite o nome do arquivo: " arq

sed -r 's/([0-9]{2})([0-9]{1})([0-9]{4})([0-9]{4})/\(\1) \2 \3-\4/g' < $arq
