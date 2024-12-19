#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --mem=15G
#SBATCH --output=int_14.out
#SBATCH --error=int_14.err
#SBATCH --time=1:00:00
#SBATCH --job-name=pop14_10x
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/stacks_2014/
#
#################################################

#script that reruns populations to output the result in structure format
# how many genetic groups are present in a set of individuals

#First, create whitelist of 5000 loci in hwe & single-snp per locus

# Choose loci out of HWE (p-value < 0.01)
# Print the first column (Locus ID)
# Sort and return unique values
# Shuffle 5000 random loci

cat ./hwe_filtered2/populations.sumstats.tsv | grep -v '^#' | awk '$20 < 0.01 {print $0}' | cut -f 1 | sort -n -u | sort -n > blacklist.txt
# shuf -n 1000

#load packages
module load Stacks/2.65-foss-2023a

#call variables for populations program
POPMAP=../popmap/popmap_2014_10x.txt
FILES=./integrated3/
mkdir hwe_blacklist
OUTPUT=./hwe_blacklist/

#run pop w/blacklist, hwe, single-snp
populations -P $FILES -M $POPMAP -O $OUTPUT --blacklist ./blacklist.txt --max-obs-het 0.5 --min-samples-per-pop 0.7 --min-mac 3 --write-random-snp --structure --genepop --vcf --fstats --hwe --vcf --ordered-export --smooth

# --min-samples-per-pop 0.5 --min-populations 9 --min-maf .03 --write-random-snp --hwe --plink --fstats --genepop --vcf --ordered-export --smooth
