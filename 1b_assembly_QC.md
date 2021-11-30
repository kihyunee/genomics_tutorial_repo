
# CheckM





# ANI 

### Get the genome sequences of the type strains of Klebsiella spp. from NCBI RefSeq

(1) Go to www.ncbi.nlm.nih.gov/assembly\
(2) Enter the search term "Klebsiella"\
(3) On the left side control/filter panels, check 'Assembly from type' under 'Relation to type material' section\
(4) On the upper panel click 'Send to:' > 'File' > Format 'ID Table (text)' > 'Create File'
(5) A file 'assembly_result.txt' will be downloaded.

```
mkdir ~/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/ANI_confirm
cd ~/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/ANI_confirm
mkdir type_strain_genomes
cd type_strain_genomes

# assume that the 'assembly_result.txt' has been downloaded to the '/home/osboxes/Downloads/' folder

mv /home/osboxes/Downloads/assembly_result.txt .
cut -f3 assembly_result.txt | sed '1d' > type_strain_refseq_accession.txt
```

Use NCBI tool _datasets_ to download the genome assembly sequences.

```
mkdir genome_assembly
/home/osboxes/genomics_tutorial/scripts/batch_datasets_asm.sh type_strain_refseq_accession.txt
```

The downloaded genome assembly fasta files are located at 'genome_assembly/{GCF_ACCESSION}.fasta'

Later you'll want to have a mapping between {GCF_ACCESSION} and the organisms's taxonomic name (such as 'Klebsiella oxytoca').\
Let's grep that information from the sequence header lines.\
There is a script called `collect_header_info.sh` in `~/genomics_tutorial/script` directory.\
Use it to collect organisms information per accession from the fasta header line.

```
/home/osboxes/genomics_tutorial/script/collect_header_info.sh
```

Above action will create a file `accession_2_organism.tab`


### Now calculate ANI
To run pyani you first have to place the fasta files of the genomes to be compared together in a same directory.\
You don't have to create loads of new files (which burdens disk space), but you can simply create symbolic links.

```
cd ..
mkdir ani_input
```

```
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/KP1766/hybrid/unicycler/assembly.fasta ani_input/KP1766_hybrid.fasta
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/KP1768/hybrid/unicycler/assembly.fasta ani_input/KP1768_hybrid.fasta
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/NR5632/hybrid/unicycler/assembly.fasta ani_input/NR5632_hybrid.fasta
```

Also create symbolic links to the type strain genomes.
Use the provided script `link_type_strain_genomes.sh` in `~/genomics_tutorial/script` directory.\

```
/home/osboxes/genomics_tutorial/script/link_type_strain_genomes.sh
```

Now, run the python script provided in the pyani package, to calculate ANIm amongst all the genomes in the `ani_input` directory.
```
average_nucleotide_identity.py -i ani_input -o ani_output
```
