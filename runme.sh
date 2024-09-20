#!/bin/bash

folder=test3

# CLEANING STAFF
if [  -f dummy ]; then
	rm dummy ;
fi

if [  ! -d $folder ]; then
	mkdir  $folder ;
fi

if [ -d ${folder}  ]; then
	rm $folder/nasufcx* ;
fi


i=1 ; 
counter=1;
cat xa_v3  | while read line ; 
do
  if [ "$line" == "#" ] ;
  then
  	counter=$(($counter + 1)) ; 
	gsed -i ':a;N;$!ba;s/\n//g' dummy ;
	cat dummy >> $folder/nasufcxa_${i} ;
	rm  dummy ;

	if [ $counter -eq 3000 -o "$line" == 0 ] ;
	then
		cat $folder/nasufcxa_${i} \
		| gsed 's/subM(\([0-9]*\))/subM\1/g' \
		| gsed 's/addM/ Plus/g' \
		| gsed 's/mulM/ Times/g' \
		| gsed 's/powM/ Power/g' \
		| gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
		| gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
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
		> $folder/nasufcxb_${i}

		gsed -i ':a;N;$!ba;s/\n//g' $folder/nasufcxb_${i}
		rm $folder/nasufcxa_${i} ;
       	echo "I am in $i" ;
		counter=0 ;
		i=$(($i + 1)) ; 
		touch $folder/nasufcxa_${i} ; 
    	fi ; 
    	continue ;
  fi ; 
  echo "$line" | gsed 's/#//g' >> dummy ;

done 

rm dummy ;

echo "DONE" ;




cat nohup.out \
| gsed 's/ //g' \
| gsed ':a;N;$!ba;s/\n//g' \
| gsed 's/\;/\;\n/g' \
| gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' \
| gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
| gsed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| gsed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/USfC\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USfC[\1]/g' \
| gsed ':a;N;$!ba;s/USf\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USf[\1]/g' \
| gsed ':a;N;$!ba;s/mulM/Times/g' \
| gsed ':a;N;$!ba;s/powM/Power/g' \
| gsed ':a;N;$!ba;s/addM/Plus/g' \
| gsed ':a;N;$!ba;s/dotM/Plus/g' \
> nasuf


cat nohup.out \
| sed 's/ //g' \
| sed ':a;N;$!ba;s/\n//g' \
| sed 's/\;/\;\n/g' \
| sed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' \
| sed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| sed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
| sed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| sed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| sed ':a;N;$!ba;s/USfC\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USfC[\1]/g' \
| sed ':a;N;$!ba;s/USf\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USf[\1]/g' \
| sed ':a;N;$!ba;s/mulM/Times/g' \
| sed ':a;N;$!ba;s/powM/Power/g' \
| sed ':a;N;$!ba;s/addM/Plus/g' \
| sed ':a;N;$!ba;s/dotM/Plus/g' \
> nasuf


 gsed -i ':a;N;$!ba;s/sub\([0-9]*\)/sub[\1]/g' pol11_v6_1_1.m



  461  cat output-7-1-1_v2 | gsed 's/ //g' | gsed ':a;N;$!ba;s/\n//g' | gsed 's/\;/\;\n/g' | gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' | gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' | gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' | gsed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' | gsed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' | gsed ':a;N;$!ba;s/USfC\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USfC[\1]/g' | gsed ':a;N;$!ba;s/USf\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USf[\1]/g' | gsed ':a;N;$!ba;s/mulM/Times/g' | gsed ':a;N;$!ba;s/powM/Power/g' | gsed ':a;N;$!ba;s/addM/Plus/g' | gsed ':a;N;$!ba;s/dotM/Plus/g' > nasuf


  506  cat xaa | gsed ':a;N;$!ba;s/StageSortinthread[0-9]*\n//g' | gsed 's/ //g' | gsed ':a;N;$!ba;s/\n//g' | gsed 's/\;/\;\n/g' | gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' | gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' | gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' | gsed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' | gsed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' | gsed ':a;N;$!ba;s/USfC\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USfC[\1]/g' | gsed ':a;N;$!ba;s/USf\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USf[\1]/g' | gsed ':a;N;$!ba;s/mulM/Times/g' | gsed ':a;N;$!ba;s/powM/Power/g' | gsed ':a;N;$!ba;s/addM/Plus/g' | gsed ':a;N;$!ba;s/dotM/Plus/g' > sub_xaa

  436  cat xaa | gsed ':a;N;$!ba;s/StageSort in thread [0-9]*\n//g' 
  | gsed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' 
  | gsed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' 
  | gsed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' 
  | gsed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' 
  | gsed 's/ //g' | gsed ':a;N;$!ba;s/\n//g' 
  | gsed 's/\;/\;\n/g' 
  | gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' 
  | gsed 's/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' 
  | gsed 's/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' 
  | gsed 's/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' 
  | gsed 's/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' 
  | gsed ':a;N;$!ba;s/USfC\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USfC[\1]/g' 
  | gsed ':a;N;$!ba;s/USf\([0-9]\,[0-9]\,[0-9]\,[0-9]\)/USf[\1]/g' \
  > sub_xaa

