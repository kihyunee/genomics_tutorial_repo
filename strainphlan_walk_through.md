
# Before start
You need to have 
* 1. conda installed
* 2. metagenome shotgun sequencing reads in fastq files


# Install metaphlan3 (and strainphlan3 is included in metaphlan3) in a new conda environment called 'metaphlan'
```
conda create --name metaphlan -c bioconda python=3.7 metaphlan
```

# Activate the 'metaphlan' conda environment
```
conda activate metaphlan
```

# Get metaphlan database 
I used this directory path to store metaphlan database file in: `/data0/home/kihyunee/local_DBs/metaphlan_db`\
You need to change it to the path you want.
```
metaphlan --install --bowtie2db /data0/home/kihyunee/local_DBs/metaphlan_db
```

# Assumptions on the file locations (you have to change this according to your file locations)
I chosed arbitrarily four public sequencing runs from an arbitrarily selected gut metagenome study, as test inputs.\
Raw read sequence files (fastq.gz) were stored at these paths:
```
raw_read/SRR9092032.fastq.gz
raw_read/SRR9092033.fastq.gz
raw_read/SRR9092034.fastq.gz
raw_read/SRR9092035.fastq.gz
```

# Run metaphlan + strainphlan 
(1) Prepare the directories to store metaphlan output files
```
mkdir sams
mkdir bowtie2
mkdir profiles
```

(2) Run metaphlan per each sample
Several assumptions specific to my server setting made here.
- I assume using 4 processors (multithread); If you have more or less than 4 processors available, you may adjust `--nproc` option.
- I had an issue / error running metaphlan when I left it to use the default paths to bowtie2 and bowtie2-build executables. 
- That's because the bowtie2 installation made within the metaphlan environment (as a dependency) was somehow broken.
- That issue is solved when I feed the fine/working version of bowtie2 executables via `bowtie2_exe` and `bowtie2_build` options.
- All you need know know is the paths to the WORKING version of bowtie2 executables THAT I ALREADY HAD in my server.
- In my case that were: `/chunlab/tool/python/python2/bin/bowtie2` and `/chunlab/tool/python/python2/bin/bowtie2-build`
- Bowtie2 is needed in many many workflows anyway. So why not install it system-wide (outside this metaphlan environment) ?

```
metaphlan --nproc 4 --bowtie2_exe /chunlab/tool/python/python2/bin/bowtie2 --bowtie2_build /chunlab/tool/python/python2/bin/bowtie2-build --bowtie2db /data0/home/kihyunee/local_DBs/metaphlan_db --input_type fastq -s sams/SRR9092032.sam.bz2 --bowtie2out bowtie2/SRR9092032.bowtie2.bz2 -o profiles/SRR9092032_profile.tsv raw_read/SRR9092032.fastq.gz
metaphlan --nproc 4 --bowtie2_exe /chunlab/tool/python/python2/bin/bowtie2 --bowtie2_build /chunlab/tool/python/python2/bin/bowtie2-build --bowtie2db /data0/home/kihyunee/local_DBs/metaphlan_db --input_type fastq -s sams/SRR9092033.sam.bz2 --bowtie2out bowtie2/SRR9092033.bowtie2.bz2 -o profiles/SRR9092033_profile.tsv raw_read/SRR9092033.fastq.gz
metaphlan --nproc 4 --bowtie2_exe /chunlab/tool/python/python2/bin/bowtie2 --bowtie2_build /chunlab/tool/python/python2/bin/bowtie2-build --bowtie2db /data0/home/kihyunee/local_DBs/metaphlan_db --input_type fastq -s sams/SRR9092034.sam.bz2 --bowtie2out bowtie2/SRR9092034.bowtie2.bz2 -o profiles/SRR9092034_profile.tsv raw_read/SRR9092034.fastq.gz
metaphlan --nproc 4 --bowtie2_exe /chunlab/tool/python/python2/bin/bowtie2 --bowtie2_build /chunlab/tool/python/python2/bin/bowtie2-build --bowtie2db /data0/home/kihyunee/local_DBs/metaphlan_db --input_type fastq -s sams/SRR9092035.sam.bz2 --bowtie2out bowtie2/SRR9092035.bowtie2.bz2 -o profiles/SRR9092035_profile.tsv raw_read/SRR9092035.fastq.gz
```

(3) Prepare the marker genes to be used in SNP profiling
```
mkdir consensus_markers
sample2markers.py -i sams/*.sam.bz2 -o consensus_markers --nproc 4
```
That created .pkl files under `consensus_markers` directory


