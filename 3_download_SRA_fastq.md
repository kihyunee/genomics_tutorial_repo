# We download three isolates / 3 illumina + 3 nanopore runs raw data from Giddins et al. paper.

# You have created a tab-delimited file in a previous session
containing 6 run accession numbers (in column 1) and library names (in column 2)

That file can be found at
```
~/PATH/TO/RUN_LIBNAME_pair.tab
```

# Go to the giddins isolates directory - you've created it in a previous session
```
cd ~/genomics_tutorial/K_pneumoniae_ST307/giddins_isolates/
```

# Download one SRA run, say 'SRR6348588' which has library name 'KP1766_Nanopore'
```
mkdir KP1766
mkdir KP1766/raw_read
conda activate kingfisher
kingfisher get -r SRR6348588 -m ena-aspera ena-ftp aws-http prefetch
conda deactivate
```

The downloaded file(s) can be gzipped (.fastq.gz) or not (.fastq) depending on which method was used successfully by the kingfisher.\
If it's gzipped, decompress it using `gzip -d SRR6348588*.fastq.gz`\
Change the fastq file name to more understandable form (using library name) & put the fastq file in the '{ISOLATE_NAME}/raw_read' directory.\
For example,
```
mv SRR6348588.fastq KP1766/raw_read/KP1766_Nanopore.fastq
```
