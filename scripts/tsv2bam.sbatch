#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=15G
#SBATCH --output=tsv2bam_2021.out.txt
#SBATCH --error=tsv2bam_2021.err.txt
#SBATCH --time=03:00:00
#SBATCH --job-name=tsv2bam_2021
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#
#################################################

#follows core denovo pipeline from STACKS
# realigns by locus instead of samples

#load packages
module load Stacks/2.65-foss-2023a

m=4

#tsv2bam
tsv2bam -P ./stacks_2021/ -M ./popmap/popmap_2021.txt
