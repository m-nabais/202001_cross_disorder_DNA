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
PROCESS within_SCZ/SCZ1_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_MOMENT_smok.moment

# === THE SECOND INPUT FILE HAS THE SAME FORMAT AND CAN BE PROCESSED IMMEDIATELY ===
PROCESS within_SCZ/SCZ2_qced_normalized_DNAm_autosomes-no-X-react-no-SNP-sd0.02_MOMENT_smok.moment

OUTFILE within_SCZ/meta_analyses_between_SCZ_MOMENT_ .tbl
ANALYZE HETEROGENEITY

QUIT