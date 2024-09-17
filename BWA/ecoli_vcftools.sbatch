#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_vcftools_filtered_%J_stdout.txt
#SBATCH --error=ecoli_vcftools_Filtered_%J_stderr.txt
#SBATCH --job-name=ecoli_vcftools_Filtered
#

bash /home/biol726303/BIOL7263_Genomics/scripts/BWA/ecoli_vcftools_filtered.sh
