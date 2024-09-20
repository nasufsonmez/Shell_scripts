./run_bench31v2_y uuuuu 3000,3000,2
nohup  ./run_bench21v2_y uuuuu 3000,3000,2 &
nohup  ./run_bench22v2_y uuuuu 3000,3000,2 &
nohup  ./run_bench28v2_y uuuuu 3000,3000,2 &
nohup  ./run_bench32v2_y uuuuu 3000,3000,2 &

./run_bench34v2_y uuuuu 3000,3000,2


./tools/data run_bench21v2_y.uuuuu.03000,03000,00002
./tools/data run_bench22v2_y.uuuuu.03000,03000,00002
./tools/data run_bench28v2_y.uuuuu.03000,03000,00002
./tools/data run_bench31v2_y.uuuuu.03000,03000,00002
./tools/data run_bench32v2_y.uuuuu.03000,03000,00002
./tools/data run_bench34v2_y.uuuuu.03000,03000,00002


./run_bench21v2_pT uuuuu 3000,3000,2
./run_bench22v2_pT uuuuu 3000,3000,2
./run_bench28v2_pT uuuuu 3000,3000,2
./run_bench31v2_pT uuuuu 3000,3000,2
./run_bench32v2_pT uuuuu 3000,3000,2
./run_bench34v2_pT uuuuu 3000,3000,2

./tools/data run_bench21v2_pT.uuuuu.03000,03000,00002
./tools/data run_bench22v2_pT.uuuuu.03000,03000,00002
./tools/data run_bench28v2_pT.uuuuu.03000,03000,00002
./tools/data run_bench31v2_pT.uuuuu.03000,03000,00002
./tools/data run_bench32v2_pT.uuuuu.03000,03000,00002
./tools/data run_bench34v2_pT.uuuuu.03000,03000,00002



./run_bench21v2_delta_y uuuuu 3000,3000,2
./run_bench22v2_delta_y uuuuu 3000,3000,2
./run_bench28v2_delta_y uuuuu 3000,3000,2
./run_bench31v2_delta_y uuuuu 3000,3000,2
./run_bench32v2_delta_y uuuuu 3000,3000,2
./run_bench34v2_delta_y uuuuu 3000,3000,2


./tools/data run_bench21v2_delta_y.uuuuu.03000,03000,00002
./tools/data run_bench22v2_delta_y.uuuuu.03000,03000,00002
./tools/data run_bench28v2_delta_y.uuuuu.03000,03000,00002
./tools/data run_bench31v2_delta_y.uuuuu.03000,03000,00002
./tools/data run_bench32v2_delta_y.uuuuu.03000,03000,00002
./tools/data run_bench34v2_delta_y.uuuuu.03000,03000,00002


exit 0




make run_bench21v2_delta_y
make run_bench21v2_y
make run_bench22v2_delta_y
make run_bench22v2_y
make run_bench28v2_delta_y
make run_bench28v2_y
make run_bench31v2_delta_y
make run_bench31v2_y
make run_bench32v2_delta_y
make run_bench32v2_y
make run_bench34v2_delta_y
make run_bench34v2_y

make run_bench21v2_pT
make run_bench22v2_pT
make run_bench28v2_pT
make run_bench31v2_pT
make run_bench32v2_pT
make run_bench34v2_pT

