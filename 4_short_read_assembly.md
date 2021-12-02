# Warning

The commands provided here are writen for _KP1766_ data.\
If you chose other isolate (_KP1768_ or _NR5643_) change the isolate name parts accordingly.


# Go to the isolate's data directory

```
cd ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates/
```


# 1. Fastp (QC preprocessing short reads)

```
conda activate base

mkdir qc_read
fastp -h

# any option that you'd like to use??

fastp --in1 raw_read/KP1766_1.fastq --in2 raw_read/KP1766_2.fastq --out1 qc_read/KP1766_1.fastq --out2 qc_read/KP1766_2.fastq --json qc_read/KP1766.fastp.json --html qc_read/KP1766.fastp.html
```

It's done quickly.\
Let's look inside their HTML report.\
Open the linux File browser.

![image](https://user-images.githubusercontent.com/49987638/144385780-9a2f79cf-2ccd-4f70-a5be-3415d2dd8f9c.png)

Go to the `/home/osboxes/genomics_tutorial/K_pneumoniae_ST307/my_isolates/qc_read` directory.

Double click the `KP1766.fastp.html` file there. See what's shown there.



# 2. Spades assembly
```
conda activate base
mkdir assembly

spades.py -h

# Look at the options for a minute. Any option that you'd like to use??

mkdir assembly/KP1766
spades.py --isolate --only-assembler -t 1 -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -o assembly/KP1766/illumina_spades
```

It'll take an hour or so to finish.

### Go back to slide and get a brief introduction to the spades assembler.

### Abort the process as we can't wait too long.

`Ctrl` + `c`

Remove incomplete spades output directory and move the test run output to here.

```
rm -rf assembly/KP1766/illumina_spades
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/KP1766/illumina_spades ./assembly/KP1766/
```

### Copy the results for the other strains (that you did not choose to practice with)
```
mkdir -rf assembly/KP1768
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/KP1768/illumina_spades ./assembly/KP1768/

mkdir -rf assembly/NR5632
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/NR5632/illumina_spades ./assembly/NR5632/
```



# 3. Unicycler assembly
```
conda activate unicycler_py35

unicycler -h

# Look at the help message for a minute. Any options you'd like to use??

unicycler -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -o assembly/KP1766/illumina_unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
```

It'll take several hours to finish.

### Go back to slide and get a brief introduction to the unicycler assembler.

### Abort the process as we can't wait too long.

`Ctrl` + `c`

Remove incomplete unicycler output directory and move the test run output to here.

```
rm -rf assembly/KP1766/illumina_unicycler
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/KP1766/illumina_unicycler ./assembly/KP1766/
```

### Copy the results for the other strains (that you did not choose to practice with)
```
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/KP1768/illumina_unicycler ./assembly/KP1768/

mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/my_isolates/assembly/NR5632/illumina_unicycler ./assembly/NR5632/
```



# 4. Bandage visualization

```
Bandage load assembly/KP1766/illumina_spades/assembly_graph.fastg
Bandage load assembly/KP1766/illumina_unicycler/assembly.gfa
Bandage load assembly/KP1768/illumina_spades/assembly_graph.fastg
Bandage load assembly/KP1768/illumina_unicycler/assembly.gfa
Bandage load assembly/NR5632/illumina_spades/assembly_graph.fastg
Bandage load assembly/NR5632/illumina_unicycler/assembly.gfa
```


# 5. CheckM evaluation

Let's collect all final assemblies in one directory for convenience.
```
mkdir final_assemblies
mv assembly/KP1766/illumina_spades/contigs.fasta final_assemblies/KP1766.il_sp.fasta
mv assembly/KP1766/illumina_unicycler/assembly.fasta final_assemblies/KP1766.il_un.fasta
mv assembly/KP1768/illumina_spades/contigs.fasta final_assemblies/KP1768.il_sp.fasta
mv assembly/KP1768/illumina_unicycler/assembly.fasta final_assemblies/KP1768.il_un.fasta
mv assembly/NR5632/illumina_spades/contigs.fasta final_assemblies/NR5632.il_sp.fasta
mv assembly/NR5632/illumina_unicycler/assembly.fasta final_assemblies/NR5632.il_un.fasta
```

Activate _checkm_ conda environment.\
We want to avoid the standard CheckM workflow which involves pplacer phylogenetic placement - it consumes > 50 GB RAM and will never end.\
Instead we'll explicitly provide the taxonomy of these genomes, and run a streamlined taxonomy workflow.\

```
conda activate checkm
checkm taxon_list | grep "Klebsiella"
# OK there is `Klebsiella pneumoniae` taxon

mkdir checkm_tmp
checkm taxonomy_wf --tmpdir checkm_tmp -x fasta -f checkm_output.txt --tab_table genus Klebsiella final_assemblies checkm_output
```

Inspect the scores. 
`cat checkm_output.txt`

