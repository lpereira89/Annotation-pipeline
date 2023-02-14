#!/bin/bash
#$ -l h_rt=96:00:00
#$ -l mem=8G
#$ -l rmem=8G
#$ -pe openmp 1
#$ -v OMP_NUM_THREADS=1
#$ -j y

#####################################################################################
#       Script Name:    PrepareProtDB.sh
#       Description:    Prepare protein database for annotation with BRAKER2
#       Author:         LPereiraG
#       Last updated:   13/11/2022
#####################################################################################

#source /usr/local/extras/Genomics/.bashrc

# Tutorial https://github.com/gatech-genemark/ProtHint#protein-database-preparation

#### Directories and files
wd=/mnt/fastdata/bo1lpg/annotation/protein-database
Aristida=/mnt/fastdata/bo1lpg/Aristida-v3/A03_results/Aristida_nuclear.asm.bp.p_ctg.fa

#### Step 1: download proteins
cd ${wd}
# wget https://v100.orthodb.org/download/odb10_plants_fasta.tar.gz
# tar xvf odb10_plants_fasta.tar.gz
# cat plants/Rawdata/* > ../../proteins.fasta

#### Step 2: run ProtHint
# mkdir Aristida Stipagrostis
module load apps/python/conda
source activate /shared/dunning_lab/Shared/conda_env/braker2
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/bin:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4:$PATH"
export PATH="/shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/dependencies:$PATH"
python /shared/dunning_lab/Shared/programs/GeneMark/gmes_linux_64_4/ProtHint/bin/prothint.py ${Aristida} proteins.fasta \
  --workdir ${wd}/Aristida --threads 1
