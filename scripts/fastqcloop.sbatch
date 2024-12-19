#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=1800
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=04:30:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#

############

#load module
module load FastQC

#make directory
mkdir fastqc_reports

#
for file in cvicarius_stacks/*; do
	fastqc $file -o fastqc_reports/
done
