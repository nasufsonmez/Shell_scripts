#!/bin/sh

for chan in s t2 t3 tw
do

	for var in 90 110 120 130
	do
		cd DATACARDSv2

		cp run_card_singletop_${chan}_mhc100.dat run_card_singletop_${chan}_mhc${var}.dat
		cp proc_card_mg5_singletop_${chan}_mhc100.dat proc_card_mg5_singletop_${chan}_mhc${var}.dat
		sed -i "s/mhc100/mhc${var}/g" run_card_singletop_${chan}_mhc${var}.dat
		sed -i "s/mHc100/mHc${var}/g" proc_card_mg5_singletop_${chan}_mhc${var}.dat
		sed -i "s/mhc100/mhc${var}/g" proc_card_mg5_singletop_${chan}_mhc${var}.dat		
		cd ../


		./bin/mg5 DATACARDSv2/proc_card_mg5_singletop_${chan}_mhc${var}.dat
		cd singletop_${chan}_mhc${var}

		cp ../DATACARDS/pythia_card.dat Cards/pythia_card.dat
		cp ../DATACARDS/delphes_card.dat Cards/delphes_card.dat
		cp ../DATACARDSv2/run_card_singletop_${chan}_mhc${var}.dat Cards/run_card.dat

		./bin/cleanall	
		echo " "
		./bin/madevent multi_run 30 singletop_${chan}_mhc${var} -f --laststep=delphes 
		echo " "
		exit 0;
		
	done
done
