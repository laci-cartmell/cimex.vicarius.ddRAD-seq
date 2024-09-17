#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_sumstat_%J_stdout.txt
#SBATCH --error=ecoli_sumstat_%J_stderr.txt
#SBATCH --job-name=ecoli_samtools_sumstats
#

bash /home/biol726303/BIOL7263_Genomics/scripts/BWA/samtools_flagstat.sh
