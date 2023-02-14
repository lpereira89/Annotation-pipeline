#!/bin/bash
#$ -l h_rt=96:00:00
#$ -P alloteropsis
#$ -q alloteropsis.q
#$ -l mem=8G
#$ -l rmem=8G
#$ -pe openmp 6
#$ -v OMP_NUM_THREADS=6
#$ -j y

#####################################################################################
#       Script Name:    AlignRNA.sh
#       Description:    Align RNA seq data (Illumina) to the draft assemblies
#       Author:         LPereiraG
#       Last updated:   15/11/2022
#####################################################################################

#### Directories and files
wd=/mnt/fastdata/bo1lpg/annotation/
Aristida=${wd}/ref-genomes/Aristida_nuclear-softMasked.fa
hints=/mnt/fastdata/bo1lpg/annotation/protein-database/Aristida/prothint_augustus.gff

#### Step 1: run braker2 with RNA-seq data
cd ${wd}/Aristida
module load apps/python/conda
source activate /shared/dunning_lab/Shared/conda_env/braker2
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/bin:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/dependencies:$PATH"
braker.pl --genome ${Aristida} --hints ${hints} --softmasking --cores 6
