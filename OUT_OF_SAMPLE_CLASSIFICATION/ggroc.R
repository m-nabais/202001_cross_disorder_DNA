#' Functions plots multiple 'roc' objects into one plot
#' @param rocs
#'   A list of 'roc' objects. Every list item has a name.
#' @param breaks
#'   A vector of integers representing ticks on the x- and y-axis
#' @param legentTitle
#'   A string which is used as legend title
#' @param colours 
#'   A character vector with #symbols for desired colours
ggrocs <- function(rocs, breaks = seq(0,1,0.1), legendTitle = "Legend", colours = c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"),
                   legend = c("A","B","C", "D", "E", "F", "G", "H")) {
  if (length(rocs) == 0) {
    stop("No ROC objects available in param rocs.")
  } else {
    require(plyr)
    # Store all sensitivities and specifivities in a data frame
    # which an be used in ggplot
    RocVals <- plyr::ldply(names(rocs), function(rocName) {
      if(class(rocs[[rocName]]) != "roc") {
        stop("Please provide roc object from pROC package")
      }
      data.frame(
        fpr = (1-rocs[[rocName]]$specificities),
        tpr = rocs[[rocName]]$sensitivities,
        names = rep(rocName, length(rocs[[rocName]]$sensitivities)),
        stringAsFactors = T
      )
    })
    
    auc1 <- round(rocs[[1]]$auc, 2)
    auc2 <- round(rocs[[2]]$auc, 2)
    auc3 <- round(rocs[[3]]$auc, 2)
    auc4 <- round(rocs[[4]]$auc, 2)
    auc5 <- round(rocs[[5]]$auc, 2)
    auc6 <- round(rocs[[6]]$auc, 2)
    auc7 <- round(rocs[[7]]$auc, 2)
    #auc8 <- round(rocs[[8]]$auc, 2)
    
    rocPlot <- ggplot(RocVals, aes(x = fpr, y = tpr, colour = names)) +
      geom_segment(aes(x = 0, y = 0, xend = 1,yend = 1), alpha = 0.5, colour = "gray") + 
      geom_step() +
      scale_x_continuous(name = "False Positive Rate (1 - Specificity)",limits = c(0,1), breaks = breaks) + 
      scale_y_continuous(name = "True Positive Rate (Sensitivity)", limits = c(0,1), breaks = breaks) +
      scale_color_manual(values=colours, labels=c(paste(legend[1]," (AUC = ", auc1, ")", sep=""),
                                                  paste(legend[2]," (AUC = ", auc2, ")", sep=""),
                                                  paste(legend[3]," (AUC = ", auc3, ")", sep=""),
                                                  paste(legend[4]," (AUC = ", auc4, ")", sep=""),
                                                  paste(legend[5]," (AUC = ", auc5, ")", sep=""),
                                                  paste(legend[6]," (AUC = ", auc6, ")", sep=""),
                                                  paste(legend[7]," (AUC = ", auc7, ")", sep=""))) +
                                                  #paste(legend[8]," (AUC = ", auc8, ")", sep=""))) +
      
      theme_bw() + 
      coord_equal() + 
      guides(colour = guide_legend(legendTitle)) +
      theme(axis.ticks = element_line(color = "grey80"))
    
    rocPlot
  }
}