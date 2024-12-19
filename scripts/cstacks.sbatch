#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=30G
#SBATCH --output=cstacks_14.out
#SBATCH --error=cstacks_14.err
#SBATCH --time=48:00:00
#SBATCH --job-name=cstacks_14
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell
#
#################################################

# run the cstacks part of STACKS (after ustacks, before sstacks)
# creates catalong for all loci

#load packages
module load Stacks/2.65-foss-2023a

#run ustacks for all individuals in ustacks output and add in catalog-specific popmap
# parameters - M = 3, n=4
cstacks -P ./stacks_2014/ -M /scratch/lcartmell/popmap/catalog_1mil_2014.txt -n 4

# 68 samples in 18 hours
# maybe use the popmap with 80% of smaples????
# options for individually adding samples to catalog and for modifying catalog vs other samples gaps
