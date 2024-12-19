#mantel test in r

# Install necessary packages if you haven't already
install.packages("vegan")  # For Mantel test
install.packages("geosphere")  # For calculating geographic distance if you need
# Load libraries
library(vegan)
library(geosphere)
library(readr)
#set working dir
setwd("F:/RAW_RAD_SWBG/results_2014_2021/2021/")


# Load the pairwise Fst matrix (assuming it's a CSV)
fst_matrix <- as.matrix(read.csv("F:/RAW_RAD_SWBG/results_2014_2021/2021/pairwise.WCfstZ.txt", row.names=1, sep=""))   # Convert the data frame to a matrix
class(fst_matrix)

# Load the geographic distance matrix - distm function from the geosphere
coords2014 <- read_csv("F:/RAW_RAD_SWBG/coords2014_num.csv", 
                       col_names = FALSE)
coords2021 <- read_csv("F:/RAW_RAD_SWBG/coords2021_num.csv", 
                       col_names = FALSE)

#create matrix with no colony id
mmatrix <- as.matrix(coords2021[,-1])
#carry over teh col names
colnames(mmatrix) <- c("longitude", "latitude")
# Calculate geographic distances (WGS84)
geog_dist <- distm(mmatrix[, c("longitude", "latitude")], fun = distGeo)


# Run Mantel test
mantel_result <- mantel(fst_matrix, geog_dist, method="pearson", permutations=9999)

# Print the results
print(mantel_result)

# Flatten the matrices to create vectors of genetic and geographic distances
fst_vector <- as.vector(fst_matrix[upper.tri(fst_matrix)])
geog_vector <- as.vector(geog_dist[upper.tri(geog_dist)])

# Plot genetic distance vs geographic distance
plot(geog_vector, fst_vector, xlab = "Geographic Distance", ylab = "Genetic Distance (Fst)", main = "Genetic vs Geographic Distance")
abline(lm(fst_vector ~ geog_vector), col="red")  # Add regression line
