#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=28G
#SBATCH --array=1-136
#SBATCH --output=%A_%a.out.txt
#SBATCH --error=%A%a_err.txt
#SBATCH --time=24:05:00
#SBATCH --job-name=sstacks_array
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

#run sstacks
#sstacks -P ./denovo_nt/ -M ./popmaps/popmap_all_integer.txt 

sstacks -c ./stacks_2021/ -s ./stacks_2021/${FILENAME} -o ./stacks_2021


#run ustacks with M=2, m=3, n=2
#ustacks -f ./denovo_nt/process_radtags/${FILENAME}.fq.gz -t gzfastq -o ./denovo_nt -i ${SLURM_ARRAY_TASK_ID} -M 3 -m 3 -N 4 --force-diff-len
