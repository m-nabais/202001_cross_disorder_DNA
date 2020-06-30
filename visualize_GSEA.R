library(ggplot2)
library(cowplot)
library(stringr)
source("barplot.R")

myfiles <- list.files(path = "./", pattern = ".csv")

methylglm.res <- lapply(myfiles, read.csv, stringsAsFactors = FALSE)
 
for(i in 1:nrow(methylglm.res[[1]])){
  
  if(str_length(methylglm.res[[1]]$Description[i]) >= 50){ # Some GO terms have too many characters
    
    methylglm.res[[1]]$Description[i] <- methylglm.res[[1]]$ID[i]
  }
  
}

# REPEAT FOR MOMENT
for(i in 1:nrow(methylglm.res[[2]])){
  
  if(str_length(methylglm.res[[2]]$Description[i]) >= 50){
    
    methylglm.res[[2]]$Description[i] <- methylglm.res[[2]]$ID[i]
  }
  
}

p1 <- barplot(methylglm.res[[1]], num = 20)

p2 <- barplot(methylglm.res[[2]], num = 20)

plot_grid(p1, p2, labels = "AUTO", ncol = 2)

ggsave("barplot_top20_GO_results.png", width = 15, height = 6)
