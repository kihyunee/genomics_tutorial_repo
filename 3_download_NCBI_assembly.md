# Single datasets command example

As an example, let's download a type strain genome, Klebsiella aerogenes KCTC 2190 (GCF_000215745.1).

First go to the directory where you'll collect the type strain genomes,\
and use `datasets` command to download GCF_000215745.1\
and decompress the downloaded zip file and rearrange the file name and path.
```
conda activate base

cd ~/genomics_tutorial/K_pneumoniae_ST307/type_strain_genomes
ls
mkdir genome_assembly
datasets download genome accession GCF_000215745.1 --exclude-gff3 --exclude-rna --exclude-protein
ls
unzip ncbi_dataset.zip
ls
rm README.md
mv ncbi_dataset/data/GCF_000215745.1/GCF_000215745.1/GCF_000215745.1_ASM21574v1_genomic.fna genome_assembly/GCF_000215745.1.fasta
rm -rf ncbi_dataset
rm ncbi_dataset.zip
```

