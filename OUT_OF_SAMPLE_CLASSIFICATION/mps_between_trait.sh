#!/bin/bash
# This script runs MPS between-traits predictions


###########################
## Set working directory ##
###########################

wd=/shares/compbio/Group-Wray/Marta/BRAIN-MEND/all_datasets/OUT_OF_SAMPLE_CLASSIFICATION/MPS/between_traits

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
export ra_moa="RA_GSE42861_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa"
export ra_mom="RA_GSE42861_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment"

##############################
## Export META results      ##
##############################

export als_moa="meta_analyses_between_ALS_MOA_1_MANHATTAN.tbl"
export als_mom="meta_analyses_between_ALS_MOMENT_1_MANHATTAN.tbl"
export pd_moa="meta_analyses_between_PD_MOA_1_MANHATTAN.tbl"
export pd_mom="meta_analyses_between_PD_MOMENT_1_MANHATTAN.tbl"
export scz_moa="meta_analyses_between_SCZ_MOA_1_MANHATTAN.tbl"
export scz_mom="meta_analyses_between_SCZ_MOMENT_1_MANHATTAN.tbl"
export aus_sgpd_aibl_moa="meta_analyses_between_AUS_SGPD_AIBL_MOA_1_MANHATTAN.tbl"
export aus_sgpd_aibl_mom="meta_analyses_between_AUS_SGPD_AIBL_MOMENT_1_MANHATTAN.tbl"

##############################
## Export methylation betas  ##
##############################
export betas_nl="Netherlands_ALS_qced_normalized_DNAm_UNREL_common_probes"
export betas_kcl="KCL_combined_qced_normalized_DNAm_common_probes"
export betas_peg="PEG_Parkinson_Horvath_qced_normalized_DNAm_common_probes"
export betas_adni="ADNI_qced_normalized_DNAm_common_probes"
export betas_addneuro="AddNeuroMed_qced_normalized_DNAm_common_probes"
export betas_scz2="SCZ2_combined_qced_normalized_DNAm_common_probes"
export betas_ra="RA_GSE42861_qced_normalized_DNAm_common_probes"
export betas_scz1="SCZ1_combined_qced_normalized_DNAm_common_probes"
export betas_aus="AUS_ALS_PCTG_qced_normalized_DNAm_common_probes"
export betas_sgpd="SGPD_Parkinson_qced_normalized_DNAm_common_probes"
export betas_ad="BM_Alzheimer_qced_normalized_DNAm_common_probes"


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
#Rscript generate_p-threshold.R $ra_moa
#Rscript generate_p-threshold.R $ra_mom

#Rscript generate_p-threshold.R $als_moa
#Rscript generate_p-threshold.R $als_mom
#Rscript generate_p-threshold.R $pd_moa
#Rscript generate_p-threshold.R $pd_mom
#Rscript generate_p-threshold.R $scz_moa
#Rscript generate_p-threshold.R $scz_mom
#Rscript generate_p-threshold.R $aus_sgpd_aibl_moa
#Rscript generate_p-threshold.R $aus_sgpd_aibl_mom

##############################
## Prediction analyses      ##
##############################

## declare an array variable
declare -a arr=("_1e-05_probe.blp" "_1e-04_probe.blp" "_1e-03_probe.blp" "_1e-02_probe.blp" "_0.1_probe.blp" "_0.2_probe.blp" "_0.5_probe.blp")

