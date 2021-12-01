#!/bin/bash

# positional argument input file
#	$1 = a tab file, col 1 SRA accession, col 2 customized naming for the SRA run

# requirement for conda environment
#	should be run in kingfisher environment

if [ ! -d raw_read ]; then
	mkdir raw_read
fi

while read line
do
	RUNACC="${line%	*}"
	RUNNAME="${line#*	}"
	
	kingfisher get -r ${RUNACC} -m ena-ascp ena-ftp aws-http prefetch
	
	if [ -f ${RUNACC}.fastq.gz ]; then
		gzip -d ${RUNACC}.fastq.gz
	fi
	if [ -f ${RUNACC}_1.fastq.gz ]; then
		gzip -d ${RUNACC}_1.fastq.gz
	fi
	if [ -f ${RUNACC}_2.fastq.gz ]; then
		gzip -d ${RUNACC}_2.fastq.gz
	fi
	
	if [ -f ${RUNACC}.fastq ]; then
		mv ${RUNACC}.fastq raw_read/${RUNNAME}.fastq
	fi
	if [ -f ${RUNACC}_1.fastq ]; then
		if [ -f ${RUNACC}_2.fastq ]; then
			mv ${RUNACC}_1.fastq raw_read/${RUNNAME}_1.fastq
		else
			mv ${RUNACC}_1.fastq raw_read/${RUNNAME}.fastq
		fi
	fi
	if [ -f ${RUNACC}_2.fastq ]; then
		mv ${RUNACC}_2.fastq raw_read/${RUNNAME}_2.fastq
	fi

done < $1
