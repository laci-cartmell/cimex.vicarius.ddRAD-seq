#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=64G
#SBATCH --array=1-136
#SBATCH --output=ustacks_2021_%A%a.out.txt
#SBATCH --error=ustacks_2021_%A%a.err.txt
#SBATCH --time=04:05:00
#SBATCH --job-name=ustacks_array_21
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#
#################################################

#script that runs the sstacks part of STACKS
#output file has the coverage depth for each locus

#load packages
module load Stacks/2.65-foss-2023a

#file for array
FILENAME=$(sed -n ${SLURM_ARRAY_TASK_ID}p popmap/popmap_2021.txt | cut -f1)

echo file name is: ${FILENAME}
M=3
m=4

mkdir stacks_2021/
chmod 777 stacks_2021/*

#run ustacks with M=2, m=2, n=2
ustacks -f ./cleaned/${FILENAME}.fq.gz -t gzfastq -o ./stacks_2021/ -M $M -m $m
