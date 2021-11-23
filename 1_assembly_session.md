
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
kingfisher get -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch
kingfisher get -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch

# {YOUR_RUN_ACCESSION} should be replaced with the run accessions of the isolate that you picked.
# For example if you picked A. baumannii Cl415,
kingfisher get -r SRR14534402 -m ena-ascp ena-ftp aws-http prefetch
kingfisher get -r SRR14534401 -m ena-ascp ena-ftp aws-http prefetch

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


# QC and preprocessing the raw reads

You will use *fastp* for QC and preprocessing the illumina reads.\
You will use *filtlong* for QC and preprocessing the nanopore reads.\
These tools were installed within the _base_ conda environment.

Example commands will be given using Acinetobacter baumannii Cl415 accession numbers.\
If you are using a different dataset, change the run accession numbers (i.e. SRR14534401, SRR14534402) accordingly.

### Illumina reads

Raw reads came in paired-end layout. You have located raw read fastq files here:
- raw_read/SRR14534402_1.fastq
- raw_read/SRR14534402_2.fastq

You will use *fastp* to (a) cut out the illumina adapter sequences and (b) remove low-quality reads based on phred score.

```
fastp --in1 raw_read/SRR14534402_1.fastq --in2 raw_read/SRR14534402_2.fastq --out1 qc_read/SRR14534402_1.fastq --out2 qc_read/SRR14534402_2.fastq --json qc_read/SRR14534402.fastp.json --html qc_read/SRR14534402.fastp.html
```

After the execution of the above command, you will be able to find these output files in the qc_read/ directory.
> qc_read/SRR14534402_1.fastq  <-- QC-passed & trimmed forward sequence reads
> qc_read/SRR14534402_2.fastq  <-- QC-passed & trimmed reverse sequence reads
> qc_read/SRR14534402.fastp.json  <-- json file containing the resulting QC stats
> qc_read/SRR14534402.fastp.html  <-- html file containing the resulting QC stats <-- Open this in a web browser (Firefox, Chrome, etc) later when you want to write a report 

### Nanopore reads

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

If the fastq files in qc_read/ directory are too small compared to the ones found in raw_read/ directory, you may wish to relax some of the QC thresholds.



# Assembly, from reads to contigs

Typically you can expect to get 
- draft assembly of tens - hundreds of contigs from illumina-only assembly workflows
- a complete assembly into a single circularized chromosome plus optionally 1-N circularized plamids from nanopore-only or nanopore + illumina hybrid assembly workflows
- though it is also possible to get a handful of non-circularized contigs even using nanopore reads. This is the case when the genome under investigation contains large repetitive elements.


### Illumina-only assembly

*Spades* is the most predominantly used WGS assembler in bacterial WGS using illumina sequencers.\
*Unicycler* is another popular assembler that can deal with illumina-only assembly of bacterial genomes.\
We will try these two assemblers in this tutorial.

**(1) illumina-only assembly using Spades**

You have installed Spades in the _base_ conda environment.

```
spades.py --isolate --only-assembler -t 1 -1 qc_read/SRR14534402_1.fastq -2 qc_read/SRR14534402_2.fastq -o assembly/illumina_only/spades
```

> -t 1    <-- Use 1 processor (cpu); You can increase this if you have multiple processors.\
> --isolate\
> --only-assembler  <-- This disables the read correction step. For better accuracy, do not use this option. In this tutorial I added this option because otherwise it will take significantly longer time.

Finishing Spades assembly can take an hour or so.\
When it finishes, check the output. Output assembly file size and the number of contigs can be checked quickly by:

```
du -sh assembly/illumina_only/spades/contigs.fa
grep -c ">" assembly/illumina_only/spades/contigs.fa
```


**(2) illumina-only assembly using Unicycler**

You have installed Unicycler in the _unicycler_py35_ conda environment.

```
conda activate unicycler_py35
unicycler -1 qc_read/SRR14534402_1.fastq -2 qc_read/SRR14534402_2.fastq -o assembly/illumina_only/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
```


