#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem=8G
#SBATCH --output=ecoli_clnup_%J_stdout.txt
#SBATCH --error=ecoli_clnup_%J_stderr.txt
#SBATCH --job-name=ecoli_mapped_cleanup
#

rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped.bam
rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped.sam
rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort.bam
rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate.bam
rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort.bam
rm /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_sorted.bam
