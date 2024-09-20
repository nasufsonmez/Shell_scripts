#!/bin/sh
chan=$1
tag=$2

#for chan in s t2 t3 tw
#do

	source /truba_scratch/nsonmez/root/bin/thisroot.sh

	cd /truba_scratch/nsonmez/MG5_aMC_v2_5_5

	for var in 100
	do
		cd DATACARDS

		sed -i "s/mhc100/mhc${var}/g" run_card_singletop_${chan}_mhc${var}.dat
		sed -i "s/mHc100/mHc${var}/g" proc_card_mg5_singletop_${chan}_mhc${var}.dat
		sed -i "s/mhc100/mhc${var}/g" proc_card_mg5_singletop_${chan}_mhc${var}.dat		
		sed "s/singletop_${chan}_mhc100/singletop_${chan}_mhc${var}_${tag}/" \
                    proc_card_mg5_singletop_${chan}_mhc${var}.dat \
                    > proc_card_mg5_singletop_${chan}_mhc${var}_${tag}.dat
		cd ../

		./bin/mg5 DATACARDS/proc_card_mg5_singletop_${chan}_mhc${var}_${tag}.dat
		cd singletop_${chan}_mhc${var}_${tag}

		cp ../DATACARDS/pythia_card.dat Cards/pythia_card.dat
		cp ../DATACARDS/delphes_card.dat Cards/delphes_card.dat
		cp ../DATACARDS/run_card_singletop_${chan}_mhc${var}.dat Cards/run_card.dat

		sed -i '151s/^.*$/0.0     2       2    -3/' Cards/param_card.dat
		sed -i '152s/^.*$/0.0     2       2    -5/' Cards/param_card.dat
		sed -i '153s/^.*$/0.0     2       4    -1/' Cards/param_card.dat
		sed -i '154s/^.*$/0.0     2       4    -3/' Cards/param_card.dat
		sed -i '155s/^.*$/0.0     2       4    -5/' Cards/param_card.dat
		sed -i '156s/^.*$/0.0     2     -11    12/' Cards/param_card.dat
		sed -i '157s/^.*$/0.0     2     -13    14/' Cards/param_card.dat
		sed -i '159s/^.*$/1.0     2     -15    16/' Cards/param_card.dat

		./bin/cleanall	
		echo " "
		./bin/madevent multi_run 25 -f --laststep=delphes 
		echo " "
		exit 0;

	done
#done


MG5_aMC_v2_5_5/DATACARDS/proc_card_ttjets_hadr.dat




DATACARDS/proc_card_ttjets_hadr.dat
proc_card_ttjets_semilept.dat
proc_card_ttjets_lept.dat
mass=120

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wc0jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wc0jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wc1jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wc1jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wc2jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wc2jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wbb0jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wbb0jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wbb1jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wbb1jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wbb2jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wbb2jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wmp0jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wmp0jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wmp1jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wmp1jets

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/wmp2jets/Events/run_*/tag_1_delphes_events.root \
> /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_wmp2jets


ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/back_singletop_s/Events/run_*/tag_1_delphes_events.root   > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_back_singletop_s
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/back_singletop_t2/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_back_singletop_t2
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/back_singletop_t3/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_back_singletop_t3
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/back_singletop_tw/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_back_singletop_tw


mhc=130
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_s_mhc${mhc}/Events/run_*/tag_1_delphes_events.root   > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_s_mhc${mhc}
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_t2_mhc${mhc}/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_t2_mhc${mhc}
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_t3_mhc${mhc}/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_t3_mhc${mhc}
ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_tw_mhc${mhc}/Events/run_*/tag_1_delphes_events.root  > /truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_tw_mhc${mhc}


mhc=130
./create_ntuple ntuple_list_files/input_signal_s_mhc${mhc}.par   > output_back_singletop_mhc${mhc}_23Feb2018.txt
./create_ntuple ntuple_list_files/input_signal_t2_mhc${mhc}.par >> output_back_singletop_mhc${mhc}_23Feb2018.txt
./create_ntuple ntuple_list_files/input_signal_t3_mhc${mhc}.par >> output_back_singletop_mhc${mhc}_23Feb2018.txt
./create_ntuple ntuple_list_files/input_signal_tw_mhc${mhc}.par >> output_back_singletop_mhc${mhc}_23Feb2018.txt



nohup ./create_ntuple ntuple_list_files/input_signal_t2_mhc120.par 	> output_120t2 &
nohup ./create_ntuple ntuple_list_files/input_signal_tw_mhc90.par 	> output_90tw &
nohup ./create_ntuple ntuple_list_files/input_signal_s_mhc90.par 	> output_90s &

nohup  ./create_ntuple ntuple_list_files/input_ttjets_hadr.par 		> output_hadr &
nohup  ./create_ntuple ntuple_list_files/input_ttjets_lept.par 		> output_lept &
nohup  ./create_ntuple ntuple_list_files/input_ttjets_semilept.par 	> output_semilept &

nohup  ./create_ntuple ntuple_list_files/input_wbb0jets.par > output_wbb0jets &
nohup  ./create_ntuple ntuple_list_files/input_wbb1jets.par > output_wbb1jets &
nohup  ./create_ntuple ntuple_list_files/input_wbb2jets.par > output_wbb2jets &

nohup  ./create_ntuple ntuple_list_files/input_wc0jets.par  > output_wc0jets &
nohup  ./create_ntuple ntuple_list_files/input_wc1jets.par  > output_wc1jets &
nohup  ./create_ntuple ntuple_list_files/input_wc2jets.par  > output_wc2jets &

