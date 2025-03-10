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
PROCESS within_PD/SGPD_Parkinson_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa

# === THE SECOND INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS within_PD/PEG_Parkinson_Horvath_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_noCOVS.moa

OUTFILE within_PD/meta_analyses_between_PD_MOA_ .tbl
ANALYZE HETEROGENEITY

QUIT
