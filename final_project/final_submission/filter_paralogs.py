#!bin/bash

import sys
import pandas as pd
import time

start_time = time.time()
diamond_headers = ["query accession"]
diamond_table = pd.read_csv(sys.argv[1], sep="\t",usecols = [0], names = diamond_headers)
genes = diamond_table["query accession"].tolist()

orthologs = []
for i in list(set(genes)):
    if genes.count(i) == 1:
        orthologs.append(i)

unique_genes = list(set(genes))

ortholog_percent = round((len(orthologs)/len(unique_genes)),2)
print(str(ortholog_percent) + "% of genes in this dataset are orthologs." + "\n")

seqs = sys.argv[2]
file_name = sys.argv[3]

for i in orthologs:
    ortholog_query = str(">" + i)
    seqs_open = open(seqs, "r")
    signal = "off"
    for line in seqs_open:
        if str(line.rstrip()) == ortholog_query:
            with open(file_name, 'a') as f:
                f.write(line.strip())
                f.write("\n")
            signal = "on"
            continue
        if (signal == "on" and ">" not in line):
            with open(file_name, 'a') as f:
                f.write(line.strip())
                f.write("\n")
        if (signal == "on" and ">" in line):
            signal = "off"

end_time = time.time()
total_time = end_time - start_time

print("This script took " + str(total_time) + " seconds to complete.")
