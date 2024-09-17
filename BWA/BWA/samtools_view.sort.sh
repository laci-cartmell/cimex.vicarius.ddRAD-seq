# samtools view - after indexing and converting to sam format
# -T fasta format
#-b output in BAM
#-S input is SAM

# samtools sort 
# -O output into bam

#bwa mem -t 4 /scratch/biol726303/BIOL7263_Genomics/reference_sequences/ecoli/GCF_000005845.2_ASM584v2_genomic /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/trimmed_reads_val_1.fq.gz /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/trimmed_reads_val_2.fq.gz -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped.sam | samtools sort -O bam -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_sorted_onecommand.bam

samtools sort /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped.bam -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_sorted.bam
