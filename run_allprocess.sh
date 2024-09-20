#!/bin/bash
#  Backround related with Wpm+0/1/2/3-jets, Wbb+0/1/2-jets and Wc+0/1/2-jets
#  are calculated with the help of MCFM package.
#  Events are generated and then the corss section values are determined with the help of MCFM.
#  Created by Nasuf Sönmez on Thursday, 28. Nov 2017 at 21:18.
#
#



# Wpm+0/1/2/3-jets
for i in 1 6 11 16 22 27
do
	sed -i "s/^[0-9]*    \[nproc\]/$i    [nproc]/g" input.DAT	
	sed -i "s/'[a-z]*'    \[part /'nlo'    [part /g" input.DAT

	if [ $i -eq 23 -o $i -eq 28 ]; then
		sed -i "s/'[a-z]*'    \[part /'lo'    [part /g" input.DAT
	fi
	./mcfm_omp > process_$i.txt

echo "$i is done"
done



# Wbb+0/1/2-jets
for i in 20 25 24 29 403 408
do
	sed -i "s/^[0-9]*    \[nproc\]/$i    [nproc]/g" input.DAT
	sed -i "s/'[a-z]*'    \[part /'nlo'    [part /g" input.DAT

	if [ $i -eq 24 -o $i -eq 29 ]; then
		sed -i "s/'[a-z]*'    \[part /'lo'    [part /g" input.DAT
	fi

	./mcfm_omp > process_$i.txt

echo "$i is done"
done



# Wc+0/1/2-jets
for i in 13 18
do
	sed -i "s/^[0-9]*    \[nproc\]/$i    [nproc]/g" input.DAT
	sed -i "s/'[a-z]*'    \[part /'nlo'    [part /g" input.DAT

	./mcfm_omp > process_$i.txt

echo "$i is done"
done
