#! /bin/bash
arquivo=$1

#Questao 1
quest1=`cat $arquivo | awk '{print$7}'| awk -F "/" '{print$3}' | sort | uniq -c | wc -l `
echo "$quest1"

#Questao 2
lista_comp=`cat "$arquivo" | awk '{print$10":"$5}' | sort`
lista_conteudos=`echo "$lista_comp" | awk -F ":" '{print$1}'| uniq`
bytes=0
for i in $lista_conteudos
do
	for line in $lista_comp
	do
		conteudo=`echo "$line" | awk -F ":" '{print$1}'`
		dados=`echo "$line" | awk -F ":" '{print$2}'`
		if [ "$i" = "$conteudo" ]
		then
			let bytes+=$dados
		fi
	done
	echo "$bytes"
	bytes=0
done

#Questao 3
quest3=`cat $arquivo | awk '{print$4}'| grep TCP_HIT | wc -l`
echo "$quest3"

#Questao 4
quest4=`cat $arquivo | awk '{print$4}'| grep TCP_MISS | wc -l`
echo "$quest4"

#Questao 5
quest5=`cat $arquivo | awk '{print$4}'| grep TCP_DENIED | wc -l`
echo "$quest5"

#Questao 6
quest6=`cat $arquivo | awk '{print$4}'| grep TCP_REFRESH_UNMODIFIED | wc -l`
echo "$quest6"

#Questao 7
inicio=`date -d '07/16/2022 07:44:37' +"%s"`
fim=`date -d '07/16/2022 07:44:51' +"%s"`
lista=`cat $arquivo | awk '{print$1}'`
count=0
for i in $lista
do
	if [[ "$i" > "$inicio" ]] && [[ "$i" < "$fim" ]]
	then
		((count++))
	fi
done
echo "$count"
