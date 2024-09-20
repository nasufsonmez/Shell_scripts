#!/bin/bash
#  Formcalc code to calculate the cross section for ep em > Hp Hm Z0 channel
#  for various polarizations and energy ranges.
#  Created by Nasuf Sönmez on Thursday, 28. Nov 2017 at 21:18.
#
#


bp=$1

pol1=uuuuu
pol2=+-uuu
pol3=-+uuu

cd ~/formcalc_work_space/epem_HpHmZ0_2hdm.fortran

smin=1500
smax=1500
sstep=1

#./run_bench${bp} ${pol1} ${smin},${smax},${sstep}
#./run_bench${bp} ${pol2} ${smin},${smax},${sstep}
#./run_bench${bp} ${pol3} ${smin},${smax},${sstep}


# This version (v2) will be recalculated for different mhc masses

cd formcalc_work_space/epem_HpHmZ0_2hdm.fortran
bp=31
smin=800
smax=3006
sstep=25
pol1=uuuuu
pol2=+-uuu
pol3=-+uuu

nohup ./run_bench${bp}v2 ${pol1} ${smin},${smax},${sstep} &
nohup ./run_bench${bp}v2 ${pol2} ${smin},${smax},${sstep} &
nohup ./run_bench${bp}v2 ${pol3} ${smin},${smax},${sstep} &

# This version (v3) will be recalculated for various TB values

cd formcalc_work_space/epem_HpHmZ0_2hdm.fortran
bp=28
smin=800
smax=3000
sstep=25
pol1=uuuuu
pol2=+-uuu
pol3=-+uuu


nohup ./run_bench${bp}v3 ${pol1} ${smin},${smax},${sstep} &
nohup ./run_bench${bp}v3 ${pol2} ${smin},${smax},${sstep} &
nohup ./run_bench${bp}v3 ${pol3} ${smin},${smax},${sstep} &

echo "done"

exit 0

./tools/data run_bench31v3.-+uuu.00800,02500,00025
./tools/data run_bench30v3.-+uuu.00800,02500,00025
./tools/data run_bench29v3.-+uuu.00800,02500,00025

./tools/data run_bench28v3.-+uuu.00800,02500,00025

./tools/data run_bench28v2.uuuuu.00800,03006,00025
./tools/data run_bench29v2.uuuuu.00800,03006,00025
./tools/data run_bench30v2.uuuuu.00800,03006,00025
./tools/data run_bench31v2.uuuuu.00800,03006,00025
./tools/data run_bench28v2.+-uuu.00800,03006,00025
./tools/data run_bench29v2.+-uuu.00800,03006,00025
./tools/data run_bench30v2.+-uuu.00800,03006,00025
./tools/data run_bench31v2.+-uuu.00800,03006,00025
./tools/data run_bench28v2.-+uuu.00800,03006,00025
./tools/data run_bench29v2.-+uuu.00800,03006,00025
./tools/data run_bench30v2.-+uuu.00800,03006,00025
./tools/data run_bench31v2.-+uuu.00800,03006,00025


nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type1v2 uuuuu 501,3000,00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type1v2 +-uuu 500,3000,00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type1v2 -+uuu 500,3000,00025 &

nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type2v2 uuuuu 1100,3000,00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type2v2 +-uuu 1100,3000,00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench2_type2v2 -+uuu 1100,3000,00025 &

nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench32 ++uuu 800,3000,25 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench34 -+uuu 800,3000,25 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench34 uuuuu 800,3000,25 &


 ./tools/data run_bench28.-+uuu.02500,02500,00007
 ./tools/data run_bench28.+-uuu.02500,02500,00007


version=2;
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench28v2 uuuuu 0800,300${version},00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench28v2 +-uuu 0800,300${version},00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench28v2 -+uuu 0800,300${version},00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench28v2 --uuu 0800,300${version},00025 &

version=2;
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench31v2 uuuuu 0800,300${version},00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench31v2 +-uuu 0800,300${version},00025 &
nohup  ~/epem_HpHmZ0_2hdm.fortran/run_bench31v2 -+uuu 0800,300${version},00025 &


version=2;
./tools/data run_bench28v2.uuuuu.00800,0300${version},00025
./tools/data run_bench28v2.+-uuu.00800,0300${version},00025
./tools/data run_bench28v2.-+uuu.00800,0300${version},00025

./tools/data run_bench31v2.uuuuu.00800,0300${version},00025
./tools/data run_bench31v2.+-uuu.00800,0300${version},00025
./tools/data run_bench31v2.-+uuu.00800,0300${version},00025

rm -rf run_bench31v2.-+uuu.00800,0300${version},00025


./tools/data  run_bench32.+-uuu.00800,03000,00025
./tools/data  run_bench32.-+uuu.00800,03000,00025
./tools/data  run_bench32.uuuuu.00800,03000,00025

