#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=3G
#SBATCH --output=jobname.21_%J_stdout.txt
#SBATCH --error=jobname.21_%J_stderr.txt
#SBATCH --time=08:00:00
#SBATCH --job-name=Integrate_2021
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#

############
# Use catalog_loci.bam from previous step (bwamem)
# Combines loci with genome to get locus information from a ref. genome
# Output catalog.fa.gz, catalog.call, locus_coordinates.tsv
# Next: run populations 
#load module
module load Stacks/2.65-foss-2023a

#Integrate de novo to reference genome
mkdir ./stacks_2021/integrated3/
stacks-integrate-alignments -P ./stacks_2021/ -B ./stacks_2021/integrated/catalog_loci.bam -O ./stacks_2021/integrated3/
