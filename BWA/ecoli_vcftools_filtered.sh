#task 14 automated analysis genetates a vcf file
# vcftools for filtering - only >90 freq; min depth of 10; min/max alleles =2

vcftools --minDP 10 --min-alleles 2 --max-alleles 2 --non-ref-af 0.9 --vcf /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/var.called.vcf --recode --recode-INFO-all --out /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/var.called.filt 

#-O v - uncompressed vcf
#-P Illumina - illumina data 
