#!/bin/bash

for (( aaa=1; aaa<=13; aaa++ ))
do

for (( bbb=${aaa}; bbb<=13; bbb++ ))
do

	filen="/home/nsonmez/testing4/pol12_v5_${aaa}_${bbb}.m"

	if [ ! -f "$filen" ]
	then 

##############################################
cat << EOF_ > ${aaa}_${bbb}.m

	filename = "~/testing4/pol12_v5_" <> ToString[${aaa}] <> "_" <> ToString[${bbb}] <> ".m";
	Needs["FeynArts\`"];
	Needs["FormCalc\`"];

    \$FAVerbose = 0;
    \$FormCmd = "/home/nsonmez/tform_32bit";

	If[ !FileExistsQ[filename],

		process1 = {V[5], V[5]} -> {F[11, {1}], F[11, {2}]};
		
		tops = CreateTopologies[1, 2 -> 2, ExcludeTopologies -> {Tadpoles, WFCorrections, SelfEnergies}];

		topsD = DiagramDelete[tops, {19, 20, 29, 34}];

		ins1 = InsertFields[
				topsD, process1, Model -> "MSSMQCD", 
   				InsertionLevel -> {Particles}, ExcludeParticles -> {V[2]}, 
				ExcludeFieldPoints -> {FieldPoint[_][V[5], V[5], V[5]], 
				FieldPoint[_][S[3 | 4], S[13 | 14], -S[13 | 14]]}, 
				Restrictions -> {NoGeneration2, NoGeneration3}
				];
				
		(*BOXES*)
		
		Do[
		
			ilk=40+(i-1)*4+1;
			son=40+i*4;
			ins2 = DiagramExtract[ins1, ilk .. son];
			MuBoxes[i] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];
			,{i, 1, 12}
		];

		ins2 = DiagramExtract[ins1, 1..20];
		MuBoxes[13] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];
		ins2 = DiagramExtract[ins1, 21..40];
		MuBoxes[14] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];

		ins2 = DiagramExtract[ins1, 89..96];
		MuBoxes[15] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];


  		MuBoxes1 = MuBoxes[ ${aaa} ];
  		MuBoxes2 = MuBoxes[ ${bbb} ];
  		colu = ColourME[MuBoxes1, MuBoxes2];
  		Hel[_] = 0;
  		helu = HelicityME[MuBoxes1, MuBoxes2];
  
  		MElement2 = SquaredME[MuBoxes1, MuBoxes2] /. helu /. colu;
  		pol = PolarizationSum[MElement2, GaugeTerms -> False];
  		Keep[pol, "pol12_v5_" <> ToString[ ${aaa} ] <> "_" <> ToString[ ${bbb} ], "~/testing4/"];
  		Print[ ${aaa} ,"\t", ${bbb} , "  is Done"];
  		,
    	Print["File exist skip ... ", ${aaa}, "  ", ${bbb}];
	]
EOF_
##############################################

	####################################################
	jobs_running=`ps -e | grep -c MathKernel`
	echo "jobs_running@deu   $jobs_running";
	echo "job :  ${aaa}    ${bbb} is created"

	####################################################
	####################################################
	while [ $jobs_running -ge 4 ]
	do
		jobs_running=`ps -e | grep -c MathKernel`
		sleep 30s
	done

	####################################################
	####################################################
	# Number of jobs running at DEU are less than 4 send one job
	if [ $jobs_running -lt 4 ]
	then
		nohup math <  ${aaa}_${bbb}.m > output_${aaa}_${bbb} &
		timenow=`date`
		echo "job ${aaa}_${bbb}.m is sent to DEU @ $timenow" 
		sleep 15s
		continue;
	fi
	####################################################

else
	echo "file exist : pol12_v5_${aaa}_${bbb}.m  "

fi

done

done
