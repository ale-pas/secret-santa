#!/bin/bash
lista=( $(cat lista_bns) )
lista2=( $(shuf lista_bns) )
lista3=( $(cat lista_esclusi) )
lenght=${#lista[@]}
for (( x=0; x<$lenght; x++ )) 
do
	if [[ "${lista[$x]}" == "${lista2[$x]}"  ]];
	then
		lista2=( $(shuf lista_bns) )
		x=0
	else

		for escl in "${lista3[@]}";
		do
			if [[ "${lista[$x]}" == "${lista2[$x]}" || "${lista[$x]}-${lista2[$x]}" == "$escl" || "${lista2[$x]}-${lista[$x]}" == "$escl" ]];
			then
				lista2=( $(shuf lista_bns) )
				x=0
			fi
		done
	fi
done
for (( x=0; x<$lenght; x++ )) 
do
	# echo "Ciao ${lista[$x]}, devi fare il regalo a ${lista2[$x]}" > "${lista[$x]}.txt"
	echo "${lista[$x]} ${lista2[$x]}" 
done
