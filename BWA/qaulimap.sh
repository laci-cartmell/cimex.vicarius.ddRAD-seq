#task 10 - QualiMap: summarizes mapped alignments in more detail than flagstat
# assess sequencing and alignment for problems and biases

qualimap bamqc -outdir /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/bamqc -bam /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/ecoli_mapped_namesort_fixmate_sort_markdup.bam -gff /scratch/biol726303/BIOL7263_Genomics/reference_sequences/ecoli/GCF_000005845.2_ASM584v2_genomic.gff

#view qualimapReport.html afterwards 

#description of options
# -bam <arg>                           Input mapping file in BAM format
# -gff,--feature-file <arg>            Feature file with regions of interest in
#                                      GFF/GTF or BED format
# -outdir <arg>                        Output folder for HTML report and raw
#                                      data.
