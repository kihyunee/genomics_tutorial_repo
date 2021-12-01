#!/bin/bash

output="asm_accession_2_organism.tab"

if [ -f ${output} ]; then
	rm ${output}
fi

for fasta in genome_assembly/*.fasta
do
	fasta_fn="${fasta##*/}"
	accession="${fasta_fn%.fasta}"
	header_sample="$(head -n1 ${fasta})"
	header_nonacc="${header_sample#* }"
	header_org="${header_nonacc%,*}"
	header_org="${header_org% chromosome*}"
	header_org="${header_org% plasmid*}"
	echo "${accession}	${header_org}" >> ${output}
done
