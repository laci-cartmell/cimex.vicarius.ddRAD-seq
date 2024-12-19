#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=28G
#SBATCH --output=sstacks_14.out.txt
#SBATCH --error=sstacks.14.err.txt
#SBATCH --time=24:05:00
#SBATCH --job-name=sstacks14
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#
#################################################

#script that runs the sstacks part of STACKS
#output file has the coverage depth for each locus

#load packages
module load Stacks/2.65-foss-2023a

#run sstacks
sstacks -P ./stacks_2014/ -M ./popmap/popmap_2014.txt 
