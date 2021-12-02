#!/bin/bash

# argument $1 = output directory 
OUTDIR=$1

# (1) unicycler hybrid genomes 
ln -s /home/osboxes/preview_genomics_tutorial/K_pnseumoniae_ST307/my_isolates/KP1766/hybrid_unicycler/assembly.fasta ${OUTDIR}/KP1766.fasta
ln -s /home/osboxes/preview_genomics_tutorial/K_pnseumoniae_ST307/my_isolates/KP1768/hybrid_unicycler/assembly.fasta ${OUTDIR}/KP1768.fasta
ln -s /home/osboxes/preview_genomics_tutorial/K_pnseumoniae_ST307/my_isolates/NR5632/hybrid_unicycler/assembly.fasta ${OUTDIR}/NR5632.fasta


# (2) ST307 public genomes
for FASTAFILE in /home/osboxes/genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/genome_assembly/*.fasta
do
	fasta_fn="${FASTAFILE##*/}"
	accession="${fasta_fn%.fasta}"
	ln -s ${FASTAFILE} ${OUTDIR}/${accession}.fasta
done


