# Annotation-pipeline

Annotation pipeline to run in University of Sheffield HPC cluster using Braker2.

There are two steps to be performed independently:
- Protein evidence from other species is used to construct a database, which results in a hints file. Then that file is used to predict proteins in the genome of interest. The scripts used for this step are PrepareProtDB.sh and BrakerProt.sh.
- Evidence from RNA-seq from the target species. Once the reads have been aligned to the genome, the resulting bam file can be used as evidence to predict annotations. The script used for this step is BrakerRNA.sh.

Finally, the two output files are merged with TSEBRA - script TSEBRA.sh.