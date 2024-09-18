#process for radtags based on Rochette&Catchen2017
#	QC that checks barcodes and RAD cutsites
#	Demultiplexes based on index
#	Requires barcode file for below script


#load Stacks
module load Stacks/2.65-foss-2023a

# dir for demultiplexed files - cleaned
mkdir L2203-08_re

#call the barcode file and raw directory, 
barcode=./barcodes/barcodes_L2203-08.txt
#
process_radtags -f /scratch/lcartmell/cvicarius_stacks/stacks/L2203_08_S3_L002_R1_001.fastq.gz -o ./L2203-08_re/ -b $barcode  --inline-null -c -q -r --filter-illumina --score-limit 30 --renz-1 pstI --renz-2 mspI --retain-header