#!/bin/bash

# positional argument $1 = prokka output base directory
OUTBASE=$1

for FASTAFILE in input_assembly/*.fasta
do
	fasta_fn="${FASTAFILE##*/}"
	accession="${fasta_fn%.fasta}"
	prokka --cdsrnaolap --quiet --outdir ${OUTBASE}/${accession} --prefix ${accession} --locustag ${accession} --noanno --cpus 1 ${FASTAFILE}
done