### Nanopore-only assembly

For nanopore-only assembly, currently, _trycycler_ workflow is standing out.\
_Trycycler_ generate several different versions of long read-only assemblies from subsampled reads.\
That enables _trycycler_ to reliably circularize the replicons.

```
conda activate trycycler
mkdir assembly/nanopore_illumina_hybrid/trycycler
```

Subsample the reads, create 12 subsets (by default trycycler will create 12 subsets but you can change this number if you want)
```
trycycler subsample --reads qc_read/SRR14534401.mean_phred_80_len_1k.fastq --out_dir assembly/nanopore_illumina_hybrid/trycycler/read_subsets
```

There will be 12 directories under assembly/nanopore_illumina_hybrid/trycycler/read_subsets, like
>assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_01.fastq\
>assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_02.fastq\
>assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_03.fastq\
> ...\
>assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_12.fastq

Now you have to assemble each subsample using any long read assembler; Flye achieves high performance so let's use it.

```
mkdir assembly/nanopore_illumina_hybrid/trycycler/assemblies
```

Each run of flye can be executed with command like this,
```
flye --nano-raw assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_01.fastq --threads 1 --out-dir assembly/nanopore_illumina_hybrid/trycycler/assemblies/01
flye --nano-raw assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_02.fastq --threads 1 --out-dir assembly/nanopore_illumina_hybrid/trycycler/assemblies/02
...
```

As you have to run flye 12 times on 12 subsampled read sets, so you'd better do it with a script rather than typing command 12 times.
Open a vi editor to write run_flye_all_subsample.sh 
```
vi run_flye_all_subsample.sh 
```

Text editor will open, then you type the key `i` to enable typing mode.\
Write lines like these:
>#!/bin/bash
>for SUBSET_NUM in 01 02 03 04 05 06 07 08 09 10 11 12\
>do\
>    flye --nano-raw assembly/nanopore_illumina_hybrid/trycycler/read_subsets/sample_${SUBSET_NUM}.fastq --threads 1 --out-dir assembly/nanopore_illumina_hybrid/trycycler/assemblies/${SUBSET_NUM}\
>    cp assembly/nanopore_illumina_hybrid/trycycler/assemblies/${SUBSET_NUM}/assembly.fasta assembly/nanopore_illumina_hybrid/trycycler/assemblies/assembly_${SUBSET_NUM}.fasta\
>    rm -rf assembly/nanopore_illumina_hybrid/trycycler/assemblies/${SUBSET_NUM}\
>done

If you've writen all, then say type `esc` key to exit typing mode.\
Then type `:` key to enable command typing.\
Then type `wq` (write and quit) and press `enter` key. Now you are out of that vi editor.

Make this script file executable.\
`chmod 755 run_flye_all_subsample.sh`

Then you can execute the script.\
`./run_flye_all_subsample.sh`

If you cannot keep the connection to the linux server for long enough (~ a day) until the 12 flye runs will can be finished, then you'd better run the command in 'nohup' mode.
`nohup ./run_flye_all_subsample.sh > run_flye_all_subsample.log &`

This will let the command run even after your connection to the server is closed. \
The screen output messages that flye spit out will be writen into the file `run_flye_all_subsample.log` instead of the screen itself.\
This will take a day or so.\
To speed up this step, the only way is to run all flye jobs in parallel on a high performance server.



### Nanopore + Illumina hybrid assembly

**(1) Hybrid assembly using Unicycler**

Unicycler can perform hybrid assembly if long-read sequence file is given in addition to the illumina read files (-l)

You have installed Unicycler in the _unicycler_py35_ conda environment.

```
conda activate unicycler_py35
unicycler -1 qc_read/SRR14534402_1.fastq -2 qc_read/SRR14534402_2.fastq -l qc_read/SRR14534401.mean_phred_80_len_1k.fastq -o assembly/nanopore_illumina_hybrid/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
```




# Evaluation of the assembly results
