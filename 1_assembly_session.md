
# Get WGS raw data for the practice

### Pick one of the following public WGS data examples for your practice

All examples that are recommended here are commonly,
- of clinical isolates with notable antibiotic resistance phenotypes
- sequenced using both illumina and nanopore approaches


**(1) Acinetobacter baumannii Cl415**

Publication:
> Cl415, a carbapenem-resistant Acinetobacter baumannii isolate containing four AbaR4 and a new variant of AbGRI2, represents a novel global clone 2 strain 
> Rebekah Liepa, Riti Mann, Marwan Osman, Monzer Hamze, Cindy Gunawan, Mohammad Hamidian
> Journal of Antimicrobial Chemotherapy, dkab399
> https://doi.org/10.1093/jac/dkab399

Isolate information:
> Acinetobacter baumannii Cl415
> Isolated from the blood sample of 71-year-old female at the ICU of El Youssef Hospital Centre in Akkar Governorate
> From Lebanon
> Collected in July 2017
> XDR phenotype
> Resistant to carbapenems (imipenem and meropenem), third-generation cephalosporins (cefotaxime, ceftazidime and ceftriaxone), kanamycin, neomycin, gentamicin, streptomycin, spectinomycin, chloramphenicol, nalidixic acid and ciprofloxacin

Data accessions:
> Illumina MiSeq raw data run accession: SRR14534402
> Nanopore MinION raw data run accession: SRR14534401



### Create the working directory for your assembly project

Name your project. E.g. A_baumannii_Cl415

In the commands below, use your project name in place of {YOUR_PROJECT_NAME}

```
mkdir ~/genomics_tutorial/assembly_session
mkdir ~/genomics_tutorial/assembly_session/{YOUR_PROJECT_NAME}
cd ~/genomics_tutorial/assembly_session/{YOUR_PROJECT_NAME}
```

It's better to have a consistent & organized file path structure.\

```
mkdir raw_read
mkdir qc_read
mkdir assembly
# you will try several assembly approaches so
mkdir assembly/illumina_only
mkdir assembly/nanopore_only
mkdir assembly/nanopore_illumina_hybrid
```


### Download the SRA Run rawdata for the selected isolate

Activate __*kingfisher*__ environment

```
cd raw_read/
conda activate kingfisher
kingfisher -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch
kingfisher -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch

# {YOUR_RUN_ACCESSION} should be replaced with the run accessions of the isolate that you picked.
# For example if you picked A. baumannii Cl415,
kingfisher -r SRR14534402 -m ena-ascp ena-ftp aws-http prefetch
kingfisher -r SRR14534401 -m ena-ascp ena-ftp aws-http prefetch

# If what you downloaded remain gzipped (file name ends with .gz) then extract them for the ease of downstream scripts
gzip -d *.fastq.gz
```

Illumina WGS libraries are usually (but not always) sequenced in paired-end layout.\
That means you will have __{Accession}_1.fastq__ and __{Accession}_2.fastq__ files.

Nanopore WGS libraries can only be sequenced in single-end layout.\
Therefore it is only natural to have one __{Accession}.fastq__ file.\
Sometimes, depending on which file transfer protocol the _kingfisher_ used, the single fastq file can be named like {Accession}_1.fastq\
That is not a good practice so if that's the case change the file name:

```
mv {Accession}_1.fastq {Accession}.fastq
```

Finished downloading task. You should quit the _kingfisher_ environment.
```
conda deactivate
```


### QC and preprocessing the raw reads

You will use *fastp* for QC and preprocessing the illumina reads.\
You will use *filtlong* for QC and preprocessing the nanopore reads.\
These tools were installed within the _base_ conda environment.

Example commands will be given using Acinetobacter baumannii Cl415 accession numbers.\
If you are using a different dataset, change the run accession numbers (i.e. SRR14534401, SRR14534402) accordingly.

**(1) illumina reads**

Raw reads came in paired-end layout. You have located raw read fastq files here:
- raw_read/SRR14534402_1.fastq
- raw_read/SRR14534402_2.fastq

You will use *fastq* to (a) cut out the illumina adapter sequences and (b) remove low-quality reads based on phred score.

```
fastp --in1 raw_read/SRR14534402_1.fastq --in2 raw_read/SRR14534402_2.fastq --out1 qc_read/SRR14534402_1.fastq --out2 qc_read/SRR14534402_2.fastq --json qc_read/SRR14534402.fastp.json --html qc_read/SRR14534402.fastp.html
```

After the execution of the above command, you will be able to find these output files in the qc_read/ directory.
> qc_read/SRR14534402_1.fastq  <-- QC-passed & trimmed forward sequence reads
> qc_read/SRR14534402_2.fastq  <-- QC-passed & trimmed reverse sequence reads
> qc_read/SRR14534402.fastp.json  <-- json file containing the resulting QC stats
> qc_read/SRR14534402.fastp.html  <-- html file containing the resulting QC stats <-- Open this in a web browser (Firefox, Chrome, etc) later when you want to write a report 

**(2) nanopore reads**

Raw reads came in single-end layout. You have located the raw read fasta file here:
- raw_read/SRR14534401.fastq

You will use *filtlong* to (a) discard the reads that are not long enough, or/and (b) remove low-quality reads based on phred score.

You have to make subjectively judgements what thresholds should be applied for quality filtering.\
In this example, I specified that 
- reads have to be at least 1000 bp or longer (--min_length)
- reads have to be expected to have 80% or greater expected accuracy of the basecalls (--min_mean_q)

```
filtlong --min_length 1000 --min_mean_q 80 raw_read/SRR14534401.fastq > qc_read/SRR14534401.mean_phred_80_len_1k.fastq
```


Let's check how much of the read files was gone/retained in the QC step.
```
du -sh raw_read/*.fastq
du -sh qc_read/*.fastq
```
