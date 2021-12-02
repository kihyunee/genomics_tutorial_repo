#!/bin/bash
# $1 = prokka output dir
# $2 = RGI output dir

PROKKA_DIR=$1
OUT_DIR=$2

TMP_LIST_FILE=$1.list

ls ${PROKKA_DIR} > ${TMP_LIST_FILE}

while read accession
do
	echo "Run CARD RGI on ${accession}"
	prot_file="${PROKKA_DIR}/${accession}/${accession}.faa"
	rgi main -i ${{prot_file} -t protein -n 1 -a BLAST -o ${OUT_DIR}/${accession}.rgi.tsv
done < ${TMP_LIST_FILE}


rm ${TMP_LIST_FILE}
