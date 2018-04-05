#!/bin/bash
#SBATCH -t 6:00:00
#SBATCH -n 24
#SBATCH -p normal

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
-o cdout_2016 \
-i ~/2017_03_smb/otus_2017/otu_table.biom \
-m ~/2017_03_smb/map.tsv \
-t ~/2017_03_smb/otus_2017/97_otus.tree \
-e 1000

# counting sequences 
echo "Counting sequences"
time count_seqs.py -i ~/2017_03_smb/slout_2017/seqs.fna

#deactivating environment
source deactivate 