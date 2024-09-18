#process for radtags based on Rochette&Catchen2017
#	QC that checks barcodes and RAD cutsites
#	Demultiplexes based on index
#	Requires barcode file for below script


#load Stacks
module load Stacks/2.65-foss-2023a


# dir for demultiplexed files - cleaned
mkdir L2210-01_re

#call the barcode file and raw directory, 
barcode=./barcodes/barcodes_L2210-01.txt
#
process_radtags -f /scratch/lcartmell/cvicarius_stacks/stacks/L2210-01_S3_L001_R1_001.fastq.gz -o ./L2210-01_re/ -b $barcode --renz-1 pstI --renz-2 mspI --inline-null -c -q -r --filter-illumina --score-limit 30
