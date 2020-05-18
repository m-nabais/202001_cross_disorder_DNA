1.To run out-of-sample classification analyses, just run render("out_of_sample_classification_cross_disorder_DNAm.Rmd", params = list(adjust = "no")) if you want to calculate AUC without adjusting for cell-type proportions or adjust = "yes", if you want to adjust for CTP.

2. Some of the phenotype data cannot be publicly available, so I have provided code used for parsing of those files and uploaded a coded version of the phenotype files. 

"OSCA_smok_probes_MOM.txt" - contains CpGs that were identified by MOMENT has significantly associated with smoking status. We remove these probes in the within-trait prediction of SCZ.

"all_disorders_mps.Robject" - contains all the withint and between-trait methylation profile scores.

"all_disorders_mps_covariates.Robject" - contains all the within and between trait methylation profile scores and analyzed covariates.

"mps_within_trait.sh" & "mps_between_trait.sh" - scripts to perform within and between trait prediction, respectively. 

