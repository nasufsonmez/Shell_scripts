#!/bin/bash
#  Mathematica code for  calculating polarization for box diagrams
#  Created by Nasuf Sönmez on Thursday, 14. July 2016 at 09:17.
#
#

math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"

for (( aaa=43; aaa<48; aaa++ ))
do

for (( bbb=${aaa}; bbb<=48; bbb++ ))
do

	filen="/Users/nsonmez/melements/pol_boxCalc_v4_${aaa}_${bbb}.m_sub"
	
	if [ ! -f "$filen" ]
	then

#####################################
## produce the file
cat << EOF_ > expand_${aaa}_${bbb}.m

	filename = "~/melements/pol_boxCalc_v4_" <> ToString[${aaa}] <> "_" <> ToString[${bbb}] <> ".m";
	filenameSub = "~/melements_sub/pol_boxCalc_v4_" <> ToString[${aaa}] <> "_" <> ToString[${bbb}] <> ".m_sub";
	
	time1=AbsoluteTime[];
	If[ FileExistsQ[filename]
	,
	    If[ ! FileExistsQ[filenameSub]
	    ,
			abbr = Get[filename][[1]];
			subexpr = Get[filename][[2]];
			mel2 = Get[filename][[3]];
			Print[ToString[filename], "  is working ..."];
			Put[mel2 //. subexpr //. abbr, ToString[filenameSub] ];
			Print[ ${aaa}, "  ", ${bbb}, "  is done !!!", "   AbsTime  : ", AbsoluteTime[] - time1, " s"];
		,
			Print["    .m_sub exist skip ... ", ${aaa}, "  ", ${bbb} ]; 
		];
	,
		Print["    .m file doesn't exist skip ... ", ${aaa}, "  ", ${bbb} ];
	];

EOF_

#####################################

	math < expand_${aaa}_${bbb}.m > output_${aaa}_${bbb} 
	timenow=`date`
	echo "job ${aaa}_${bbb}.m is sent to YEF1 @ $timenow" 

	sleep 20s

	jobs_running=`ps -e | grep -c MathKernel`

	echo "jobs_running   $jobs_running";

	while [ $jobs_running -ge 1 ]
	do
		jobs_running=`ps -e | grep -c MathKernel`
		sleep 1m
	done

else
	echo "file ${aaa}_${bbb} exist skips ..."
	continue
fi

done

done
