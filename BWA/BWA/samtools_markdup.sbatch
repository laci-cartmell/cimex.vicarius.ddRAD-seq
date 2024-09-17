#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_samtools_markdup_%J_stdout.txt
#SBATCH --error=ecoli_samtools_markdup_%J_stderr.txt
#SBATCH --job-name=ecoli_samtool_markdup
#

bash /home/biol726303/BIOL7263_Genomics/scripts/BWA/samtools_markdup.sh
