#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_index_bam_%J_stdout.txt
#SBATCH --error=ecoli_index_bam_%J_stderr.txt
#SBATCH --job-name=ecoli_indexbam
#

bash /home/biol726303/BIOL7263_Genomics/scripts/BWA/ecoli_index_bam.sh
