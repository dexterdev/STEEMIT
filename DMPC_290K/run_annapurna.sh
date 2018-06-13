#!/bin/bash

#PBS -l nodes=32:ncpus=8
#PBS -N DMPC_patch
#PBS -q workq
#PBS -V
#PBS -M devanand.t.1986@gmail.com
#PBS -m abe 
#PBS -j oe

cd $PBS_O_WORKDIR



######Create the machinefile according the nodes allocated###############
nodes=`cat $PBS_NODEFILE`
for n in $nodes; do
echo -e ",$n 8\c" >> tmp.nodes
done
cat tmp.nodes |cut -c2- > PBS_NODEFILE_$PBS_JOBID
rm -rf tmp.nodes
#############Your application command line#########################

export  MPI_DSM_DISTRIBUTE=1
NODEFILE=PBS_NODEFILE_$PBS_JOBID

mpirun -v -f $NODEFILE /opt/app/namd/2.9/namd2 ./DMPC_patch_NPT_290K_0_20ns.config  >& DMPC_patch_NPT_290K_0_20ns.out
