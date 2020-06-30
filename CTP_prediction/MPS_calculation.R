#@This function calculates MPS for DNAm data
library(tidyverse)
mps <- function(eff.sizes, betas){
  
  if (length(eff.sizes) > 1){
    
    betas2 <- betas[,which(colnames(betas) %in% names(eff.sizes))]
    eff.sizes<- eff.sizes[which(names(eff.sizes) %in% colnames(betas2))]
    betas2 <- betas2[,names(eff.sizes)]
    scores <- as.matrix(betas2) %*% eff.sizes
    scores <- as.data.frame(scores)
    colnames(scores) <- "CTP_SCORE"
    scores$CNT <- rep(length(eff.sizes), nrow(scores))
    scores$IID <- betas$IID
    scores$case.control <- betas$case.control
    scores$cohort <- betas$cohort
    scores$disorder <- betas$disorder
    return(as_tibble(scores))

  }else{
    
    betas2 <- betas[,which(colnames(betas) %in% names(eff.sizes))]
    scores <- as.matrix(betas2) %*% eff.sizes
    scores <- as.data.frame(scores)
    colnames(scores) <- "SCORE"
    scores$CNT <- rep(length(eff.sizes), nrow(scores))
    scores$IID <- betas$IID
    return(scores) 
    
  }
}
