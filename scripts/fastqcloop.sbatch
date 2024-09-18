#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=6G
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=36:30:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/cvicarius_stacks/
#

############

#load module
module load FastQC

mkdir fastqc

#
for file in /scratch/lcartmell/cvicarius_stacks/process_radtags_bothREs/pr/*; do
	fastqc $file -o fastqc/
done
