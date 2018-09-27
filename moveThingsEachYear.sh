#!/bin/bash
ATUAL=`date '+%Y'`
ANTIGO=1970
echo -n "Digite um ano: "
read ANO
PROXIMO=`expr $ANO + 1`
## check if the value is higher or equal than the current year
if test $ANO -ge $ATUAL; then
	echo "Não é possível realizar o procedimento com o ano atual ou um ano futuro"
else
	## Check if the value is lower than 2014
	if test $ANO -le $ANTIGO; then
		echo "Ano inválido"
	else
		## Check if the file exist wiht the year
		if [ -d ./$ANO ]; then
			echo "Diretório já existente!"
			echo "Movendo os arquivos para o diretório correspondente ao ano"
			mv -v `find . -maxdepth 1 -newermt $ANO'0101' -not -newermt $PROXIMO'0101'` $ANO/
		else
			echo "Diretório inexistente"
			echo "Criando o diretório correspondente"
			mkdir $ANO
			echo "Movendo os arquivos para o diretório criado"
			mv -v `find . -maxdepth 1 -newermt $ANO'0101' -not -newermt $PROXIMO'0101'` $ANO/			
		fi
	fi
fi

