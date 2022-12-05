#!/bin/bash
lista=( $(shuf lista_bns) )
lista_escl=( $(cat lista_esclusi) )
lenght=${#lista[@]}
ricalcolo=0


for (( x=0; x<$lenght; x++ )) 
do
	if (( "$x" == "$length-1" ))
	then
		for escl in "${lista_escl[@]}";
		do
			if [[ "${lista[$x]}-${lista[0]}" == "$escl" || "${lista[0]}-${lista[$x]}" == "$escl" ]];
			then
				lista=( $(shuf lista_bns) )
				x=0
				let ricalcolo+=1
			fi
		done
	else
		
		for escl in "${lista_escl[@]}";
		do
			if [[ "${lista[$x]}-${lista[$x+1]}" == "$escl" || "${lista[$x+1]}-${lista[$x]}" == "$escl" ]];
			then
				lista=( $(shuf lista_bns) )
				x=0
				let ricalcolo+=1
			fi
		done
	fi
done



for (( x=0; x<$lenght; x++ )) 
do
	if (( "$x" == "$lenght-1" ))
	then
		echo "Ciao ${lista[$x]}, devi fare il regalo a ${lista[0]}" > "${lista[$x]}.txt"
		echo "1 ${lista[$x]}  2 ${lista[0]}"
	else
		echo "Ciao ${lista[$x]}, devi fare il regalo a ${lista[$x+1]}" > "${lista[$x]}.txt"
		echo "1 ${lista[$x]}   2 ${lista[$x+1]}" 
	fi
done
echo "ricalcoli totali : $ricalcolo"
