#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=6G
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=14:00:00
#SBATCH --job-name=radtags_all
#SBATCH --chdir=/scratch/lcartmell/cvicarius_stacks/
#
############

#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2203-01.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2209-01.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2203-02.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2210-01.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2211-02.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2209-02.sh
#bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2203-08.sh
bash /scratch/lcartmell/cvicarius_stacks/scripts/process_radtags/radtags_2211-01.sh