nohup  ./create_ntuple ntuple_list_files/input_wmp0jets.par  > output_wmp0jets &
nohup  ./create_ntuple ntuple_list_files/input_wmp1jets.par  > output_wmp1jets &
nohup  ./create_ntuple ntuple_list_files/input_wmp2jets.par  > output_wmp2jets &


cmake ../root -Dimt=ON -Dbuiltin_gsl:BOOL=ON -Dgsl_shared:BOOL=ON

cmake ../root -DCMAKE_INSTALL_PREFIX=/truba_scratch/nsonmez/dnn_root/openblas




rm MG5_aMC_v2_5_5/singletop_*_mhc100_v?/Events/run_01_*/tag_1_pythia_events.hep.gz

chan=t2
mass=120

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_${chan}_mhc${mass}_v?/Events/run_01_*/tag_1_delphes_events.root > \
/truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_${chan}_mhc${mass}v2

chan=t2

ls /truba_scratch/nsonmez/MG5_aMC_v2_5_5/singletop_${chan}_mhc${mass}_v?/Events/run_01_*/tag_1_delphes_events.root > \
/truba_scratch/nsonmez/Analysis/ntuple_list_files/list_singletop_${chan}_mhc${mass}v2

g++ -O3 -fPIC -ansi -Wall  -pthread -stdlib=libstdc++ -m64 -I/Users/nsonmez/root/include -I    read_files.cpp   -L/Users/nsonmez/root/lib -lCore -lCint -lRIO -lNet -lHist -lGraf -lGraf3d -lGpad -lTree -lRint -lPostscript -lMatrix -lPhysics -lMathCore -lThread -lpthread -Wl,-rpath,/Users/nsonmez/root/lib -stdlib=libstdc++ -lm -ldl  -lExRootAnalysis -o read_files

sed "s/100/90/g" proc_card_mg5_singletop_t2_mhc100.dat >  proc_card_mg5_singletop_t2t3_mhc90.dat
sed "s/100/110/g" proc_card_mg5_singletop_t2_mhc100.dat >  proc_card_mg5_singletop_t2t3_mhc110.dat
sed "s/100/120/g" proc_card_mg5_singletop_t2_mhc100.dat >  proc_card_mg5_singletop_t2t3_mhc120.dat
sed "s/100/130/g" proc_card_mg5_singletop_t2_mhc100.dat >  proc_card_mg5_singletop_t2t3_mhc130.dat


hadd signal_mhc120_lumi880ifb.root \
singletop_s_mhc120_lumi880ifb_bjet_gt_0.root \
singletop_t2t3_mhc120_lumi880ifb_bjet_gt_0.root \
singletop_tw_mhc120_lumi880ifb_bjet_gt_0.root 

sbatch singletop.slurm s v1 100 
sbatch singletop.slurm s v1 120 
sbatch singletop.slurm tw v1 100 
sbatch singletop.slurm tw v1 120


sbatch singletop.slurm s v1 110 
sbatch singletop.slurm tw v1 110

sbatch singletop.slurm t2t3 v1 110 
sbatch singletop.slurm t2t3 v2 110 
sbatch singletop.slurm t2t3 v3 110 
sbatch singletop.slurm t2t3 v4 110 
sbatch singletop.slurm t2t3 v5 110 
sbatch singletop.slurm t2t3 v6 110 


sbatch singletop.slurm t2t3 v1 120 
sbatch singletop.slurm t2t3 v2 120 
sbatch singletop.slurm t2t3 v3 120 
sbatch singletop.slurm t2t3 v4 120 


cat run_ds?_dc1.uuuu.00200,00200,00001.data > softvirt_dc1_s200.txt
cat run_ds?_dc2.uuuu.00200,00200,00001.data > softvirt_dc2_s200.txt
cat run_ds?_dc3.uuuu.00200,00200,00001.data > softvirt_dc3_s200.txt
cat run_ds?_dc4.uuuu.00200,00200,00001.data > softvirt_dc4_s200.txt
cat run_ds?_dc5.uuuu.00200,00200,00001.data > softvirt_dc5_s200.txt

cat run_ds?_dc1.uuuuu.00200,00200,00001.data > hard_dc1_s200.txt
cat run_ds?_dc2.uuuuu.00200,00200,00001.data > hard_dc2_s200.txt
cat run_ds?_dc3.uuuuu.00200,00200,00001.data > hard_dc3_s200.txt
cat run_ds?_dc4.uuuuu.00200,00200,00001.data > hard_dc4_s200.txt
cat run_ds?_dc5.uuuuu.00200,00200,00001.data > hard_dc5_s200.txt


#!/bin/bash
while false
do
	rm MG5_aMC_v2_5_5/singletop_*/Events/run*/*hep.gz
	sleep 600
done


grep "2      37     5" 2HDMC_mHc90/param_card.dat
grep " 2     -15    16" 2HDMC_mHc90/param_card.dat

grep "\-[0-9]" run_ds?_dc1.uuuuu.*data > softvirt_dc1_s1000.txt
grep "\-[0-9]" run_ds?_dc2.uuuuu.*data > softvirt_dc2_s1000.txt
grep "\-[0-9]" run_ds?_dc3.uuuuu.*data > softvirt_dc3_s1000.txt
grep "\-[0-9]" run_ds?_dc4.uuuuu.*data > softvirt_dc4_s1000.txt
grep "\-[0-9]" run_ds?_dc5.uuuuu.*data > softvirt_dc5_s1000.txt