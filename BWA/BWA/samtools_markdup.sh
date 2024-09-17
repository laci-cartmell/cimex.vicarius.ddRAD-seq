#samtools - marking and removing PCR duplicates

#sort by read name
samtools sort -n -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort.bam /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped.bam

#add ms & MC tags for markdup program - bwa leaves off FLAG info in the SAM file
samtools fixmate -m /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort.bam /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate.bam

#resort BAM file by chromosomal position
samtools sort -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort.bam /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate.bam

#remove the duplicates -r option
samtools markdup -r /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort.bam /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort_markdup.bam 
