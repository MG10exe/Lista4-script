#!/bin/bash

#Lado dos meninos
awk '{print $1" "$2}' < RankingGeral.txt > parte1f
awk '{print $3}' < RankingGeral.txt > parte2

sed 's/[0-9]\+//g' parte2 > parte3
tr 'Ranking' ' ' < parte3 > parte4f

paste parte1f parte4f > parte5
tr '\t' ' ' < parte5 > RankingMeninos.txt

rm parte1f parte2 parte3 parte4f parte5

#Lado das meninas
awk '{print $3}' < RankingGeral.txt > parte1
cat parte1 | sed 's/Luz/8/g' > parte2f
awk '{print $4" "$5}' < RankingGeral.txt > parte3
sed 's/8//g' < parte3 > parte4f

paste parte2f parte4f > parte5
tr '\t' ' ' < parte5 > RankingMeninas.txt

rm parte1 parte2f parte3 parte4f parte5
