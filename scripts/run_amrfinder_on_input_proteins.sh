#!/bin/bash
# $1 = prokka output dir
# $2 = AMR finder output dir

PROKKA_DIR=$1
OUT_DIR=$2

TMP_LIST_FILE=$1.list

ls ${PROKKA_DIR} > ${TMP_LIST_FILE}

while read accession
do
	echo "Run AMRFinder on ${accession}"
	prot_file="${PROKKA_DIR}/${accession}/${accession}.faa"
	amrfinder --protein ${prot_file} --name ${accession} --output ${OUT_DIR}/${accession}.amrfinder.tsv --threads 1
done < ${TMP_LIST_FILE}


rm ${TMP_LIST_FILE}
