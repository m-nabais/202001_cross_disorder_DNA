#!/usr/bin/env Rscript
file = commandArgs(trailingOnly=TRUE)
library(methylGSA)
library(IlluminaHumanMethylation450kanno.ilmn12.hg19)
library(BiocParallel)


# Conduct GSEA on DNAm using methylglm
##################
### methylglm  ##
#################

cpgs <- read.table(file[1], header=T, fill = T)

cpg.pval <- cpgs[,4] # p-value META

names(cpg.pval) <- cpgs[,1] # Probe name

# methylglm
print("Performing methylglm...")

myGSEA.methylglm.GO <- methylglm(cpg.pval = cpg.pval, array.type = "450K", GS.type = "GO",
                                minsize = 40, maxsize = 410, parallel = T)
                              

myGSEA.methylglm.REACTOME <- methylglm(cpg.pval = cpg.pval, array.type = "450K", GS.type = "Reactome",
                                   minsize = 25, maxsize = 500, parallel = T)

write.csv(myGSEA.methylglm.GO[which(myGSEA.methylglm.GO$padj < 0.05),], paste("methylglm_GO_", file[1], ".csv", sep=""))
write.csv(myGSEA.methylglm.REACTOME[which(myGSEA.methylglm.REACTOME$padj < 0.05),], paste("methylglm_REACTOME_", file[1], ".csv", sep=""))


save(myGSEA.methylglm.GO, myGSEA.methylglm.REACTOME, file = paste("methylglm_", file[1], ".Robject", sep=""))