#!/bin/bash

for FWFQ in raw_read/*_1.fastq
do

	RVFQ="${FWFQ%_1.fastq}_2.fastq"
	FQTN="${FWFQ##*/}"
	FQID="${FQTN%_1.fastq}"
	
	fastp --in1 ${FWFQ} --in2 ${RVFQ} --out1 qc_read/${FQID}_1.fastq --out2 qc_read/${FQID}_2.fastq --json qc_read/${FQID}.fastp.json --html qc_read/${FQID}.fastp.html
done

