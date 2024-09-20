#!/bin/bash

for (( aaa=1; aaa<=1; aaa++ ))
do

for (( bbb=${aaa}; bbb<=49; bbb++ ))
do

	filen="/home/nsonmez/testing12/pol_${aaa}_${bbb}.m"

	if [ ! -f "$filen" ]
	then 

##############################################
cat << EOF_ > ${aaa}_${bbb}.m

	filename = "~/melements_v2/pol_boxCalc_v6_" <> ToString[${aaa}] <> "_" <> ToString[${bbb}] <> ".m";
	Needs["FeynArts\`"];
	Needs["FormCalc\`"];

    \$FAVerbose = 0;
    \$FormCmd = "/home/nsonmez/tform_32bit";

	If[ !FileExistsQ[filename],

		process1 = {V[5], V[5]} -> {F[11, {1}], F[11, {1}]};

		(*	Triangles, Quartic Couplings *)
		tops = CreateTopologies[1, 2 -> 2, ExcludeTopologies -> {Tadpoles, WFCorrections, SelfEnergies}];

		topsD = DiagramDelete[tops, {13, 14, 15, 19, 20, 29, 34}];

		ins1 = InsertFields[
			topsD, process1, Model -> "MSSMQCD",
			InsertionLevel -> {Particles}, ExcludeParticles -> {V[2]}, 
			ExcludeFieldPoints -> {FieldPoint[_][V[5], V[5], V[5]], 
			FieldPoint[_][S[3 | 4], S[13 | 14], -S[13 | 14]]}, 
			Restrictions -> {NoGeneration2, NoGeneration3}
		];

		MuQuartTrian = CalcFeynAmp[CreateFeynAmp[ins1], FermionChains -> Chiral];
  
  		(*	BOXES *)
  		MAmplitudes[1] = CreateTopologies[1, 2 -> 2, Adjacencies -> 3, BoxesOnly];

		ins2 = InsertFields[BoxesTops, 
	   		process1, Model -> "MSSMQCD", 
	   		InsertionLevel -> {Particles},
	   		ExcludeParticles -> {}, 
	   		Restrictions -> {NoGeneration2, NoGeneration3}
		];

		Do[
			ins3 = DiagramExtract[ins2, i];
			MAmplitudes[i+1] = CalcFeynAmp[CreateFeynAmp[ins3], FermionChains -> Chiral];
			,{i, 1, 48}
		];

  		MAmplitudes1 = MAmplitudes[ ${aaa} ];
  		MAmplitudes2 = MAmplitudes[ ${bbb} ];
  		colu = ColourME[MAmplitudes1, MAmplitudes2];
  		Hel[_] = 0;
  		helu = HelicityME[MAmplitudes1, MAmplitudes2];
  
  		MElement2 = SquaredME[MAmplitudes1, MAmplitudes2] /. helu /. colu;
  		pol = PolarizationSum[MElement2, GaugeTerms -> False];
  		Keep[pol, "pol_boxCalc_v6_" <> ToString[ ${aaa} ] <> "_" <> ToString[ ${bbb} ], "~/testing4/"];
  		Print[ ${aaa} ,"\t", ${bbb} , "  is Done"];
  		,
    	Print["File exist skip ... ", ${aaa}, "  ", ${bbb}];
	]
EOF_
##############################################

	math <  ${aaa}_${bbb}.m > output_${aaa}_${bbb} &
	echo "job ${aaa}_${bbb}.m is sent to YEF @ $timenow" 

	sleep 10s

	jobs_running=`ps -e | grep -c MathKernel`

	echo "jobs_running@yef   $jobs_running_yef";

	while [ $jobs_running -ge 7 ]
	do
		jobs_running=`ps -e | grep -c MathKernel`
		sleep 1m
	done
else
	echo "file exist : pol_boxCalc_v6_${aaa}_${bbb}.m  "

fi

done

done
