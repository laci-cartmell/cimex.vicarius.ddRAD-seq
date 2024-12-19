#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=45G
#SBATCH --output=gstacks_2014_%J.out.txt
#SBATCH --error=gstacks_2014_%J.err.txt
#SBATCH --time=15:00:00
#SBATCH --job-name=gstacks_2014
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#
#################################################

### or does it follow bwa/integrate?? try with both methods to  igv
# gstack follows tsv2bam in the denovo pipeline from STACKS; bwa / integrate scripts next
# identifies SNPs w/in all samples for each locus and genotypes each individual at each identified snp
# phases the SNPS at each locus into a set of haplotypes


#load packages
module load Stacks/2.65-foss-2023a

#gstacks for single-end denovo
#gstacks -P ./stacks_2014/ -M ./popmap/popmap_2014.txt -O ./stacks_2014/

mkdir stacks_2014/integrated_2/
#gstacks for reference/
gstacks -B ./stacks_2014/ -O ./stacks_2014/integrated_2
#input dir must have *.matches.bam files

