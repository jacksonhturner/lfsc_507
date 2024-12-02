# Speed up orthology inference by removing paralogous genes within taxa

### Project Overview

Orthology inference, wherein genes among a set of organisms are evaluated for orthology is foundational for the recovery of evolutionary models through phylogenomics. All-vs-all orthology inference via OrthoFinder is well-used throughout the phylogenomics community but can be computationally demanding for taxonomic groups with large, highly duplicated genomes such as many plans and some fungi. Excluding paralogs within each taxon before initiating orthology inference is expected to drastically reduce its analysis time by eliminating duplicated genes and problematic gene families. This research project for LFSC 507 aims to use a custom python script to eliminate paralogs before orthology inference and evaluate its impact on downstream analysis time and accuracy.

### Methods

![alt text](https://github.com/jacksonhturner/lfsc_507/blob/main/final_project/LFSC_507_workflow.drawio.png)

A set of 29 plants within the family Gesneriaceae is selected for analysis due to its history of hybridization and genome duplication. Shotgun sequencing reads were downloaded from NCBI and trimmed, assembled, and annotated. Amino acid sequences were recovered from annotations, and sequences from each sample were queried against themselves using DIAMOND. Identified sequence matches were excluded from analysis and non-matching sequences were retained via a custom python script. All-vs-all orthology inference was conducted upon filtered sequences with OrthoFinder. Genes orthologous in at least 50% of taxa were recovered for downstream analysis. Putatitve orthologs were translated and aligned, and nucleotide sequences were mapped to amino acid alignments. Mapped nucleotide alignments were masked, and ML phylogenetic inference was conducted with IQ-TREE2 with ModelFinder-Plus. 

### Benchmarking

Analysis times and the final toplogy recovered through the pipeline executed here were evaluated for benchmarking against a pipeline identical to the one previously described with the DIAMOND and python script steps excluded. Analysis times for each step were summed and standardized for potential parallelization. 

* Use DIAMOND to identify paralogous genes by running a blastp search of an annotated assembly against itself
* Use a custom python script to remove genes with multiple matches
* Speed up orthology inference by excluding known paralogs
* Expected to be especially effective in plants and fungi with histories of duplication events
* An optional step for a novel phylogenomics pipeline
* More to come!
