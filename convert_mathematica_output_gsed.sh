#!/bin/bash

split -l 5000000 squaredme2_v2.out

for i in a b c d e f g h i
do

cat xa${i} \
| gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM\1/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*\(subM[0-9]*\)/*\1\n/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| gsed ':a;N;$!ba;s/addM/Plus/g' \
| gsed ':a;N;$!ba;s/mulM/Times/g' \
| gsed ':a;N;$!ba;s/powM/Power/g' \
| gsed ':a;N;$!ba;s/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \

| gsed ':a;N;$!ba;s/SB/Sin[beta]/g' \
| gsed ':a;N;$!ba;s/CB/Cos[beta]/g' \
| gsed ':a;N;$!ba;s/MW2/80.403^2/g' \
| gsed ':a;N;$!ba;s/MW/80.403/g' \
| gsed ':a;N;$!ba;s/MU2/0.05^2/g' \
| gsed ':a;N;$!ba;s/MU/0.05/g' \
| gsed ':a;N;$!ba;s/MD2/0.01^2/g' \
| gsed ':a;N;$!ba;s/MD/0.01/g' \
| gsed ':a;N;$!ba;s/SW2/0.2315^2/g' \
| gsed ':a;N;$!ba;s/SW/0.2315/g' \
| gsed ':a;N;$!ba;s/CW2/0.7688/g' \
| gsed ':a;N;$!ba;s/CW/0.8768/g' \
| gsed ':a;N;$!ba;s/\=/->/g' \
| gsed ':a;N;$!ba;s/\;/,/g' \
> test$i

echo "$i is done"
done



#!/bin/bash
line=`grep -n Squared squaredme2.out  | awk -F ":" '{printf $1}'`

#first part of the file
head -n+$line squaredme2.out > firstpart
sed -i 's/TEST/ /g' firstpart

cat firstpart \
| gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM\1/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*\(subM[0-9]*\)/*\1\n/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| gsed ':a;N;$!ba;s/addM/Plus/g' \
| gsed ':a;N;$!ba;s/mulM/Times/g' \
| gsed ':a;N;$!ba;s/powM/Power/g' \
| gsed ':a;N;$!ba;s/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/\=/->/g' \
| gsed ':a;N;$!ba;s/\;/,/g' \
| gsed ':a;N;$!ba;s/subM1\-\>/{subM1->/g' \
> firstpart_v2


#second part of the file
tail -n+$line squaredme2.out | sed 's/\;//' | sed 's/SquaredME \=//g'> secondpart

split -l 5000000 secondpart

for i in a b c d e f g h i
do

cat xa${i} \
| gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM\1/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*\(subM[0-9]*\)/*\1\n/g' \
| gsed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| gsed ':a;N;$!ba;s/addM/Plus/g' \
| gsed ':a;N;$!ba;s/mulM/Times/g' \
| gsed ':a;N;$!ba;s/powM/Power/g' \
| gsed ':a;N;$!ba;s/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
| gsed ':a;N;$!ba;s/SB/Sin[beta]/g' \
| gsed ':a;N;$!ba;s/CB/Cos[beta]/g' \
| gsed ':a;N;$!ba;s/MW2/80.403^2/g' \
| gsed ':a;N;$!ba;s/MW/80.403/g' \
| gsed ':a;N;$!ba;s/MU2/0.05^2/g' \
| gsed ':a;N;$!ba;s/MU/0.05/g' \
| gsed ':a;N;$!ba;s/MD2/0.01^2/g' \
| gsed ':a;N;$!ba;s/MD/0.01/g' \
| gsed ':a;N;$!ba;s/SW2/0.2315^2/g' \
| gsed ':a;N;$!ba;s/SW/0.2315/g' \
| gsed ':a;N;$!ba;s/CW2/0.7688/g' \
| gsed ':a;N;$!ba;s/CW/0.8768/g' \
| gsed ':a;N;$!ba;s/\=/->/g' \
| gsed ':a;N;$!ba;s/\;/,/g' \
> test$i

echo "$i is done"
done

head -1000 xa_v2 | awk '/#/{e=0}/^#[ ]*\n/{gsub("^#[ ]*\n","",$0);e=1}{if(e==1){print}}' 

head -100000 nasuf |  awk '
/^##/   { inBlock=0 } 
inBlock { print > outfile }
/^##/ { inBlock=1; outfile = "outfile" ++count }'

head -100000 nasuf | awk 'sub(/^##/, ""){out=sprintf("out%d", c++); p=1}
     sub(/^#/, "")sub(/\n/, ""){print > out; p=0} p{print > out}'


cat xa_v3 | awk '/^#/&&v++==3000{sub(/^#/, "##");v==0;}{print}' > nasuf 

awk '
/^#/ { filename = sprintf("out%04d.txt", ++count) ; next }
/^#/ { next }
{ print > filename }' xaa_v3



awk 'sub(/^#/, ""){out=sprintf("deneme/out%d", c++); p=1}
     sub(/^#/, ""){print > out; p=0; counter++; } p {print > out}'  xaa_v3


rm deneme/*; cat xa_v3 | awk 'BEGIN {n_seq=1;file=sprintf("deneme/mynewsplit%i",n_seq);} /^#/ {if(n_seq%3000==0){file=sprintf("deneme/mynewsplit%i",n_seq);} sub("#",""); print >> file; n_seq++; next;} { print >> file; }' 
| sed ':a;N;$!ba;s/\n[ ]*\(\+[ ]*[0-9]*\/[0-9]*\)\*/\n#\n\1/g' 
  
