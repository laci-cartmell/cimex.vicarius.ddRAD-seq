#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=1024
#SBATCH --output=jobname_%J_stdout.txt
#SBATCH --error=jobname_%J_stderr.txt
#SBATCH --time=00:10:00
#SBATCH --job-name=pr_statsextract
#SBATCH --chdir=/scratch/lcartmell/cvicarius_stacks/
#
############

#stats from processed radtags log
#load Stacks
module load Stacks

# List of directories
directories=(
	"/scratch/lcartmell/cvicarius_stacks/L2203-01_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2203-02_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2203-08_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2209-01_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2209-02_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2210-01_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2211-01_re/"
	"/scratch/lcartmell/cvicarius_stacks/L2211-02_re/"
)

# process-radtags log file
file="process_radtags.stacks.log"

# Loop through each pr directory
for dir in "${directories[@]}"; do
    # Check if the file exists in the current directory
    if [[ -f "$dir/$file" ]]; then
        echo "Processing $file in $dir"
        stacks-dist-extract --pretty "$dir/$file" per_barcode_raw_read_counts >> barcode_raw_read_counts.txt
	stacks-dist-extract --pretty "$dir/$file" per_file_raw_read_counts >> per_file_raw_read_counts.txt
	stacks-dist-extract --pretty "$dir/$file" total_raw_read_counts >> total_raw_read_counts.txt
    else
        echo "File $file not found in $dir"
    fi
done

# options    cat logfile | stacks-dist-extract [--pretty] [--section section]

