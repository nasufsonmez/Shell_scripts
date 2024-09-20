#!/bin/bash

folder=denemev1;

	for file in deneme/*
	do
		i=$(($i+1));

		cat $file \
		| gsed 's/subM(\([0-9]*\))/subM\1/g' \
		| gsed 's/addM/ Plus/g' \
		| gsed 's/mulM/ Times/g' \
		| gsed 's/powM/ Power/g' \
		| gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
		| gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
		| gsed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
		| gsed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
		| gsed 's/SB/Sin[beta]/g' \
		| gsed 's/CB/Cos[beta]/g' \
		| gsed 's/MW2/80.403^2/g' \
		| gsed 's/MW/80.403/g' \
		| gsed 's/MU2/0.05^2/g' \
		| gsed 's/MU/0.05/g' \
		| gsed 's/MD2/0.01^2/g' \
		| gsed 's/MD/0.01/g' \
		| gsed 's/SW2/0.2315^2/g' \
		| gsed 's/SW/0.2315/g' \
		| gsed 's/CW2/0.7688/g' \
		| gsed 's/CW/0.8768/g' \
		> /Users/nsonmez/ALLFORMFILES/denemev1/son_${i} ;
		
		echo "$file is done"
	done
		
