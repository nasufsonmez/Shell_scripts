#!/bin/bash

#deltas=$1
deltac=$1
en=1000
accu=3

cd /uscms/home/nsonmez/epem_wwww_real_v2.fortran

for deltas in 1 2 3 4 5
do

	run=run_ds${deltas}_dc${deltac}

	rm $run
	cp run.F ${run}.F

	sed -i "s/\#define deltas 1D-[0-9]/\#define deltas 1D-${deltas}/g" ${run}.F
	sed -i "s/\#define deltac 1D-[0-9]/\#define deltac 1D-${deltac}/g" ${run}.F
	sed -i "s/RELACCURACY 1D-[0-9]/RELACCURACY 1D-${accu}/g"           ${run}.F

	file=./${run}.uuuuu.0${en},0${en},00001

	rm -rf $file
	make $run || exit /b
	./${run} uuuuu ${en},${en},1
	./tools/data $file

	sed -i "s/${en}\.000000/-${deltas}/1" ${file}.data
	sed -i "s/0\.000000000/-${deltas}/1"  ${file}.data
done

#grep "\-[0-9]" run.uuuuu.0${en},0${en},00001.data >> output.txt
#awk -F":" '{print $2}' output.txt > hard_dc${deltac}_s${en}.txt
#cat hard_ds${deltas}_dc${deltac}_s${en}.txt


exit 0

#!/bin/bash

#cd /truba_scratch/nsonmez/vv_4h0h0h0_2hdm.fortran

for bp in {2..45}
do
	make run_bench${bp}
	./run_bench${bp} uuuuu 400,2500,20
	./tools/data  run_bench${bp}.uuuuu.400,2500,20
done

sed  -i "s/\#define RELACCURACY 1D-[0-9]/\#define RELACCURACY 1D-5/g" *.F
sed  -i "s/\#define MINEVAL [0-9]*/\#define MINEVAL 1000000/g" *.F
sed  -i "s/\#define MAXEVAL [0-9]*/\#define MAXEVAL 10000000/g" *.F
sed  -i "s/DIVONNE/VEGAS/g" *.F



