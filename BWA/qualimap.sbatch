#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_qaulimap_%J_stdout.txt
#SBATCH --error=ecoli_qualimap_%J_stderr.txt
#SBATCH --job-name=ecoli_qaulimap
#

bash /home/biol726303/BIOL7263_Genomics/scripts/BWA/qaulimap.sh
