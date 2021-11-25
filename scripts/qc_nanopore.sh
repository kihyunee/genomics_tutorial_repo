#!/bin/bash
for FQFN in raw_read/*.fastq
do
	echo "${FQFN}"
	fn_len=${#FQFN}
	# echo "${fn_len}"
	let tag_from=${fn_len}-8
	tag_str="${FQFN:${tag_from}:${fn_len}}"
	# echo "${tag_str}"
	if [ "${tag_str}" == "_1.fastq" ]; then
		echo "It's PE library"
	elif [ "${tag_str}" == "_2.fastq" ]; then
		echo "It's PE library"
	else
		echo "It's non-PE, I suppose it's nanopore"
		FQTN="${FQFN##*/}"
		FQID="${FQTN%.fastq}"
		/data0/home/kihyunee/installations/Filtlong/bin/filtlong --min_length 1000 --min_mean_q 80 ${FQFN} > qc_read/${FQID}.mean_phred_80_len_1k.fastq
		/data0/home/kihyunee/installations/Filtlong/bin/filtlong --min_length 1000 --min_mean_q 88 ${FQFN} > qc_read/${FQID}.mean_phred_90_len_1k.fastq
	fi
done
