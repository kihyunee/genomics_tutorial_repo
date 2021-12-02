# Warning

Every commands here is writen for `KP1766` strain.\
You have to change the isolate name part accordingly, if you are practicing using a different strain.

# Go to the working directory

```
cd ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates/
```

# Filtlong on raw nanopore reads

Check filtlong help message
```
conda activate base
filtlong -h
```
Any option that you want to use?

Run filtlong with two different filtering cutoffs: mean expected read accuracy of 80% and 90%
```
filtlong --min_length 1000 --min_mean_q 80 raw_read/KP1766_Nanopore.fastq > qc_read/KP1766_Nanopore.mean_phred_80_len_1k.fastq
filtlong --min_length 1000 --min_mean_q 80 raw_read/KP1766_Nanopore.fastq > qc_read/KP1766_Nanopore.mean_phred_80_len_1k.fastq
```

See how much of the raw reads are gone.
```
du -sh raw_read/KP1766_Nanopore.fastq
du -sh qc_read/KP1766_Nanopore.*
```

# Flye on filtered nanopore reads

To run flye, activate _trycycler_ environment.

```
conda activate trycycler
flye -h
```
Any option that you want to use?

Run flye
```
flye --nano-raw qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1766/nano_flye -i 2
```

## Polish flye assembly using Medaka using nanopore reads

To run medaka, activate _medaka_ environment.
```
conda activate medaka
medaka -h
medaka consensus -h
medaka_consensus -h
```
Any option that you want to use?

Run medaka_consensus
```
medaka_consensus -i qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq -d assembly/KP1766/nano_flye/assembly.fasta -o assembly/KP1766/nano_flye/medaka -t 1
```

## Polish flye assembly further using illumina reads (now becomes hybrid) using Polypolish

Check polypolish command line options
```
polypolish -h
```

```
mkdir assembly/KP1766/nano_flye/medaka_polypolish
bwa index assembly/KP1766/nano_flye/medaka/consensus.fasta
bwa mem -t 1 -a assembly/KP1766/nano_flye/medaka/consensus.fasta qc_read/KP1766_1.fastq > assembly/KP1766/nano_flye/medaka_polypolish/alignments_1.sam
bwa mem -t 1 -a assembly/KP1766/nano_flye/medaka/consensus.fasta qc_read/KP1766_2.fastq > assembly/KP1766/nano_flye/medaka_polypolish/alignments_2.sam
polypolish assembly/KP1766/nano_flye/medaka/consensus.fasta assembly/KP1766/nano_flye/medaka_polypolish/alignments_1.sam assembly/KP1766/nano_flye/medaka_polypolish/alignments_2.sam > assembly/KP1766/nano_flye/medaka_polypolish/polypolished_assembly.fasta

```

# Unicycler with both illumina and nanopore reads

Activate unicycler_py35 environment.
```
conda activate unicycler_py35
unicycler -h
```

Run hybrid assembly by giving `-l` (long read) input fastq to unicycler
```
unicycler -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -l qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1766/hybrid_unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
```

# Trycycler assembly using nanopore reads


# Bandage inspectation

```
conda activate base

# Flye nanopore only
Bandage load assembly/KP1766/nano_flye/assembly_graph.gfa

# Unicycler hybrid
Bandage load assembly/KP1766/hybrid_unicycler/assembly.gfa
```

# CheckM evaluation

Copy unicycler hybrid assembly genomes to `final_assemblies_hyb/` directory.
```
mkdir final_assemblies_hyb
cp assembly/KP1766/hybrid_unicycler/assembly.fasta final_assemblies_hyb/KP1766.hy_un.fasta
cp assembly/KP1768/hybrid_unicycler/assembly.fasta final_assemblies_hyb/KP1768.hy_un.fasta
cp assembly/NR5632/hybrid_unicycler/assembly.fasta final_assemblies_hyb/NR5632.hy_un.fasta
```

Activate checkm environment.
```
conda activate checkm
checkm -h
```

Create new output with added genomes.
```
checkm taxonomy_wf --tmpdir checkm_tmp -x fasta -f checkm_output_hyb.txt --tab_table genus Klebsiella final_assemblies_hyb checkm_output
```
