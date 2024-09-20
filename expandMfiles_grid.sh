#!/bin/bash
#  Mathematica code for  calculating glu glu > neutralino pairs
#  Created by Nasuf Sönmez on Thursday, 14. July 2016 at 09:17.
#
#


for (( aaa=1; aaa<96; aaa++ ))
do

for (( bbb=${aaa}; bbb<=96; bbb++ ))
do
	filen="  "
	OS=`uname`
	if [ "$OS" == "Darwin" ]
	then
		filen="/Users/nsonmez/testing3/gluglu_neupair22_v1_${aaa}_${bbb}.ampl"
	else
		filen="/home/nsonmez/testing3/gluglu_neupair22_v1_${aaa}_${bbb}.ampl"
	fi
	
	if [ ! -f "$filen" ]
	then

#####################################
## produce the file
cat << EOF_ > polcross_${aaa}_${bbb}.m

	filenameSub = "~/testing3/gluglu_neupair22_v1_" <> ToString[ ${aaa} ] <> "_" <> ToString[ ${bbb} ]<>".ampl";
		
	time1=AbsoluteTime[];

    If[ ! FileExistsQ[filenameSub]
    ,
    	Needs["FeynArts`"];
		Needs["FormCalc`"];

		\$FAVerbose = 0;
		\$FormCmd = "/home/nsonmez/tform_32bit";

		Neglect[MU] = Neglect[MD] = 0;
		Neglect[MU2] = Neglect[MD2] = 0;

		process1 = {V[5], V[5]} -> {F[11, {2}], F[11, {2}]};
	
		tops=CreateTopologies[1,2->2,ExcludeTopologies->{Tadpoles,WFCorrections,SelfEnergies}];

		topsD=DiagramDelete[tops,{19,20,29,34}];

		ins1 = InsertFields[
			tops, process1, Model -> "MSSMQCD",
		   	InsertionLevel -> {Particles}, ExcludeParticles -> {V[2]}, 
			ExcludeFieldPoints -> {FieldPoint[_][V[5], V[5], V[5]], 
			FieldPoint[_][S[3 | 4], S[13 | 14], -S[13 | 14]]}, 
			Restrictions -> {NoGeneration2, NoGeneration3}
		];

		Do[
			ins2 = DiagramExtract[ins1, i];
			MuBoxes[i] = CalcFeynAmp[CreateFeynAmp[ins2], FermionChains -> Chiral];
			,{i, 1, 96}
		];
		
		MuBoxes1 = MuBoxes[ ${aaa} ];
  		MuBoxes2 = MuBoxes[ ${bbb} ];
  		colu = ColourME[MuBoxes1, MuBoxes2];
  		Hel[_] = 0;
  		helu = HelicityME[MuBoxes1, MuBoxes2];
  
  		MElement2 = SquaredME[MuBoxes1, MuBoxes2] /. helu /. colu;
  		pol = PolarizationSum[MElement2, GaugeTerms -> False];
  		
  		
  		thetau := 0;
		thetad := 0;

		MZ := 91.1876;
		MZ2 := Power[91.1887, 2];
		GeVpb := 3.894 10^8;
		sin2thetaw = 0.2315;
		thetaw = ArcSin[Sqrt[sin2thetaw]];

		subst = {MZ -> 91.1876, MZ2 -> 91.1876^2, MW -> 80.403, MW2 -> 80.403^2, MT -> 174, MT2 -> 174^2, MB -> 4.7, MB2 -> 4.7^2, MS -> 95 10^-3, MS2 -> (95 10^-3)^2, MC -> 1.5 10^-3, MC2 -> (1.5 10^-3)^2, MD -> 0.01, MD2 -> 0.01^2, MU -> 0.005, MU2 -> 0.005^2, ME -> 0.511 10^-3, ME2 -> (0.511 10^-3)^2, Alfa -> 1/137.03598, Alfa2 -> 1/137.03598^2, Alfas -> 0.1176, Alfas2 -> 0.1176^2, SW -> Sqrt[0.23120], SW2 -> 0.23120, CW -> Sqrt[1 - 0.23120], CW2 -> 1 - 0.23120};

		Mh02 := 1/2 (MA02 + MZ2 - Sqrt[(MA02 + MZ2)^2 - 4 MA02 MZ2 Cos[2 beta]^2]);
		MHH2 := 1/2 (MA02 + MZ2 + Sqrt[(MA02 + MZ2)^2 - 4 MA02 MZ2 Cos[2 beta]^2]);
		alpha := ArcTan[((MA02 - MZ2) Cos[2 beta] + Sqrt[(MZ2 + MA02)^2 - 4 MA02 MZ2 Cos[2 beta]^2])/((MZ2 + MA02) Sin[2 beta])];

		HiggsMixing := {CA -> Cos[alpha], CA2 -> Cos[alpha]^2, SA -> Sin[alpha], SA2 -> Sin[alpha]^2, CAB -> Cos[alpha - beta], SAB -> Sin[alpha - beta]};

		mM0[M1_, M2_, mu_, beta_] := {
			{M1, 0, -MZ Sin[thetaw] Cos[beta], MZ Sin[thetaw] Sin[beta]}, 
			{0, M2, MZ Cos[thetaw] Cos[beta], -MZ Cos[thetaw] Sin[beta]},
			{-MZ Sin[thetaw] Cos[beta], MZ Cos[thetaw] Cos[beta], 0, -mu},
			{MZ Sin[thetaw] Sin[beta], -MZ Cos[thetaw] Sin[beta], -mu, 0}};

		MNeu[i_, M1_Real, M2_Real, mu_Real, beta_Real] := Round[Abs[Transpose[SortBy[Transpose[Eigensystem[mM0[M1, M2, mu, beta]]], Abs]][[1, i]]]];

		MNeu2[i_, M1_Real, M2_Real, mu_Real, beta_Real] := MNeu[i, M1, M2, mu, beta]^2;

		ZNeu[i_, j_, M1_Real, M2_Real, mu_Real, beta_Real] := If[
			Transpose[SortBy[Transpose[Eigensystem[mM0[M1, M2, mu, beta]]], Abs]][[1, i]] < 0,
			 -I Transpose[SortBy[Transpose[Eigensystem[mM0[M1, M2, mu, beta]]], Abs]][[2, i, j]], 
			Transpose[SortBy[Transpose[Eigensystem[mM0[M1, M2, mu, beta]]], Abs]][[2, i, j]]
		];

		ZNeuC[i_, j_, M1_Real, M2_Real, mu_Real, beta_Real] := Conjugate[ZNeu[i, j, M1, M2, mu, beta]];

		USf[a_, b_, c_, d_] := Module[
			{usf},
			usf[3, 1] := {
				{Cos[thetau], Sin[thetau]},
				{-Sin[thetau], Cos[thetau]}}[[a, b]];
			usf[4, 1] := {
				{Cos[thetad], Sin[thetad]},
				{-Sin[thetad], Cos[thetad]}}[[a, b]];
			Return[usf[c, d]];
		];

		USfC[a_Integer, b_Integer, c_Integer, d_Integer] := Conjugate[USf[a, b, c, d]];
		MSf2[a_Integer, b_Integer, c_Integer] :={{{{350^2}, {550^2}}, {{Null}, {Null}}, {{Null}, {Null}}}, {{{350^2}, {550^2}}, {{Null}, {Null}}, {{Null}, {Null}}}}[[b - 2, c, a, 1]];
		
		FuncSubst = {
			MNeu[a_] :> MNeu[a, M1, M2, mu, beta],
			MNeu2[a_] :> MNeu2[a, M1, M2, mu, beta],
			ZNeu[a_, b_] :> ZNeu[a, b, M1, M2, mu, beta],
			ZNeuC[a_, b_] :> ZNeuC[a, b, M1, M2, mu, beta]
		};
		
		params := {M1 -> 150., M2 -> 150., mu -> 200., beta -> ArcTan[10.], MA02 -> 250^2};
		
  		newSubexpr=Subexpr[]//. FuncSubst //. subst //. HiggsMixing //. params;
  		
  		Put[pol//.params//.Abbr[]//.newSubexpr , ToString[filenameSub]  ];

		Print[ ${aaa}, "  ", ${bbb}, "  is done !!!", "   AbsTime  : ", AbsoluteTime[] - time1, " s"];
	,
		Print["    .ampl exist skip ... ", ${aaa}, "  ", ${bbb} ]; 
	];

EOF_

#####################################

	#jobs_running_yef=$(ssh  yef.ege.edu.tr ps -e | grep -c MathKernel)
	jobs_running_yef=$(ps -e | grep -c MathKernel)
	jobs_running_yef1=$(ssh 155.223.85.220 ps -e | grep -c MathKernel)

	echo "jobs_running@yef   $jobs_running_yef1";
	echo "jobs_running@yef1   $jobs_running_yef1";

	echo "job :  ${aaa}    ${bbb} is created"


	####################################################
	####################################################

	while [ $jobs_running_yef1 -ge 6 -o $jobs_running_yef -ge 6 ]
	do
		#rsync -u --progress ~/melements_sub/* 155.223.85.220:~/melements_sub/
		#sleep 5s
		#rsync -u --progress 155.223.85.220:~/melements_sub/* ~/melements_sub/
		#sleep 5s

		#jobs_running_yef=$( ssh yef.ege.edu.tr ps -e | grep -c MathKernel)
		jobs_running_yef=$(ps -e | grep -c MathKernel)
		jobs_running_yef1=$(ssh 155.223.85.220 ps -e | grep -c MathKernel)
		sleep 1m
	done

	####################################################
	####################################################
	# Number of jobs running at YEF1 are less than 7 send one job
	if [ $jobs_running_yef1 -lt 6 ]
	then
		ssh 155.223.85.220 "nohup math <  polcross_${aaa}_${bbb}.m > output_${aaa}_${bbb} &"
		timenow=`date`
		echo "job polcross_${aaa}_${bbb}.m is sent to YEF1 @ $timenow" 
		sleep 20s
		continue;
	fi

	####################################################
	####################################################
	# Number of jobs running at YEF are less than 2 send one job
	if [ $jobs_running_yef -lt 6 ]
	then
		nohup math <  polcross_${aaa}_${bbb}.m > output_${aaa}_${bbb} &
		timenow=`date`
		echo "job polcross_${aaa}_${bbb}.m is sent to YEF @ $timenow" 
		sleep 20s
		continue;
	fi

else
	echo "file ${filen} exist skips ..."
	continue
fi

done

done
