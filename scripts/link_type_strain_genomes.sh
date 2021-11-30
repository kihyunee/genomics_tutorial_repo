#!/bin/bash
for fasta in type_strain_genomes/genome_assembly/*.fasta
do
	fasta_fn="${fasta##*/}"
	accession="${fasta_fn%.fasta}"
	ln -s ${fasta} ani_input/${accession}.fasta
done
