#!/bin/bash

while read line
do
	RUNACC="${line%	*}"
	RUNNAME="${line#*	}"
	
	/data0/home/kihyunee/installations/kingfisher-download/bin/kingfisher get -r ${RUNACC} -m ena-ascp ena-ftp aws-http prefetch
	
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

done < metadata/run_isolate_ngs.tab
