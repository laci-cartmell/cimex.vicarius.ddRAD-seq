## FST HEATMAP

# Load necessary libraries
install.packages("viridis")
library(readxl)
library(ggplot2)
library(reshape2)
library(viridis)
install.packages("pheatmap")
library(lmerTest)
setwd("F:/RAW_RAD_SWBG/results_2014_2021/2014/")

# Load the Excel file
# Read the matrix from the Excel file
pairwise.WCfst <- read.csv("F:/RAW_RAD_SWBG/results_2014_2021/2014/pairwise.WCfstZ.txt", row.names=1, sep="")# Convert the data frame to a matrix
pairwise.WCfst <- read.csv("F:/RAW_RAD_SWBG/results_2014_2021/2014/pairwise.WCfstZ.csv")
View(pairwise.WCfst)

#create as matrix
pairwise_matrix <- as.matrix(pairwise.WCfst)
View(pairwise_matrix)
# Mask the lower triangular part of the matrix with NA (only keep the upper triangle)
pairwise_matrix[lower.tri(pairwise_matrix)] <- NA

# Create the heatmap using pheatmap, keeping row and column names
pheatmap(pairwise_matrix, 
         cluster_rows = FALSE,       # Don't cluster rows, keep original order
         cluster_cols = FALSE,       # Don't cluster columns, keep original order
         display_numbers = FALSE,     # Display the Fst values on the heatmap
         color = colorRampPalette(c("gray", "blue", "purple"))(100),  # Color gradient from blue to red
         fontsize = 10,              # Font size for the row/column names
         na_col = "transparent",     # Set NA cells to transparent (if applicable)
         bg = "transparent",         #background transparent when exported
         border_color = NA,          # Remove cell borders
         main = "Pairwise Fst Heatmap 2021" )  # Title of the heatmap

dim(boot.wcfst)

str(boot.wcfst)

# Create a significance matrix based on bootstrap confidence intervals
significance_matrix <- matrix(NA, nrow = nrow(pairwise_matrix), ncol = ncol(pairwise_matrix))

for (i in 1:nrow(pairwise_matrix)) {
  for (j in 1:ncol(pairwise_matrix)) {
    if (i < j) {
      lower_ci <- boot.wcfst$ll[i, j]  # Access lower CI
      upper_ci <- boot.wcfst$ul[i, j]  # Access upper CI
      
      # Check if the confidence interval includes zero
      if (lower_ci > 0 || upper_ci < 0) {
        significance_matrix[i, j] <- "*"  # Mark significant
      } else {
        significance_matrix[i, j] <- " "  # Not significant
      }
    }
  }
}

# Mask the lower triangular part of the significance matrix
significance_matrix[lower.tri(significance_matrix)] <- NA

# Create the heatmap using pheatmap
library(pheatmap)

pheatmap(pairwise_matrix, 
         cluster_rows = FALSE,       
         cluster_cols = FALSE,       
         display_numbers = significance_matrix,  
         color = colorRampPalette(c("gray", "blue", "purple"))(100),
         na_col = "transparent",     # Set NA cells to transparent (if applicable)
         bg = "transparent",         #background transparent when exported
         border_color = NA,          # Remove cell borders
         fontsize = 20,              
         main = "Pairwise Fst Heatmap")  



# Remove NA values
non_na_indices <- complete.cases(pairwise_matrix)  # Get rows without NA
filtered_pairwise_matrix <- pairwise_matrix[non_na_indices, non_na_indices]
filtered_significance_matrix <- significance_matrix[non_na_indices, non_na_indices]

# Create the heatmap using pheatmap
library(pheatmap)

pheatmap(filtered_pairwise_matrix, 
         cluster_rows = FALSE,       
         cluster_cols = FALSE,       
         display_numbers = filtered_significance_matrix,  
         color = colorRampPalette(c("gray", "blue", "purple"))(100),  
         fontsize = 10,              
         main = "Pairwise Fst Heatmap (NA Removed)") 


