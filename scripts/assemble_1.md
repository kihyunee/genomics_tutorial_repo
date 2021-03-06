```
mkdir assembly

mkdir assembly/KP1766
mkdir assembly/KP1766/illumina_only
spades.py --isolate --only-assembler -t 1 -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -o assembly/KP1766/illumina_only/spades

mkdir assembly/KP1768
mkdir assembly/KP1768/illumina_only
spades.py --isolate --only-assembler -t 1 -1 qc_read/KP1768_1.fastq -2 qc_read/KP1768_2.fastq -o assembly/KP1768/illumina_only/spades

mkdir assembly/NR5632
mkdir assembly/NR5632/illumina_only
spades.py --isolate --only-assembler -t 1 -1 qc_read/NR5632_1.fastq -2 qc_read/NR5632_2.fastq -o assembly/NR5632/illumina_only/spades
```


```
conda activate unicycler_py35

unicycler -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -o assembly/KP1766/illumina_only/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
unicycler -1 qc_read/KP1768_1.fastq -2 qc_read/KP1768_2.fastq -o assembly/KP1768/illumina_only/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
unicycler -1 qc_read/NR5632_1.fastq -2 qc_read/NR5632_2.fastq -o assembly/NR5632/illumina_only/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py



mkdir assembly/KP1766/hybrid
unicycler -1 qc_read/KP1766_1.fastq -2 qc_read/KP1766_2.fastq -l qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1766/hybrid/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py

mkdir assembly/KP1768/hybrid
unicycler -1 qc_read/KP1768_1.fastq -2 qc_read/KP1768_2.fastq -l qc_read/KP1768_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1768/hybrid/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py

mkdir assembly/NR5632/hybrid
unicycler -1 qc_read/NR5632_1.fastq -2 qc_read/NR5632_2.fastq -l qc_read/NR5632_Nanopore.mean_phred_90_len_1k.fastq -o assembly/NR5632/hybrid/unicycler --spades_path /home/osboxes/genomics_tutorial/miniconda3/envs/unicycler_py35/bin/spades.py
```


```
conda activate trycycler


mkdir assembly/KP1766/nano_only
flye --nano-raw qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1766/nano_only/flye -i 2

mkdir assembly/KP1768/nano_only
flye --nano-raw qc_read/KP1768_Nanopore.mean_phred_90_len_1k.fastq -o assembly/KP1768/nano_only/flye -i 2

mkdir assembly/NR5632/nano_only
flye --nano-raw qc_read/NR5632_Nanopore.mean_phred_90_len_1k.fastq -o assembly/NR5632/nano_only/flye -i 2

mkdir assembly/KP1766/nano_only/miniasm_minipol
miniasm_and_minipolish.sh qc_read/KP1766_Nanopore.mean_phred_90_len_1k.fastq 2 > assembly/KP1766/nano_only/miniasm_minipol/assembly.gfa
any2fasta assembly/KP1766/nano_only/miniasm_minipol/assembly.gfa > assembly/KP1766/nano_only/miniasm_minipol/assembly.fasta

mkdir assembly/KP1768/nano_only/miniasm_minipol
miniasm_and_minipolish.sh qc_read/KP1768_Nanopore.mean_phred_90_len_1k.fastq 2 > assembly/KP1768/nano_only/miniasm_minipol/assembly.gfa
any2fasta assembly/KP1768/nano_only/miniasm_minipol/assembly.gfa > assembly/KP1768/nano_only/miniasm_minipol/assembly.fasta

mkdir assembly/NR5632/nano_only/miniasm_minipol
miniasm_and_minipolish.sh qc_read/NR5632_Nanopore.mean_phred_90_len_1k.fastq 2 > assembly/NR5632/nano_only/miniasm_minipol/assembly.gfa
any2fasta assembly/NR5632/nano_only/miniasm_minipol/assembly.gfa > assembly/NR5632/nano_only/miniasm_minipol/assembly.fasta

```
