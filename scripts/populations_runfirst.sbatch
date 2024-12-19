#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=5G
#SBATCH --output=populations14_hwe.out
#SBATCH --error=populations14_hwe.err
#SBATCH --time=13:00:00
#SBATCH --job-name=pop_2014_hwefilter
#SBATCH --chdir=/scratch/lcartmell/stacks_2014/
#
#################################################
# YEAR - 2014
#script that reruns populations to output the result in structure format

#load packages
module load Stacks/2.65-foss-2023a

#make output directory
mkdir ./hwe_filtered2/

#call variables for populations program
POPMAP=../popmap/popmap_2014_10x.txt
FILES=./integrated3/
OUTPUT=./hwe_filtered2/

#set parameters to run populations for first time
#using only a single snp per locus --write-single-snp to avoid loci in LD
#and --hwe to calculate divergence from HWE at each locus
# --fstats to calculate fstatistics
# --min-samples-overall to filter min percentage of individuals across populations

populations -P $FILES -M $POPMAP -O $OUTPUT --min-populations 23 --min-maf .03 --write-random-snp --hwe --fstats --ordered-export --smooth
