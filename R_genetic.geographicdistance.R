# Install packages if not already installed
install.packages(c("vcfR", "vegan", "spdep", "readxl", "ggplot2"))

# Load required libraries
library(vcfR)
library(vegan)
library(spdep)
library(readxl)
library(ggplot2)


# Load VCF file
vcf_file <- "path/to/your_file.vcf"
vcf_data <- read.vcfR(vcf_file)

# Extract the genotypes (assuming you want to use the genotype matrix)
genotype_matrix <- extract.gt(vcf_data, element = "GT")


# Load geographic coordinates
excel_file <- "path/to/your_coordinates.xlsx"
geo_data <- read_excel(excel_file)

# Assuming columns are named 'x' and 'y'
coords <- geo_data[, c("x", "y")]


# Load required library for distance calculations
library(geosphere)

# Compute pairwise geographic distances
geo_distances <- distm(as.matrix(coords), fun = distVincentySphere)
geo_distances <- as.dist(geo_distances)


# Convert genotype matrix to a genetic distance matrix
# Example: Using a simple genetic distance measure
genetic_distances <- vegdist(genotype_matrix, method = "bray")  # Bray-Curtis distance


# Create a spatial weights matrix
# Assuming coordinates are in the same units and are directly comparable
coords_spatial <- as.matrix(coords)
nb <- dnearneigh(coords_spatial, 0, max(geo_distances))
listw <- nb2listw(nb, style = "W")

# Compute Moran's I for genetic distances
moran_test <- moran.test(as.vector(genetic_distances), listw)
print(moran_test)


# Perform the Mantel test
mantel_result <- mantel(geo_distances, genetic_distances)
print(mantel_result)


# Convert genetic distances to a data frame
genetic_distances_df <- as.data.frame(as.matrix(genetic_distances))
geo_distances_df <- as.data.frame(as.matrix(geo_distances))

# Plot genetic distance vs. geographic distance
plot(geo_distances_df, genetic_distances_df, xlab = "Geographic Distance", ylab = "Genetic Distance")
abline(lm(genetic_distances_df ~ geo_distances_df))


