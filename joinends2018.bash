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

# joining paired ends
echo "joining paired ends for 2018, have some patience young one"
time join_paired_ends.py -m fastq-join -b ~/2018_02_smb/Index.fastq.gz -f ~/2018_02_smb/Read1.fastq.gz -r ~/2018_02_smb/Read2.fastq.gz -o ~/2018_02_smb/fastqjoined_ends

#deactivating environment 
source deactivate
