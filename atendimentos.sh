#!/bin/bash

mes=`date | awk '{print$2}'`

arq=`ls | grep $mes.txt`

if [ "$arq" = "$mes.txt" ]; then

## Arquivo existe!!
echo

else

touch $mes".txt"

fi

inserir_arq(){
nome=$1
op=$2

data=`date`

echo >> $mes".txt"
echo "###############################################################" >> $mes".txt"
echo >> $mes".txt"

if [[ $op == "1" ]]; then
	echo "------------------------ATENDIMENTO----------------------------" >>  $mes".txt"
fi

if [[ $op == "2" ]]; then
	echo "------------------------INSTALAÇAO-----------------------------" >>  $mes".txt"
fi

if [[ $op == "3" ]]; then
	echo "---------------------------REPARO------------------------------" >>  $mes".txt"
fi
echo >> $mes".txt"
echo "NOME / CPF:" $nome >> $mes".txt"
echo "DATA E HORA:" $data >> $mes".txt"  
echo >> $mes".txt"
echo "###############################################################" >> $mes".txt"
echo >> $mes".txt"
}


Menu(){
##clear
echo '----------------------------------------------'
echo '                    MENU                      '
echo '----------------------------------------------'
echo
echo 'Escolha a opção : '
echo "1 - INSERIR ATENDIMENTO"
echo "2 - INSERIR INSTALAÇAO"
echo "3 - INSERIR REPARO"
echo "4 - ULTIMO ATENDIMENTO"
echo "5 - QUANTIDADE DE ATENDIMENTOS"
echo "6 - Funções GIT_HUB"
echo "7 - Exit"
echo
echo -n "Qual a opção desejada :"
read opcao # read le a variável opcao

case $opcao in

1) Inserir_Atendimento;; # funcao Um
2) Inserir_Instalacao;; # funcao Dois 
3) Inserir_reparo;; # funcao Três
4) Verificar_ultimo;; # funcao Três
5) Quantidade_atendimentos;; # funcao Três
6) funcao_git;;
7) Sair ;;  # funcao Quatro
*) 'Opção desconhecida.' ; echo; Menu;;

esac
}

## ATENDIMENTO 

Inserir_Atendimento(){

echo
echo "CPF / NOME":
read nome
inserir_arq "$nome" $opcao
Menu
}

## INSTALAÇAO

Inserir_Instalacao(){

echo
echo "CPF / NOME":
read nome

inserir_arq "$nome" $opcao

Menu
}
## REPARO

Inserir_reparo(){

echo
echo "CPF / NOME":
read nome

inserir_arq "$nome" $opcao

Menu
}


Verificar_ultimo(){

tail -9 $mes".txt"

Menu
}

Quantidade_atendimentos(){

aten=`cat mar.txt | grep "ATENDIMENTO" | wc -l`
repa=`cat mar.txt | grep "REPARO" | wc -l`
inst=`cat mar.txt | grep "INSTALAÇAO" | wc -l`

echo 
echo "ATENDIMENTOS:" $aten
echo "REPARO:" $repa
echo "INSTALAÇAO:" $inst 

Menu	
}

funcao_git(){

./git.sh

Menu	
}

Sair(){

if [[ exit ]]; then
echo 'Saiu do programa...'
echo
fi


}

# Primeira função a ser executada no programa.
Menu
