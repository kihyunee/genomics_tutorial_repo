#!/bin/bash

# positional argument $1 = path to directory where the type genomes are
# positional argument $2 = directory to have the links

SOURCE_DIR=$1
OUT_DIR=$2

for FASTAFILE in ${SOURCE_DIR}/*.fasta
do
	fasta_fn="${FASTAFILE##*/}"
	accession="${fasta_fn%.fasta}"
	
	ln -s ${FASTAFILE} ${OUT_DIR}/${accession}.fasta
done
