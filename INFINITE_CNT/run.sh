#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --job-name=CNT
#SBATCH --partition=nandagpuq

#SBATCH --export=all
#SBATCH --mail-type=ALL
#SBATCH --mail-user=devanand.t.1986@gmail.com


cd $SLURM_SUBMIT_DIR
cat $SLURM_JOB_NODELIST > hostfile_$SLURM_JOBID

#MPI Case
module unload intel/2017
module load intel/2015
module load namd/2.10

mpirun -v -np 16 /opt/apps/namd/2.10/namd2 ./test.config  >& out
