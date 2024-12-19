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

#file for array
#FILENAME=$(sed -n ${SLURM_ARRAY_TASK_ID}p popmaps/popmap_all_integer.txt | cut -f1)

#echo file name is: ${FILENAME}

#run sstacks
sstacks -P ./stacks_2014/ -M ./popmap/popmap_2014.txt 

#sstacks -c ./denovo_nt -s ./denovo_nt/${FILENAME} -o ./denovo_nt




#run ustacks with M=2, m=3, n=2
#ustacks -f ./denovo_nt/process_radtags/${FILENAME}.fq.gz -t gzfastq -o ./denovo_nt -i ${SLURM_ARRAY_TASK_ID} -M 3 -m 3 -N 4 --force-diff-len
