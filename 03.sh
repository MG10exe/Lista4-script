#!/bin/bash

function adicionarArquivo(){
	read -p 'Insira o nome do arquivo: ' arq
  	if [ -e $arq ]; then
		echo "Sucesso!"
		read -p "Aperte <enter> para continuar."
	else
		echo "ERRO: $arq não encontrado!"
		read -p "Aperte <enter> para continuar."
		break
	fi
}

function removerLetras(){
	sed -E 's/[a-Z]//g' < $arq || echo "ERRO: Arquivo não adicionado!"
}

function removerDigitos(){
  	sed -E 's/[0-9]//g' < $arq || echo "ERRO: Arquivo não adicionado!"
}

function substituirEspeciais(){
  	sed -E 's/\W|_/~/g' < $arq || echo "ERRO: Arquivo não adicionado!"
}

clear
while true; do
	echo -e "
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
	    Menu
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=\n
r - Digite o nome do arquivo que será processado
a - Remover todas as letras
b - Remover os digitos
c - Substituir todos os caracteres que não são letras nem dígitos de um arquivo por ~
q - Sair"
	read -p "Digite sua opção: " opc

  	case $opc in
		"r") adicionarArquivo ;;
    		"a") removerLetras && read -p "Aperte <enter> para continuar." ;;
    		"b") removerDigitos && read -p "Aperte <enter> para continuar." ;;
    		"c") substituirEspeciais && read -p "Aperte <enter> para continuar." ;;
    		"q") break ;;
    		*) echo -e "\nERRO: Escolha uma opção válida! " && read -p "Aperte <enter> para continuar." ;;
  	esac
	clear	
done
