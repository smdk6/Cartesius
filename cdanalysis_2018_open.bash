#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -n 24
#SBATCH -p short

#Load modules
module load eb
module load Miniconda2

# loading virtualenv
source activate qiime1

# setting temporary directory
export TMPDIR=~/qiime_tmp

# diversity analyses
echo "diversity analyses"
time core_diversity_analyses.py --recover_from_failure \
-o ~/2018_02_smb/cdout_2018_open \
-i ~/2018_02_smb/otus_2018_open/otu_table.biom \
-m ~/2018_02_smb/map.tsv \
-t ~/2018_02_smb/otus_2018_open/97_otus.tree \
-e 1000

# counting sequences 
echo "Counting sequences"
time count_seqs.py -i ~/2018_02_smb/slout_2018_x/seqs.fna

#deactivating environment
source deactivate 