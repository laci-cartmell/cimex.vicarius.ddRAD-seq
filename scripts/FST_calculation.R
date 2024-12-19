## FST FROM GENEPOP

#REQ PACKAGES
install.packages("genepop")
library(genepop)
install.packages(c("poppr", "ggplot2", "adegenet", "hierfstat", "vegan", "reshape2", "gaston"))

library(ggplot2)
library(reshape2)

library("diveRsity")
library("dartRverse")
library(poppr)
library(ape)
library(RColorBrewer)
library(ggplot2)
library("hierfstat")

library("adegenet")
library("vegan")
library("reshape2")
library("gaston")

#setwd
setwd("F:/RAW_RAD_SWBG/results_2014_2021/2014/integrated3/")

## DATA ###
#load in files
#genepop for adegenet
gpop.x <- read.genepop("populations.snps.gen", ncode = 2)
gpop.x

#rename populations
#names populations w.name of last ind in that pop
str(gpop.x)
current_pops <- pop(gpop.x)
current_pops
#define new pops
#extract population data
popmap_10x_2021 <- read_delim("popmap_2021_10x.txt", 
                              delim = "\t", header=FALSE)

popmap_10x_2014 <- read.delim("F:/RAW_RAD_SWBG/results_2014_2021/2014/popmap_10x_2014.txt", header=FALSE)
head(popmap_2021_10x)
#keep pop info for sample
pop_id <- (popmap_10x_2014[,2])
pop_id_vector <- pop_id$X2
pop_id
length(pop_id)          # Length of your population ID vector
nInd(gpop.x)           # Number of individuals in your gpop.x object


#rename with new pop
pop(gpop.x) <- pop_id
updated_populations <- pop(gpop.x)
print(updated_populations)

#check file for updated pop id
current_pops <- pop(gpop.x)

#specify ploidy
ploidy(gpop.x) <- 2
#check that its genind, adegenet 
class(gpop.x)
gpop1 <- genind2genpop(gpop.x)
class(gpop1)
gpop.chr <- gpop1
basic_info("populations.snps1.txt")
#genepop fst
Fst(
  "populations.snps.txt",
  sizes = FALSE,
  pairs = FALSE,
  outputFile = "",
  dataType = "Diploid",
  verbose = interactive()
)
View(populations.snps1.txt.FST)
#add stratification for hierfstat
#stat data
library(readr)
hier_WE_YR<- read_delim("hier_WE_2014.txt", 
                        delim = "\t", escape_double = FALSE, 
                        trim_ws = TRUE)
View(hier_WE_YR)

#add stratification to genind for hierfstat
strata(gpop.x) <- hier_WE_YR
print(gpop.x)
#view strata
strata(gpop.x)
#check that its genind, adegenet 
class(gpop.x)
is.genind(gpop.x)

#convert genind to hierfstat
hfstat <- genind2hierfstat(gpop.x)
str(hfstat)
head(genind2hierfstat(gpop.x)[,1:5])
class(hfstat)
View(hfstat)


## STATISTICS ##
# HIERFSTAT STATS - hfstat #

#computes WC estimates for Fis, Fst - overall and per allele, per locus
wc_stats <- wc(hfstat)
?wc

#Global estimate of Fst
basicstat <- basic.stats(hfstat, diploid=TRUE, digits=3)
overall_basic_stats <- as.data.frame(basicstat$overall)
overall_basic_stats

#
#bootstrap for Fis
boot.fis <- boot.ppfis(hfstat, nboot =10000, quant=c(0.025,0.975), diploid = TRUE)
boot.fis$fis.ci$ll
write.table(boot.fis$fis.ci, file='boot.fis.txt')

#Estimates pairwise FSTs according to Weir and Cockerham (1984)
pwcfst <- pairwise.WCfst(hfstat, diploid=TRUE)

#replace negative with zeros and write to table
pwcfst.zero <- pmax(pwcfst, 0)
write.table(pwcfst.zero, file='pairwise.WCfstZ.txt')

boot.wcfst <- boot.ppfst(hfstat, nboot =10000, quant=c(0.025,0.975), diploid = TRUE)
boot.wcfst

write.table(boot.wcfst$ul, file='boot.fst.ul.txt')
write.table(boot.wcfst$ll, file='boot.fst.ll.txt')

write.table(boot.wcfst, file='boot.fst.txt')


## Create a heatmap of pairwise WCfst values
#extract upper triangle
library(rstatix)
put <- pull_upper_triangle(boot.wcfst, diagonal = FALSE)
upper.tri(put)
View(boot.fst.ul.txt)

# Add confidence intervals to the melted data frame
pwcfst_melted$lower <- as.vector(boot.wcfst$ll)
pwcfst_melted$upper <- as.vector(boot.wcfst$ul)



