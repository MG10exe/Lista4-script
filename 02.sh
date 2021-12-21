#!/bin/bash

total=$(wc -l < $1)
for (( i=1; i<=$total;i++ ))
do
  linha=$(sed -n ${i}p $1)
  user=$(echo $linha | awk '{print $1}')
  quantidadeDados=0
  for (( j=1; j<=$total;j++ ))
  do
    linha2=$(sed -n ${j}p $1)
    d=$(echo $linha2 | awk '{print $NF}')
    if [ $(echo $linha2 | awk '{print $1}') == $user ]; then
      let quantidadeDados=quantidadeDados+d
    fi
  done
  echo "O usuário $user baixou um total de $quantidadeDados" >> totalBaixado
done

cat totalBaixado | sort -n | uniq
rm totalBaixado
