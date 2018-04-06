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

# splitting libraries 
echo "splitting libraries BOOYEAH"
time split_libraries_fastq.py --barcode_type 12 -i ~/2018_02_smb/fastqjoined_ends/fastqjoin.join.fastq -m ~/2018_02_smb/map_incomplete.tsv -b ~/2018_02_smb/fastqjoined_ends/fastqjoin.join_barcodes.fastq -o ~/2018_02_smb/slout_2018_x/ -q 3 --rev_comp_barcode --rev_comp_mapping_barcodes

#deactivating environment
source deactivate 