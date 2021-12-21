#!/bin/bash

arq=$1

read -p "Digite o nome do arquivo: " arq

sed -E 's/\b([0-9]{1,3}\.){3}[0-9]{1,3}\b/**!!CENSU--RADO!!**/g' < $arq
