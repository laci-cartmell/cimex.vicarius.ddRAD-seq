# cimex.vicarius.ddRAD-seq
 The scripts and codes used for analyses regarding geographic distance and genetic distance from Illumina ddradseq data processed in STACKS

A correlation analysis - mantel's test
A spatial autocorrelation analysis - moran's I
View the distribution - Genetic Distance Distribution Analysis

---
Outline of steps to take
- Read and Prepare Data:
  - use vcfR to extract data from "populations.snps.vcf" (STACKS - populations output)
  - use readxl to read geographic coordinates from an Excel file.
  - use geosphere to compute geographic distances from geo. cords

- Moran's I 
  - use spdep to determine if spatial autocorrelation exists

- Mantel Test
  - use vegan to determine if correlation exists between genetic and geographic distances

- Genetic Distance Distribution Analysis:
  - use ggplot2 to plot genetic distance vs. geographic distance

