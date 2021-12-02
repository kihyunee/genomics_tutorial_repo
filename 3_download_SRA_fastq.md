# Start to work in ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates
```
cd ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates
```

The file where you wrote run accession + library name pairs can be accessed from here by:
```
ls run_info/run_library_name.tab
```

# Let's download SRA fastq files into ./raw_read directory
Note that you have to activate _kingfisher_ conda environment to use kingfisher

```
conda activate kingfisher
kingfisher -h
kingfisher get -h
```

See the help messages.\
All you need are (1) -r ACCESSION and (2) -m DOWNLOAD METHODS
```
kingfisher get -r SRR6348588 -m ena-ascp aws-http ena-ftp prefetch
```

The downloaded fastq files can have one of these names, depending on (1) whether it's paired-end, (2) whether it's downloaded by ena-ftp or something else
```
# if single-end
SRR6348588.fastq
SRR6348588.fastq.gz
SRR6348588_1.fastq
SRR6348588_1.fastq.gz

# if paired-end
SRR6348588_1.fastq  and SRR6348588_2.fastq
SRR6348588_1.fastq.gz and SRR6348588_2.fastq.gz
```

I want a few more operation:

Decompress the gzip if the file(s) is gzipped.\
Move the downloaded file to the `raw_read/` directory.\
Change the filename from being ACCESSION NUMBER-based to more understandable LIBRARY NAME-based.

These can be complicated but I prepared a script to deal with this task after downloading the fastq using kingfisher.
```
# Remove what you downloaded right before.
rm SRR6348588*

# Download using the script
get_raw_read.sh run_info/run_library_name.tab
```

### Time flows

### Cannot wait more: stop the process
Press `Ctrl` + `C`

The script was killed.

Remove any files starting with `SRR` that are intermediate downloding file.
```
rm SRR*
```

Just move the `fastq files` that the instructor has put inside `~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/raw_read/` to the current `./raw_read` directory.
```
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/raw_read/* ./raw_read/
```