en=1500;
./tools/data  run_bench2_type1.+-uuu.0${en},0${en},00001
./tools/data  run_bench2_type1.-+uuu.0${en},0${en},00001
./tools/data  run_bench2_type1.uuuuu.0${en},0${en},00001

./tools/data  run_bench2_type2.+-uuu.0${en},0${en},00001
./tools/data  run_bench2_type2.-+uuu.0${en},0${en},00001
./tools/data  run_bench2_type2.uuuuu.0${en},0${en},00001






make run_bench2_type${type}

./run_bench2_type${type} uuuuu ${smax},${smax},1

./run_bench2_type${type} +-uuu ${smax},${smax},1

./run_bench2_type${type} -+uuu ${smax},${smax},1




./tools/data run_bench2_type1.-+uuu.01000,01000,00001
./tools/data run_bench2_type1.+-uuu.01000,01000,00001
./tools/data run_bench2_type1.-+uuu.01500,01500,00001
./tools/data run_bench2_type1.+-uuu.01500,01500,00001
./tools/data run_bench2_type1.-+uuu.03000,03000,00001
./tools/data run_bench2_type1.+-uuu.03000,03000,00001
./tools/data run_bench2_type1.uuuuu.01000,01000,00001
./tools/data run_bench2_type1.uuuuu.01500,01500,00001
./tools/data run_bench2_type1.uuuuu.03000,03000,00001
./tools/data run_bench2_type2.-+uuu.01000,01000,00001
./tools/data run_bench2_type2.+-uuu.01000,01000,00001
./tools/data run_bench2_type2.-+uuu.01500,01500,00001
./tools/data run_bench2_type2.+-uuu.01500,01500,00001
./tools/data run_bench2_type2.-+uuu.03000,03000,00001
./tools/data run_bench2_type2.+-uuu.03000,03000,00001
./tools/data run_bench2_type2.uuuuu.01000,01000,00001
./tools/data run_bench2_type2.uuuuu.01500,01500,00001
./tools/data run_bench2_type2.uuuuu.03000,03000,00001

exe=run2_pt 

./${exe}5  +-uuu 240,240,1 
./${exe}5  +-uuu 350,350,1 
./${exe}5  +-uuu 500,500,1 
./${exe}5  -+uuu 240,240,1 
./${exe}5  -+uuu 350,350,1 
./${exe}5  -+uuu 500,500,1 

./${exe}15 +-uuu 240,240,1 
./${exe}15 +-uuu 350,350,1 
./${exe}15 +-uuu 500,500,1 
./${exe}15 -+uuu 240,240,1 
./${exe}15 -+uuu 350,350,1 
./${exe}15 -+uuu 500,500,1 

./${exe}20 +-uuu 240,240,1 
./${exe}20 +-uuu 350,350,1 
./${exe}20 +-uuu 500,500,1 
./${exe}20 -+uuu 240,240,1 
./${exe}20 -+uuu 350,350,1 
./${exe}20 -+uuu 500,500,1 

./${exe}25 +-uuu 240,240,1 
./${exe}25 +-uuu 350,350,1 
./${exe}25 +-uuu 500,500,1 
./${exe}25 -+uuu 240,240,1 
./${exe}25 -+uuu 350,350,1 
./${exe}25 -+uuu 500,500,1 

nohup ./run_bench2_type1v2_y uuuuu 240,240,5 &
nohup ./run_bench2_type1v2_y uuuuu 350,350,5 &
nohup ./run_bench2_type1v2_y uuuuu 500,500,5 &

./tools/data run_bench2_type1v2_y.uuuuu.00240,00240,00005
./tools/data run_bench2_type1v2_y.uuuuu.00350,00350,00005
./tools/data run_bench2_type1v2_y.uuuuu.00500,00500,00005

nohup ./run_bench2_type1_backward -+uuu 00220,01000,00010 &
nohup ./run_bench2_type1_backward +-uuu 00220,01000,00010 &
nohup ./run_bench2_type1_backward uuuuu 00220,01000,00010 &

./tools/data run_bench2_type1_backward.+-uuu.00220,01000,00010
./tools/data run_bench2_type1_backward.-+uuu.00220,01000,00010
./tools/data run_bench2_type1_backward.uuuuu.00220,01000,00010

nohup ./run_bench2_type1_forward -+uuu 00220,01000,00010 &
nohup ./run_bench2_type1_forward +-uuu 00220,01000,00010 &
nohup ./run_bench2_type1_forward uuuuu 00220,01000,00010 &

./tools/data run_bench2_type1_forward.+-uuu.00220,01000,00010
./tools/data run_bench2_type1_forward.-+uuu.00220,01000,00010
./tools/data run_bench2_type1_forward.uuuuu.00220,01000,00010

