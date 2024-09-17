#task 14 automated analysis genetates a vcf file
#variant calling using bcftools, generate a pileup file which contains only the locations w variants

bcftools mpileup -O v -P Illumina --threads 4 -f /scratch/biol726303/BIOL7263_Genomics/reference_sequences/ecoli/GCF_000005845.2_ASM584v2_genomic.fna /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort_markdup.bam > /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/var.raw.vcf

#-O v - uncompressed vcf
#-P Illumina - illumina data 
