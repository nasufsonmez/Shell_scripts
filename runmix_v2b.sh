#!/bin/bash

for (( aaa=2; aaa<=48; aaa++ ))
do

ccc=`expr ${aaa} - 1`;

for (( bbb=${ccc}; bbb>0; bbb-- ))
do

	cat << EOF_ > ${aaa}_${bbb}.m

	filename = "~/melements/pol_boxCalc_v4_" <> ToString[${aaa}] <> "_" <> ToString[${bbb}] <> ".m";
	
	Needs["FeynArts\`"];
	Needs["FormCalc\`"];

    \$FAVerbose = 0;
    \$FormCmd = "/home/nsonmez/tform_32bit";

	If[ !FileExistsQ[filename],

		process1 = {V[5], V[5]} -> {F[11, {1}], F[11, {1}]};

		BoxesTops = CreateTopologies[1, 2 -> 2, Adjacencies -> 3, BoxesOnly];

		ins1 = InsertFields[
			BoxesTops, 
	   		process1, Model -> "MSSMQCD", 
	   		InsertionLevel -> {Particles},
	   		ExcludeParticles -> {}, 
	   		Restrictions -> {NoGeneration2, NoGeneration3}
		];

		Do[
			ins2 = DiagramExtract[ins1, i];
			MuBoxes[i] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];
			,{i, 1, 48}
		];

  		MuBoxes1 = MuBoxes[ ${aaa} ];
  		MuBoxes2 = MuBoxes[ ${bbb} ];
  		colu = ColourME[MuBoxes1, MuBoxes2];
  		Hel[_] = 0;
  		helu = HelicityME[MuBoxes1, MuBoxes2];
  
  		MElement2 = SquaredME[MuBoxes1, MuBoxes2] /. helu /. colu;
  		pol = 2*PolarizationSum[MElement2, GaugeTerms -> False];
  		Keep[pol, "pol_boxCalc_v4_" <> ToString[ ${aaa} ] <> "_" <> ToString[ ${bbb} ], "~/melements/"];
  		Print[ ${aaa} ,"\t", ${bbb} , "  is Done"];
  		,
    	Print["File exist skip ... ", ${aaa}, "  ", ${bbb}];
	]
EOF_

jobs_running_yef=$(ssh yef.ege.edu.tr ps -e | grep -c MathKernel)
jobs_running_yef1=$(ssh -t yef.ege.edu.tr 155.223.85.220 ps -e | grep -c MathKernel)

echo "jobs_running@yef   $jobs_running_yef1";
echo "jobs_running@yef1   $jobs_running_yef1";

echo "job :  ${aaa}    ${bbb} is created"

####################################################
####################################################

#while [ $jobs_running_yef1 -ge 7 -o $jobs_running_yef -ge 7 ]
while [ $jobs_running_yef1 -ge 7 ]
do
	jobs_running_yef=$(ssh yef.ege.edu.tr ps -e | grep -c MathKernel)
	jobs_running_yef1=$(ssh -t yef.ege.edu.tr ssh 155.223.85.220 ps -e | grep -c MathKernel)
	sleep 1m
done

####################################################
####################################################
# Number of jobs running at YEF1 are less than 7 send one job
if [ $jobs_running_yef1 -lt 7 ]
then
	ssh -t yef.ege.edu.tr "ssh 155.223.85.220 'math <  '${aaa}_${bbb}.m' > 'output_${aaa}_${bbb} &"
	echo "job ${aaa}_${bbb}.m is sent to YEF1"
	sleep 20s
	continue;
fi

####################################################
####################################################
# Number of jobs running at YEF are less than 7 send one job
#if (( $jobs_running_yef -lt 7 ))
#then
	#scp ${aaa}_${bbb}.m yef.ege.edu.tr:~/
#	ssh yef.ege.edu.tr "math <  ${aaa}_${bbb}.m > output_${aaa}_${bbb} &"
#	echo "job ${aaa}_${bbb}.m is sent to YEF"
#	sleep 20s
#	continue;
#fi

#rsync -u --progress ./* 155.223.85.220:~/melements/
#rsync -u --progress 155.223.85.220:~/melements/* .


done

done

