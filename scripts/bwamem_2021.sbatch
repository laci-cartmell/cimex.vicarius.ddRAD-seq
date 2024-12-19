#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=25G
#SBATCH --output=bwamem_2021_stdout.txt
#SBATCH --error=bwamem_2021_stderr.txt
#SBATCH --time=02:00:00
#SBATCH --job-name=bwamem_2021
#SBATCH --chdir=/scratch/lcartmell/
#
############

# Use file catalog_loci.bam from denovo run (previous step that aligns loci)
# Align the loci from de novo with our referene genome with bwa
# Convert bwa to sam so that it can be used with STACKS pipeline
# Output is catalog_loci.bam that will be used in stacks-integrate-alignments

#load module
module load Stacks/2.65-foss-2023a

#use the BWA(Burrows-Wheeler Aligner) program to align the cleaned reads to the reference genome
#load the BWA module and SAMtools module for file conversion
module load BWA

#Align catalog.fa.gz to reference genome
#mkdir ./stacks_2021/integrated/
cd ./stacks_2021/
touch integrated/catalog_loci.bam

#create index for reference genome
bwa index /home/lcartmell/genome/GCF_000648675.2/GCF_000648675.2_Clec_2.1_genomic.fna

#align de novo loci to the reference genome
bwa mem /home/lcartmell/genome/GCF_000648675.2/GCF_000648675.2_Clec_2.1_genomic.fna ./catalog.fa.gz | samtools view -b | samtools sort > ./integrated/catalog_loci.bam
##
#index the mapped alignment
samtools index /scratch/lcartmell/stacks_2021/integrated/catalog_loci.bam
 
#mapping statistics
samtools flagstat /scratch/lcartmell/stacks_2021/integrated/catalog_loci.bam > /scratch/lcartmell/stacks_2014/integrated/mappingstats.txt

##
### extract loci not aligned
touch ./integrated/unmapped.bam
samtools view -b -f 4 ./integrated/catalog_loci.bam > ./integrated/unmapped.bam

#convert to fasta
touch ./integrated/unmapped.fasta
samtools fasta -f 4 ./integrated/unmapped.bam > ./integrated/unmapped.fasta
