#! /bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=12G
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=15:00:00
#SBATCH --job-name=radtags_L2209-02_re
#SBATCH --mail-user=ljc454@utulsa.edu
#SBATCH --mail-type=ALL
#SBATCH --chdir=/scratch/lcartmell/
#

############

#process for radtags based on Rochette&Catchen2017
#	QC that checks barcodes and RAD cutsites
#	Demultiplexes based on index
#	Requires barcode file for below script


#load Stacks
module load Stacks/2.65-foss-2023a


# dir for demultiplexed files - cleaned
#mkdir L2209-02_re

#call the barcode file and raw directory, 
barcode=./barcodes/barcodes_L2209-02.txt

#
#
#process_radtags -p process_radtags/ -o ./raw_nt/ -b $barcode -e pstI --inline-null -c -q -r -D 
process_radtags -f cvicarius_stacks/L2209-02_S2_L002_R1_001.fastq.gz -o ./cleaned/ -b $barcode --renz-1 pstI --renz-2 mspI --inline-null -c -q -r -D
