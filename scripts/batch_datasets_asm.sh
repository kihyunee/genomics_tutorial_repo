#!/bin/bash

# positional argument input file = a single column text file list of assembly accessions (GCA_ or GCF_)

while read ASMACC
do
	if [ ! -f genome_assembly/${ASMACC}.fasta ]; then
		single_datasets_asm.sh ${ASMACC}
	else
		echo "${ASMACC} already downloaded!"
	fi
done < $1