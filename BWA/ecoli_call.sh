#task 14 automated analysis genetates a vcf file

bcftools call -c -v --ploidy 1 -O v -o /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/var.called.vcf /scratch/biol726303/BIOL7263_Genomics/sequencing_data/ecoli/mapping_to_reference/var.raw.vcf

#-c -v --ploidy -- call variants with ploidy of 1 and output only variant sites in vcf 
#-P Illumina - illumina data 
