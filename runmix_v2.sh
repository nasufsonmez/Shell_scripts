#!/bin/bash

for (( aaa=1; aaa<=48; aaa++ ))
do

for (( bbb=$aaa; bbb>0; bbb-- ))
do

cat << EOF_ > ${aaa}_${bbb}.m
Needs["FeynArts\`"]
Needs["FormCalc\`"]

\$FAVerbose = 0;
\$FormCmd = "/home/nsonmez/tform_32bit";

process1 = {V[5], V[5]} -> {F[11, {1}], F[11, {1}]};

BoxesTops = CreateTopologies[1, 2 -> 2, Adjacencies -> 3, BoxesOnly];

ins1 = InsertFields[BoxesTops, 
   	process1, Model -> "MSSMQCD", 
   	InsertionLevel -> {Particles},
   	ExcludeParticles -> {}, 
   	
   	Restrictions -> {NoGeneration2, NoGeneration3}
   ];
  
  Fact=1;
  Do[
     ins2 = DiagramExtract[ins1, i];
     MuBoxes[i] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];
     , {i, 1, 48}
    ];

  MuBoxes1 = MuBoxes[ ${aaa} ];
  MuBoxes2 = MuBoxes[ ${bbb} ];
  colu = ColourME[MuBoxes1, MuBoxes2];
  Hel[_] = 0;
  helu = HelicityME[MuBoxes1, MuBoxes2];
  
  MElement2 = SquaredME[MuBoxes1, MuBoxes2] /. helu /. colu;
  If[ ${aaa} == ${bbb}, Fact=1, Fact=2];
  pol = Fact*PolarizationSum[MElement2, GaugeTerms -> False];
  Keep[pol, "pol_boxCalc_v4_" <> ToString[ ${aaa} ] <> "_" <> ToString[ ${bbb} ], "~/melements/"];
  Print[ ${aaa} ,"\t", ${bbb} , "  is Done. --- Fact : ", Fact ];
EOF_

math <  ${aaa}_${bbb}.m > output_${aaa}_${bbb} &

sleep 30s

jobs_running=`ps -e | grep -c MathKernel`

echo "jobs_running   $jobs_running";

while [ $jobs_running -ge 7 ]
do
	jobs_running=`ps -e | grep -c MathKernel`
	sleep 1m
done

done

done