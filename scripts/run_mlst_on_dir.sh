#!/bin/bash
# $1 = input genomes directory
# $2 = output mlsts directory

INDIR=$1
OUTDIR=$2

for FASTAFILE in ${INDIR}/*.fasta
do
	fasta_fn="${FASTAFILE##*/}"
	accession="${fasta_fn%.fasta}"
	mlst --label ${accession} ${FASTAFILE} > ${OUTDIR}/${accession}.MLST
done
