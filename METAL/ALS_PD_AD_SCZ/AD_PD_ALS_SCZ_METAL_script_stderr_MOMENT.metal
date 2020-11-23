#LOAD THE INPUT FILES
# UNCOMMENT THE NEXT LINE TO ENABLE GenomicControl CORRECTION
GENOMICCONTROL ON
SCHEME STDERR
# === DESCRIBE AND PROCESS THE FIRST INPUT FILE ===
MARKER Probe
EFFECT b
STDERR se
AVERAGEFREQ OFF
MINMAXFREQ OFF
COLUMNCOUNTING LENIENT
SEPARATOR TAB
PROCESS  ALS_PD_AD_SCZ/AUS_ALS_PCTG_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment

# === THE SECOND INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/KCL_combined_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment

# === THE THIRD INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/Netherlands_ALS_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_UNREL_noCOVS.moment

# === THE FOURTH INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/SGPD_Parkinson_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment

# === THE FIFTH INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/PEG_Parkinson_Horvath_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment

# === THE SIXTH INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/BM_Alzheimer_qced_normalized_noMCI_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moment

# === THE SEVENTH INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/SCZ1_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_MOMENT_smok.moment

# === THE EIGHT INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS ALS_PD_AD_SCZ/SCZ2_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_MOMENT_smok.moment

OUTFILE ALS_PD_AD_SCZ/meta_analyses_between_AD_PD_ALS_SCZ_MOMENT_ .tbl
ANALYZE HETEROGENEITY

QUIT