sed -i 's/\n//g' mynewsplit999000
sed -i 's/#//g' mynewsplit999000

for i in a b c d e f g h i
do

cat xa${i} \
| sed ':a;N;$!ba;s/\n[ ]*\(\-[ ]*[0-9]*\/[0-9]*\)\*/\n#\n\1/g' \
| sed ':a;N;$!ba;s/\n[ ]*\(\+[ ]*[0-9]*\/[0-9]*\)\*/\n#\n\1/g' \
> xa${i}_v3

done



i=0 ; 
counter=0;
head -1000 test  | while read line ; 
do
  if [ "$line" == "#" ] ;
  then
  	counter=$(($counter + 1)) ; 
    
    if [ $counter -eq 1000 ] ; 
	then
    	counter=0;
    	i=$(($i + 1)) ; 
    	touch test1/nasufcxa_${i} ; 
    fi
    
    continue ;
  fi ; 
  echo "$line" \
| sed 's/#//g' \

| sed ':a;N;$!ba;s/subM(\([0-9]*\))/subM\1/g' \
| sed ':a;N;$!ba;s/\n[ ]*\*\(subM[0-9]*\)/*\1\n/g' \
| sed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| sed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| sed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| sed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| sed ':a;N;$!ba;s/addM/Plus/g' \
| sed ':a;N;$!ba;s/mulM/Times/g' \
| sed ':a;N;$!ba;s/powM/Power/g' \
| sed ':a;N;$!ba;s/MNeu2\[\([0-9]\)\]/MNeu2[\1,M1,M2,mu,beta]/g' \
| sed ':a;N;$!ba;s/MNeu\[\([0-9]\)\]/MNeu[\1,M1,M2,mu,beta]/g' \
| sed ':a;N;$!ba;s/ZNeu\[\([0-9]\,[0-9]\)\]/ZNeu[\1,M1,M2,mu,beta]/g' \
| sed ':a;N;$!ba;s/ZNeuC\[\([0-9]\,[0-9]\)\]/ZNeuC[\1,M1,M2,mu,beta]/g' \
| sed ':a;N;$!ba;s/SB/Sin[beta]/g' \
| sed ':a;N;$!ba;s/CB/Cos[beta]/g' \
| sed ':a;N;$!ba;s/MW2/80.403^2/g' \
| sed ':a;N;$!ba;s/MW/80.403/g' \
| sed ':a;N;$!ba;s/MU2/0.05^2/g' \
| sed ':a;N;$!ba;s/MU/0.05/g' \
| sed ':a;N;$!ba;s/MD2/0.01^2/g' \
| sed ':a;N;$!ba;s/MD/0.01/g' \
| sed ':a;N;$!ba;s/SW2/0.2315^2/g' \
| sed ':a;N;$!ba;s/SW/0.2315/g' \
| sed ':a;N;$!ba;s/CW2/0.7688/g' \
| sed ':a;N;$!ba;s/CW/0.8768/g' \
| sed ':a;N;$!ba;s/\=/->/g' \
| sed ':a;N;$!ba;s/\;/,/g' \
  >> test1/nasufcxa_${i} ;
done





tail -100 testson2 \
| gsed ':a;N;$!ba;s/\(\[A-Z*a-z*\]\)\[\([0-9]\)\,\n[ ]*\([0-9]\)\]\*/\1[\2,\3]*\n/g' \
| gsed ':a;N;$!ba;s/\(\[A-Z*a-z*\]\)\[\n[ ]*\([0-9]\)\,\([0-9]\)\]\*/\1[\2,\3]*\n/g' 

cat test[a-i] > testson2




