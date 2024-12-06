# This script loads in benchmarking trees and uses them to generate Jaccard Robinson-Foulds distances.

setwd("C:/Users/jturn")
library(ape)
library(phangorn)
library(TreeDist)

# Reference Topology (recovered from Study et al. 2020)

ges_ref <- read.tree("henckelia_skeleton.treefile")
ges_ref <- root(ges_ref,"Ornithoboea_henryi")
ges_ref$edge.length = ges_ref$edge.length * 20

# Phylogeny without ortholog filtering 

full_tree_ges <- read.tree("henckelia_OG_all_taxa.treefile")
full_tree_ges <- root(full_tree_ges,"Ornithoboea_henryi")
JaccardRobinsonFoulds(full_tree_ges, ges_ref)
# R-F score: 3.06
VisualizeMatching(RobinsonFouldsMatching,full_tree_ges,ges_ref)

# Phylogeny after ortholog filtering
LFSC_ges <- read.tree("LFSC_final_phylogeny.treefile")
LFSC_ges <- root(LFSC_ges,"Ornithoboea_henryi")
JaccardRobinsonFoulds(LFSC_ges, ges_ref)
# R-F score: 7.09
VisualizeMatching(RobinsonFouldsMatching,LFSC_ges,ges_ref)