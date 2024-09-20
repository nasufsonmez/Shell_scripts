#!/bin/bash
#  Formcalc run and testing possible polarization energy ranges.
#  Created by Nasuf Sönmez on Thursday, 1. June 2018 at 19:11.
#
#



for pol in  "--" "++" "-+" "+-" "uu"; do
for bp in  nonalign lowmh flavour; do
	./run_${bp}_type1 ${pol}uuu 00200,03000,00025
	./run_${bp}_type2 ${pol}uuu 00200,03000,00025
done
done


for bp in  lowmh nonalign; do
for pol in  "--" "-+" "+-" "++" "uu"; do
	./run_${bp}_type1 ${pol}uuu 200,3000,50
	./run_${bp}_type2 ${pol}uuu 200,3000,50
done
done



 ./run_lowmh_type2 uuuuu 200,3000,25



bp="flavour"
./run_${bp}_type1_yZ uuuuu 03000,03000,00001
./run_${bp}_type2_yZ uuuuu 03000,03000,00001
./run_${bp}_type1_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type1_deltay35 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay35 uuuuu 03000,03000,00001

bp="lowmh"
./run_${bp}_type1_yZ uuuuu 03000,03000,00001
./run_${bp}_type2_yZ uuuuu 03000,03000,00001
./run_${bp}_type1_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type1_deltay35 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay35 uuuuu 03000,03000,00001

bp="nonalign"
./run_${bp}_type1_yZ uuuuu 03000,03000,00001
./run_${bp}_type2_yZ uuuuu 03000,03000,00001
./run_${bp}_type1_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay34 uuuuu 03000,03000,00001
./run_${bp}_type1_deltay35 uuuuu 03000,03000,00001
./run_${bp}_type2_deltay35 uuuuu 03000,03000,00001



./run_${bp}_type1v2 uuuuu 03000,03000,00001
./run_${bp}_type2v2 uuuuu 03000,03000,00001
./run_${bp}_type1_deltay uuuuu 03000,03000,00001
./run_${bp}_type2_deltay uuuuu 03000,03000,00001
./run_${bp}_type1_ptZ uuuuu 03000,03000,00001
./run_${bp}_type2_ptZ uuuuu 03000,03000,00001


bp="nonalign"

./run_${bp}_type1v2 uuuuu 02500,02500,00001
./run_${bp}_type2v2 uuuuu 02500,02500,00001


bp="nonalign"

./run_${bp}_type1_deltaEta uuuuu 03000,03000,00001
./run_${bp}_type2_deltaEta uuuuu 03000,03000,00001

./run_${bp}_type1_deltay uuuuu 03000,03000,00001
./run_${bp}_type2_deltay uuuuu 03000,03000,00001
./run_${bp}_type1_ptZ uuuuu 03000,03000,00001
./run_${bp}_type2_ptZ uuuuu 03000,03000,00001


bp="lowmh"

./run_${bp}_type1v2 uuuuu 00500,03000,00025
./run_${bp}_type2v2 uuuuu 00500,03000,00025
./run_${bp}_type1_deltaEta uuuuu 03000,03000,00001
./run_${bp}_type2_deltaEta uuuuu 03000,03000,00001
./run_${bp}_type1_deltaEta uuuuu 03000,03000,00001
./run_${bp}_type2_deltaEta uuuuu 03000,03000,00001
./run_${bp}_type1_deltay uuuuu 03000,03000,00001
./run_${bp}_type2_deltay uuuuu 03000,03000,00001
./run_${bp}_type1_ptZ uuuuu 03000,03000,00001
./run_${bp}_type2_ptZ uuuuu 03000,03000,00001

./run_nonalign_type1v3 uuuuu 00500,03000,00025
./run_nonalign_type2v3 uuuuu 00500,03000,00025


./run_flavour_type2_deltaEta uuuuu 03000,03000,00001
