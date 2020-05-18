#!/bin/bash
# This script runs MPS within-traits predictions


###########################
## Set working directory ##
###########################

wd=/shares/compbio/Group-Wray/Marta/BRAIN-MEND/all_datasets/OUT_OF_SAMPLE_CLASSIFICATION/MPS/within_trait/non-adjusted

#################################
## Change to working directory ##
#################################

cd $wd

#########################
## path to OSCA binary ##
#########################

osca=/shares/compbio/Group-Wray/Marta/BRAIN-MEND/all_datasets/software/osca


##############################
## Export MWAS results      ##
##############################

export aus_moa="AUS_ALS_PCTG_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa"
export aus_mom="AUS_ALS_PCTG_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment"
export sgpd_moa="SGPD_Parkinson_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa"
export sgpd_mom="SGPD_Parkinson_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment"
export scz1_moa="SCZ1_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa"
export scz1_mom="SCZ1_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment"
export ad_moa="BM_Alzheimer_qced_normalized_noMCI_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa"
export ad_mom="BM_Alzheimer_qced_normalized_noMCI_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment"


##############################
## Export methylation betas  ##
##############################
export betas_nl="Netherlands_ALS_qced_normalized_DNAm_UNREL_common_probes_KCL"
export betas_kcl="KCL_combined_qced_normalized_DNAm_common_probes_NL"
export betas_peg="PEG_Parkinson_Horvath_qced_normalized_DNAm"
export betas_bm_pd="BM_Parkinson_EPIC_qced_normalized_DNAm"
export betas_adni="ADNI_qced_normalized_DNAm_common_probes_AddNeuroMed"
export betas_addneuro="AddNeuroMed_qced_normalized_DNAm_common_probes_ADNI"
export betas_scz2="SCZ2_combined_qced_normalized_DNAm"


#########################################################
## Export the effect sizes based on p-value threshold ##
########################################################

#Rscript generate_p-threshold.R $aus_moa
#Rscript generate_p-threshold.R $aus_mom
#Rscript generate_p-threshold.R $sgpd_moa
#Rscript generate_p-threshold.R $sgpd_mom
#Rscript generate_p-threshold.R $ad_moa
#Rscript generate_p-threshold.R $ad_mom
#Rscript generate_p-threshold.R $scz1_moa
#Rscript generate_p-threshold.R $scz1_mom

##############################
## Prediction analyses      ##
##############################

## declare an array variable
declare -a arr=("_1e-05_probe.blp" "_1e-04_probe.blp" "_1e-03_probe.blp" "_1e-02_probe.blp" "_0.1_probe.blp" "_0.2_probe.blp" "_0.5_probe.blp")

for i in "${arr[@]}"
do

	#$osca --befile $betas_nl --score ${aus_moa}$i --out MOA_AUS_to_NL$i

	#$osca --befile $betas_nl --score ${aus_mom}$i --out MOMENT_AUS_to_NL$i

	#$osca --befile $betas_kcl --score ${aus_moa}$i --out MOA_AUS_to_KCL$i

	#$osca --befile $betas_kcl --score ${aus_mom}$i --out MOMENT_AUS_to_KCL$i

	#$osca --befile $betas_peg --score ${sgpd_moa}$i --out MOA_SGPD_to_PEG$i

	#$osca --befile $betas_peg --score ${sgpd_mom}$i --out MOMENT_SGPD_to_PEG$i

	$osca --befile $betas_scz2 --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_SCZ2$i

	$osca --befile $betas_scz2 --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_SCZ2$i

	#$osca --befile $betas_adni --score ${ad_moa}$i --out MOA_AIBL_to_ADNI$i

	#$osca --befile $betas_adni --score ${ad_mom}$i --out MOMENT_AIBL_to_ADNI$i
	
	#$osca --befile $betas_addneuro --score ${ad_moa}$i --out MOA_AIBL_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${ad_mom}$i --out MOMENT_AIBL_to_AddNeuroMed$i


done