cat testson2 \
| sed 's/MW2/80.403^2/g' \
| sed 's/MW/80.403/g' \
| sed 's/MU2/0/g' \
| sed 's/MU/0/g' \
| sed 's/MD2/0/g' \
| sed 's/MD/0/g' \
| sed 's/SW/0.2315/g' \
| sed 's/SW2/0.2315^2/g' \
| sed 's/CW2/0.7688/g' \
| sed 's/CW/0.8768/g' \
> testson3

cat xaa \
| sed 's/MNeu2\[\(1\)\]/MNeu2[\1,M1,M2,\\[Mu],\\[Beta]]/g' \
| sed 's/MNeu\[\(1\)\]/MNeu[\1,M1,M2,\\[Mu],\\[Beta]]/g' \
| sed 's/ZNeu\[\(1\)\]/ZNeu[\1,M1,M2,\\[Mu],\\[Beta]]/g' \
| sed 's/ZNeuC\[\(1\)\]/ZNeuC[\1,M1,M2,\\[Mu],\\[Beta]]/g' \
> xaa_new


split -l 5000000 nohup.out

for i in a b c d e f g
do
cat xaa \
| gsed ':a;N;$!ba;s/StageSort in thread [0-9]*\n//g' \
| gsed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| gsed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| gsed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| gsed 's/ //g' \
| gsed ':a;N;$!ba;s/\n//g' \
| gsed 's/\;/\;\n/g' \
| gsed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' \
| gsed 's/ZNeu(\([0-9]\,[0-9]\))/ZNeu[\1,M1,M2,mu,beta]/g' \
| gsed 's/ZNeuC(\([0-9]\,[0-9]\))/ZNeuC[\1,M1,M2,mu,beta]/g' \
| gsed 's/MNeu(\([0-9]\))/MNeu[\1,M1,M2,mu,beta]/g' \
| gsed 's/MNeu2(\([0-9]\))/MNeu2[\1,M1,M2,mu,beta]/g' \
| gsed 's/MSf2(\([0-9]\))/MSf2[\1]/g' \
| gsed 's/Af(\([0-9]\))/MSf2[\1]/g' \
| gsed 's/AfC(\([0-9]\))/MSf2[\1]/g' \
| gsed ':a;N;$!ba;s/USfC(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USfC[\1]/g' \
| gsed ':a;N;$!ba;s/USf(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USf[\1]/g' \
> xaa_sub



for i in c d e f g
do
cat xa${i} \
| gsed 's/MSf2(\([0-9]\))/MSf2[\1]/g' \
| gsed 's/Af(\([0-9]\))/MSf2[\1]/g' \
| gsed 's/AfC(\([0-9]\))/MSf2[\1]/g' \
| gsed ':a;N;$!ba;s/USfC(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USfC[\1]/g' \
| gsed ':a;N;$!ba;s/USf(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USf[\1]/g' \
| gsed  ':a;N;$!ba;s/mulM(\([^()]*\))/Times[\1]/g' \
| gsed  ':a;N;$!ba;s/dotM//g' \
| gsed  ':a;N;$!ba;s/addM//g' \
> xa${i}_sub
done


for i in b c d e f g h
do
cat xa${i} \
| sed ':a;N;$!ba;s/StageSort in thread [0-9]*\n//g' \
| sed ':a;N;$!ba;s/\n[ ]*\^2/^2\n      /g' \
| sed ':a;N;$!ba;s/\n[ ]*\*/*\n       /g' \
| sed ':a;N;$!ba;s/\n[ ]*+/ + \n       /g' \
| sed ':a;N;$!ba;s/\n[ ]*-/ - \n       /g' \
| sed 's/ //g' \
| sed ':a;N;$!ba;s/\n//g' \
| sed 's/\;/\;\n/g' \
| sed ':a;N;$!ba;s/subM(\([0-9]*\))/subM[\1]/g' \
| sed 's/ZNeu(\([0-9]\,[0-9]\))/ZNeu[\1,M1,M2,mu,beta]/g' \
| sed 's/ZNeuC(\([0-9]\,[0-9]\))/ZNeuC[\1,M1,M2,mu,beta]/g' \
| sed 's/MNeu(\([0-9]\))/MNeu[\1,M1,M2,mu,beta]/g' \
| sed 's/MNeu2(\([0-9]\))/MNeu2[\1,M1,M2,mu,beta]/g' \
| sed 's/MSf2(\([0-9]\))/MSf2[\1]/g' \
| sed 's/Af(\([0-9]\))/MSf2[\1]/g' \
| sed 's/AfC(\([0-9]\))/MSf2[\1]/g' \
| sed ':a;N;$!ba;s/USfC(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USfC[\1]/g' \
| sed ':a;N;$!ba;s/USf(\([0-9]\,[0-9]\,[0-9]\,[0-9]\))/USf[\1]/g' \
> xa${i}_sub

done

