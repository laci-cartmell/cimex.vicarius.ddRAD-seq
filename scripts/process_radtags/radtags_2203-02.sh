#process for radtags based on Rochette&Catchen2017
#	QC that checks barcodes and RAD cutsites
#	Demultiplexes based on index
#	Requires barcode file for below script


#load Stacks
module load Stacks/2.65-foss-2023a

mkdir L2203-02_re
#call the barcode file and raw directory, 
barcode=./barcodes/barcodes_L2203_2B_v2.txt
#
#
#process_radtags -p Illumina/ -o ./raw_trimmed/ -b $barcode -e pstI --inline-null -c -q -r -D --truncate 132 
process_radtags -f /scratch/lcartmell/cvicarius_stacks/stacks/L2203_02B_S2_L002_R1_001.fastq.gz -o ./L2203-02_re/ -b $barcode --inline-null -c -q -r --renz-1 pstI --renz-2 mspI --filter-illumina --score-limit 30 --retain-header