(4) Now it's time to pick one clade (e.g. species) to analyze the strains within.\
We picked, let's say, "Bacteroides vulgatus" species to profile the strains (metaphlan species name = s__Bacteroides_vulgatus)\
Let's prepare the markers for B. vulgatus in the `db_markers` directory.\
For this, you have to specify the metaphlan database .pkl file in the command.\
In my case, that file is `/data0/home/kihyunee/local_DBs/metaphlan_db/mpa_v30_CHOCOPhlAn_201901.pkl`

```
mkdir -p db_markers
extract_markers.py -c s__Bacteroides_vulgatus -d /data0/home/kihyunee/local_DBs/metaphlan_db/mpa_v30_CHOCOPhlAn_201901.pkl -o db_markers
```

This gave me error message like this:
> /data/chunlab/tool/miniconda3/envs/metaphlan/bin/bowtie2-inspect-s: error while loading shared libraries: libtbb.so.2: cannot open shared object file: No such file or directory

Meaning that something went wrong, related to bowtie2.
In the step (2) we circumvented bowtie2 problem by directly feeding the paths to bowtie2 and bowtie2-build executables.
This time `extract_markers.py` does not have such an option to specify the bowtie2 paths.
So I circumvented the issues arising from * the `bowtie2` installation in `metaphlan` environment * like this. 


Fix-Step-1. check the path the `bowtie2` is called from, in the conda environment `metaphlan`
```
which bowtie2
```
It tells me that bowtie2 is currently (in metaphlan environment) called from `/chunlab/tool/miniconda3/envs/metaphlan/bin/`

Fix-Step-2. I went to that directory where the problematic bowtie2 executables reside int, and hided all bowtie2 executables in the new temporary directory.
```
cd /chunlab/tool/miniconda3/envs/metaphlan/bin/
mkdir HIDE_bowtie2
mv bowtie2 bowtie2-* HIDE_bowtie2/
```
Fix-Step-3. Then came back to the working directory.
```
which bowtie2
```
Now when I invoke bowtie2, the executable in `/chunlab/tool/python/python2/bin/bowtie2` is called

Fix-Step-4. Tried the `extract_markers.py` command again
```
extract_markers.py -c s__Bacteroides_vulgatus -d /data0/home/kihyunee/local_DBs/metaphlan_db/mpa_v30_CHOCOPhlAn_201901.pkl -o db_markers
```


OK now it ran without a problem.
I found non-empty output file in `db_markers` directory.
```
ls db_markers/
du -sh db_markers/s__Bacteroides_vulgatus.fna
grep -c ">" db_markers/s__Bacteroides_vulgatus.fna
head db_markers/s__Bacteroides_vulgatus.fna
```

(5) Multiple sequence alignment of the strains in the metagenomes and build phylogenis. (the `strainphlan` command)

Optionally you can add reference genomes to your alignments and trees.
I think this is recommendable, becauase then you can show where those metagenomes strains belong among the strains that people already know.

So I prepared genome fasta files for 7 complete genomes of Bacteroides vulgatus in a new directory. Their file paths are like this:
```
ref_genomes_B_vulgatus/GCA_000012825.1.fasta  ref_genomes_B_vulgatus/GCA_018289355.1.fasta  
ref_genomes_B_vulgatus/GCA_020885715.1.fasta  ref_genomes_B_vulgatus/GCA_020885855.1.fasta
ref_genomes_B_vulgatus/GCA_008728395.1.fasta  ref_genomes_B_vulgatus/GCA_020091465.1.fasta  
ref_genomes_B_vulgatus/GCA_020885775.1.fasta
```

Now execute `strainphlan` command.
They still want `--database` path, so be careful not to skip that.
```
mkdir strainphlan_output
strainphlan --database /data0/home/kihyunee/local_DBs/metaphlan_db/mpa_v30_CHOCOPhlAn_201901.pkl -s consensus_markers/*.pkl -m db_markers/s__Bacteroides_vulgatus.fna -r ref_genomes_B_vulgatus/*.fasta -o strainphlan_output --nprocs 4 -c s__Bacteroides_vulgatus
```

When this is finished, there is a final tree that you can open and visualize with FigTree or other favorite tree tools.
```
strainphlan_output/RAxML_result.s__Bacteroides_vulgatus.StrainPhlAn3.tre
```

