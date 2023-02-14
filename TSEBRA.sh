#!/bin/bash
#$ -l h_rt=96:00:00
#$ -P alloteropsis
#$ -q alloteropsis.q
#$ -l mem=8G
#$ -l rmem=8G
#$ -pe openmp 2
#$ -v OMP_NUM_THREADS=2
#$ -j y

#####################################################################################
#       Script Name:    TSEBRA.sh
#       Description:    Run TSEBRA to merge transcripts from braker-RNA and braker-proteins
#       Author:         LPereiraG
#       Last updated:   15/11/2022
#####################################################################################

source /usr/local/extras/Genomics/.bashrc

#### Directories and files
wd=/mnt/fastdata/bo1lpg/annotation/Aristida
config=/shared/dunning_lab/Shared/programs/TSEBRA/config/default.cfg

#### Scripts
tsebra=/shared/dunning_lab/Shared/programs/TSEBRA/bin/tsebra.py

#### Step 1: combine transcripts with TSEBRA
module load apps/python/conda
source activate /shared/dunning_lab/Shared/conda_env/braker2
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/bin:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/dependencies:$PATH"
cd ${wd}
${tsebra} -g braker_RNA/augustus.hints.gtf,braker_prot/augustus.hints.gtf -c ${config} \
  -e braker_RNA/hintsfile.gff,braker_prot/hintsfile.gff -o braker_combined.gtf
