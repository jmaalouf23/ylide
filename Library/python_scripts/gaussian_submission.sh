#!/bin/bash -l
export g16root=/home/gridsan/groups/manthiram_lab/gaussian

export PATH=$g16root/g16/:$g16root/gv:$PATH

echo "Gaussian PATH"
which g16
input=$1
echo "============================================================"
echo "Job ID : $SLURM_JOB_ID"
echo "Job Name : $SLURM_JOB_NAME"
echo "Starting on : $(date)"
echo "Running on node : $SLURMD_NODENAME"
echo "Current directory : $(pwd)"
echo "============================================================"

export GAUSS_SCRDIR=/home/gridsan/groups/manthiram_lab/scratch/$SLURM_JOB_NAME-$SLURM_JOB_ID

export GAUSS_SCRDIR
. $g16root/g16/bsd/g16.profile

echo "GAUSS_SCRDIR : $GAUSS_SCRDIR"
mkdir -p $GAUSS_SCRDIR
chmod 750 $GAUSS_SCRDIR
g16 $input

rm -rf $GAUSS_SCRDIR

echo "DONE!"
