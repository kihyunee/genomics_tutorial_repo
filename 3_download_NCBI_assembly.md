# Genome accession numbers to download?

### 1. Klebsiella type strains

I searched `Klebsiella` in www.ncbi.nlm.nih.gov/assembly

and selected these filters on the left side panel: (1) `Assembly from type` under `Relation to type material`  (2) `Latest RefSeq` under `Status` 

![image](https://user-images.githubusercontent.com/49987638/144380631-235190b6-c6cb-4cc5-bdc3-dc731976262f.png)

Then `Send to:` > `File` > `ID list (text)` to save the list of accession numbers.

Extracted RefSeq accession column (GCF_).

As a result there is `~/preview_genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/refseq_accessions.txt`


### 2. ST307 genome assemblies

I searched the query term `"Klebsiella pneumoniae"[Organism] AND "ST307"[Attributes]` in www.ncbi.nlm.nih.gov/biosample

Then followed the link to the related assemblies.

![image](https://user-images.githubusercontent.com/49987638/144381586-d152aaae-04e3-4a05-a68a-25a260d30852.png)

Then exported the list of accessions as I showed above.

As a result there is `~/preview_genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/refseq_accessions.txt`



# Downloading genome assembly sequences from the list of RefSeq accessions

If you want to download one genome sequence, such as `Klebsiella aerogenes KCTC 2190 (GCF_000215745.1)`

You can use NCBI tool `datasets` for that.

If you want, you can do this (but don't follow these commands now)
```
conda activate base

cd ~/genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/
ls
datasets download genome accession GCF_000215745.1 --exclude-gff3 --exclude-rna --exclude-protein
ls
unzip ncbi_dataset.zip
ls
mkdir genome_assembly
mv ncbi_dataset/data/GCF_000215745.1/GCF_000215745.1/GCF_000215745.1_ASM21574v1_genomic.fna genome_assembly/GCF_000215745.1.fasta
rm -rf ncbi_dataset
rm ncbi_dataset.zip
rm README.md

conda deactivate
```

It is not practical to repeat these commands for 33 type strains + 34 ST307 genomes.

There is a script for downloading batch list of RefSeq/GenBank assembly accessions using `datasets` tool.\
Let's use it. The script will place all genome assemblies into the `./genome_assembly/` directory.

```
conda activate base
cd ~/genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/
batch_datasets_asm.sh refseq_acceesions.txt
```

This is NCBI tool so frequently it lost connection in the middle of downloading and fails to download some of the genomes.\
In that case, run the same command again, until no more failed genome remains.
```
batch_datasets_asm.sh refseq_acceesions.txt
```

Do the same for in the ST307 genomes directory
```
cd ~/genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/
batch_datasets_asm.sh refseq_acceesions.txt
```


### Time flies. If time out, stop the downloading process 
Kill it
```
`Ctrl` + `C`
```

Copy the pre-downloaded genomes from 
- `~/preview_genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/genome_assembly/*.fasta`
- and `~/preview_genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/genome_assembly/*.fasta`

```
cd ~/genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/
mkdir genome_assembly
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/genome_assembly/*.fasta genome_assembly/

cd ~/genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/
mkdir genome_assembly
mv ~/preview_genomics_tutorial/K_pneumoniae_ST307/ST307_public_genomes/genome_assembly/*.fasta genome_assembly/
```