for i in "${arr[@]}"
do

	# MWAS ===

	#$osca --befile $betas_sgpd --score ${aus_moa}$i --out MOA_AUS_to_SGPD$i

	#$osca --befile $betas_sgpd --score ${aus_mom}$i --out MOMENT_AUS_to_SGPD$i

	#$osca --befile $betas_peg --score ${aus_moa}$i --out MOA_AUS_to_PEG$i

	#$osca --befile $betas_peg --score ${aus_mom}$i --out MOMENT_AUS_to_PEG$i

	#$osca --befile $betas_scz1 --score ${aus_moa}$i --out MOA_AUS_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${aus_mom}$i --out MOMENT_AUS_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${aus_moa}$i --out MOA_AUS_to_SCZ2$i

	#$osca --befile $betas_scz2 --score ${aus_mom}$i --out MOMENT_AUS_to_SCZ2$i

	#$osca --befile $betas_ra --score ${aus_moa}$i --out MOA_AUS_to_RA$i

	#$osca --befile $betas_ra --score ${aus_mom}$i --out MOMENT_AUS_to_RA$i

	#$osca --befile $betas_ad --score ${aus_moa}$i --out MOA_AUS_to_AIBL$i

	#$osca --befile $betas_ad --score ${aus_mom}$i --out MOMENT_AUS_to_AIBL$i

	#$osca --befile $betas_adni --score ${aus_moa}$i --out MOA_AUS_to_ADNI$i

	#$osca --befile $betas_adni --score ${aus_mom}$i --out MOMENT_AUS_to_ADNI$i

        #$osca --befile $betas_addneuro --score ${aus_moa}$i --out MOA_AUS_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${aus_mom}$i --out MOMENT_AUS_to_AddNeuroMed$i




	#$osca --befile $betas_aus --score ${sgpd_moa}$i --out MOA_SGPD_to_AUS$i

	#$osca --befile $betas_aus --score ${sgpd_mom}$i --out MOMENT_SGPD_to_AUS$i

	#$osca --befile $betas_nl --score ${sgpd_moa}$i --out MOA_SGPD_to_NL$i

	#$osca --befile $betas_nl --score ${sgpd_mom}$i --out MOMENT_SGPD_to_NL$i

	#$osca --befile $betas_kcl --score ${sgpd_moa}$i --out MOA_SGPD_to_KCL$i

	#$osca --befile $betas_kcl --score ${sgpd_mom}$i --out MOMENT_SGPD_to_KCL$i

	#$osca --befile $betas_scz1 --score ${sgpd_moa}$i --out MOA_SGPD_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${sgpd_mom}$i --out MOMENT_SGPD_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${sgpd_moa}$i --out MOA_SGPD_to_SCZ2$i

	#$osca --befile $betas_scz2 --score ${sgpd_mom}$i --out MOMENT_SGPD_to_SCZ2$i

	#$osca --befile $betas_ra --score ${sgpd_moa}$i --out MOA_SGPD_to_RA$i

	#$osca --befile $betas_ra --score ${sgpd_mom}$i --out MOMENT_SGPD_to_RA$i

	#$osca --befile $betas_ad --score ${sgpd_moa}$i --out MOA_SGPD_to_AIBL$i

	#$osca --befile $betas_ad --score ${sgpd_mom}$i --out MOMENT_SGPD_to_AIBL$i

	#$osca --befile $betas_adni --score ${sgpd_moa}$i --out MOA_SGPD_to_ADNI$i

	#$osca --befile $betas_adni --score ${sgpd_mom}$i --out MOMENT_SGPD_to_ADNI$i

       	#$osca --befile $betas_addneuro --score ${sgpd_moa}$i --out MOA_SGPD_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${sgpd_mom}$i --out MOMENT_SGPD_to_AddNeuroMed$i



	$osca --befile $betas_aus --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_AUS$i

	$osca --befile $betas_aus --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_AUS$i

	$osca --befile $betas_nl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_NL$i

	$osca --befile $betas_nl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_NL$i

	$osca --befile $betas_kcl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_KCL$i

	$osca --befile $betas_kcl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_KCL$i

	$osca --befile $betas_sgpd --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_SGPD$i

	$osca --befile $betas_sgpd --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_SGPD$i

	$osca --befile $betas_peg --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_PEG$i

	$osca --befile $betas_peg --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_PEG$i

	$osca --befile $betas_ra --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_RA$i

	$osca --befile $betas_ra --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_RA$i

	$osca --befile $betas_ad --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_AIBL$i

	$osca --befile $betas_ad --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_AIBL$i

	$osca --befile $betas_adni --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_ADNI$i

	$osca --befile $betas_adni --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_ADNI$i

        $osca --befile $betas_addneuro --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_moa}$i --out MOA_SCZ1_to_AddNeuroMed$i

	$osca --befile $betas_addneuro --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz1_mom}$i --out MOMENT_SCZ1_to_AddNeuroMed$i



	#$osca --befile $betas_aus --score ${ra_moa}$i --out MOA_RA_to_AUS$i

	#$osca --befile $betas_aus --score ${ra_mom}$i --out MOMENT_RA_to_AUS$i

	#$osca --befile $betas_nl --score ${ra_moa}$i --out MOA_RA_to_NL$i

	#$osca --befile $betas_nl --score ${ra_mom}$i --out MOMENT_RA_to_NL$i

	#$osca --befile $betas_kcl --score ${ra_moa}$i --out MOA_RA_to_KCL$i

	#$osca --befile $betas_kcl --score ${ra_mom}$i --out MOMENT_RA_to_KCL$i

	#$osca --befile $betas_sgpd --score ${ra_moa}$i --out MOA_RA_to_SGPD$i

	#$osca --befile $betas_sgpd --score ${ra_mom}$i --out MOMENT_RA_to_SGPD$i

	#$osca --befile $betas_peg --score ${ra_moa}$i --out MOA_RA_to_PEG$i

	#$osca --befile $betas_peg --score ${ra_mom}$i --out MOMENT_RA_to_PEG$i

	#$osca --befile $betas_scz1 --score ${ra_moa}$i --out MOA_RA_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${ra_mom}$i --out MOMENT_RA_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${ra_moa}$i --out MOA_RA_to_SCZ2$i

	#$osca --befile $betas_scz2 --score ${ra_mom}$i --out MOMENT_RA_to_SCZ2$i

	#$osca --befile $betas_ad --score ${ra_moa}$i --out MOA_RA_to_AIBL$i

	#$osca --befile $betas_ad --score ${ra_mom}$i --out MOMENT_RA_to_AIBL$i

	#$osca --befile $betas_adni --score ${ra_moa}$i --out MOA_RA_to_ADNI$i

	#$osca --befile $betas_adni --score ${ra_mom}$i --out MOMENT_RA_to_ADNI$i

        #$osca --befile $betas_addneuro --score ${ra_moa}$i --out MOA_RA_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${ra_mom}$i --out MOMENT_RA_to_AddNeuroMed$i




	#$osca --befile $betas_aus --score ${ad_moa}$i --out MOA_AIBL_to_AUS$i

	#$osca --befile $betas_aus --score ${ad_mom}$i --out MOMENT_AIBL_to_AUS$i

	#$osca --befile $betas_nl --score ${ad_moa}$i --out MOA_AIBL_to_NL$i

	#$osca --befile $betas_nl --score ${ad_mom}$i --out MOMENT_AIBL_to_NL$i

	#$osca --befile $betas_kcl --score ${ad_moa}$i --out MOA_AIBL_to_KCL$i

	#$osca --befile $betas_kcl --score ${ad_mom}$i --out MOMENT_AIBL_to_KCL$i

	#$osca --befile $betas_sgpd --score ${ad_moa}$i --out MOA_AIBL_to_SGPD$i

	#$osca --befile $betas_sgpd --score ${ad_mom}$i --out MOMENT_AIBL_to_SGPD$i

	#$osca --befile $betas_peg --score ${ad_moa}$i --out MOA_AIBL_to_PEG$i
	
	#$osca --befile $betas_peg --score ${ad_mom}$i --out MOMENT_AIBL_to_PEG$i

	#$osca --befile $betas_ra --score ${ad_moa}$i --out MOA_AIBL_to_RA$i

	#$osca --befile $betas_ra --score ${ad_mom}$i --out MOMENT_AIBL_to_RA$i

	#$osca --befile $betas_scz1 --score ${ad_moa}$i --out MOA_AIBL_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${ad_mom}$i --out MOMENT_AIBL_to_SCZ1$i
	
	#$osca --befile $betas_scz2 --score ${ad_moa}$i --out MOA_AIBL_to_SCZ2$i
	
	#$osca --befile $betas_scz2 --score ${ad_mom}$i --out MOMENT_AIBL_to_SCZ2$i

	 META-MWAS =======
	#$osca --befile $betas_sgpd --score ${als_moa}$i --out MOA_ALS_to_SGPD$i

	#$osca --befile $betas_sgpd --score ${als_mom}$i --out MOMENT_ALS_to_SGPD$i

	#$osca --befile $betas_peg --score ${als_moa}$i --out MOA_ALS_to_PEG$i

	#$osca --befile $betas_peg --score ${als_mom}$i --out MOMENT_ALS_to_PEG$i

	#$osca --befile $betas_scz1 --score ${als_moa}$i --out MOA_ALS_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${als_mom}$i --out MOMENT_ALS_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${als_moa}$i --out MOA_ALS_to_SCZ2$i

	#$osca --befile $betas_scz2 --score ${als_mom}$i --out MOMENT_ALS_to_SCZ2$i

	#$osca --befile $betas_ra --score ${als_moa}$i --out MOA_ALS_to_RA$i

	#$osca --befile $betas_ra --score ${als_mom}$i --out MOMENT_ALS_to_RA$i

	#$osca --befile $betas_ad --score ${als_moa}$i --out MOA_ALS_to_AIBL$i

	#$osca --befile $betas_ad --score ${als_mom}$i --out MOMENT_ALS_to_AIBL$i

	#$osca --befile $betas_adni --score ${als_moa}$i --out MOA_ALS_to_ADNI$i

	#$osca --befile $betas_adni --score ${als_mom}$i --out MOMENT_ALS_to_ADNI$i

	#$osca --befile $betas_addneuro --score ${als_moa}$i --out MOA_ALS_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${als_mom}$i --out MOMENT_ALS_to_AddNeuroMed$i




	#$osca --befile $betas_aus --score ${pd_moa}$i --out MOA_PD_to_AUS$i

	#$osca --befile $betas_aus --score ${pd_mom}$i --out MOMENT_PD_to_AUS$i

	#$osca --befile $betas_nl --score ${pd_moa}$i --out MOA_PD_to_NL$i

	#$osca --befile $betas_nl --score ${pd_mom}$i --out MOMENT_PD_to_NL$i

	#$osca --befile $betas_kcl --score ${pd_moa}$i --out MOA_PD_to_KCL$i

	#$osca --befile $betas_kcl --score ${pd_mom}$i --out MOMENT_PD_to_KCL$i

	#$osca --befile $betas_scz1 --score ${pd_moa}$i --out MOA_PD_to_SCZ1$i

	#$osca --befile $betas_scz1 --score ${pd_mom}$i --out MOMENT_PD_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${pd_moa}$i --out MOA_PD_to_SCZ2$i

	#$osca --befile $betas_scz2 --score ${pd_mom}$i --out MOMENT_PD_to_SCZ2$i

	#$osca --befile $betas_ra --score ${pd_moa}$i --out MOA_PD_to_RA$i

	#$osca --befile $betas_ra --score ${pd_mom}$i --out MOMENT_PD_to_RA$i

	#$osca --befile $betas_ad --score ${pd_moa}$i --out MOA_PD_to_AIBL$i

	#$osca --befile $betas_ad --score ${pd_mom}$i --out MOMENT_PD_to_AIBL$i

	#$osca --befile $betas_adni --score ${pd_moa}$i --out MOA_PD_to_ADNI$i

	#$osca --befile $betas_adni --score ${pd_mom}$i --out MOMENT_PD_to_ADNI$i

	#$osca --befile $betas_addneuro --score ${pd_moa}$i --out MOA_PD_to_AddNeuroMed$i

	#$osca --befile $betas_addneuro --score ${pd_mom}$i --out MOMENT_PD_to_AddNeuroMed$i



	$osca --befile $betas_aus --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_AUS$i

	$osca --befile $betas_aus --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_AUS$i

	$osca --befile $betas_nl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_NL$i

	$osca --befile $betas_nl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_NL$i

	$osca --befile $betas_kcl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_KCL$i

	$osca --befile $betas_kcl --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_KCL$i

	$osca --befile $betas_sgpd --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_SGPD$i

	$osca --befile $betas_sgpd --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_SGPD$i

	$osca --befile $betas_peg --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_PEG$i

	$osca --befile $betas_peg --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_PEG$i

	$osca --befile $betas_ra --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_RA$i

	$osca --befile $betas_ra --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_RA$i

	$osca --befile $betas_ad --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_AIBL$i

	$osca --befile $betas_ad --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_AIBL$i

	$osca --befile $betas_adni --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_ADNI$i

	$osca --befile $betas_adni --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_ADNI$i

	$osca --befile $betas_addneuro --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_moa}$i --out MOA_SCZ_to_AddNeuroMed$i

	$osca --befile $betas_addneuro --exclude-probe OSCA_smok_probes_MOM.txt --score ${scz_mom}$i --out MOMENT_SCZ_to_AddNeuroMed$i



	#$osca --befile $betas_kcl --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_KCL$i

	#$osca --befile $betas_nl --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_NL$i

	#$osca --befile $betas_peg --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_PEG$i

	#$osca --befile $betas_scz1 --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_SCZ2$i

	#$osca --befile $betas_ra --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_RA$i

	#$osca --befile $betas_adni --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_ADNI$i

	#$osca --befile $betas_addneuro --score ${aus_sgpd_aibl_moa}$i --out MOA_META_AUS_SGPD_AIBL_to_AddNeuroMed$i

	#$osca --befile $betas_kcl --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_KCL$i

	#$osca --befile $betas_nl --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_NL$i

	#$osca --befile $betas_peg --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_PEG$i

	#$osca --befile $betas_scz1 --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_SCZ1$i

	#$osca --befile $betas_scz2 --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_SCZ2$i

	#$osca --befile $betas_ra --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_RA$i
	
	#$osca --befile $betas_adni --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_ADNI$i
	
	#$osca --befile $betas_addneuro --score ${aus_sgpd_aibl_mom}$i --out MOMENT_META_AUS_SGPD_AIBL_to_AddNeuroMed$i

done
