#!/bin/bash

# positional argument input file $1 = a single assembly accession (GCF_ or GCA_ )

# required environment = conda base

if [ ! -d genome_assembly ]; then
	mkdir genome_assembly
fi

datasets download genome accession ${ASMACC} --exclude-gff3 --exclude-rna --exclude-protein
unzip ncbi_dataset.zip
rm README.md
for fnafile in ncbi_dataset/data/${ASMACC}/*_genomic.fna
do
	mv ${fnafile} genome_assembly/${ASMACC}.fasta
done

rm -rf ncbi_dataset
rm -rf ncbi_dataset.zip
