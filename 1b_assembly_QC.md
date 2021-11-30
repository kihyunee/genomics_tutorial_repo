
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
Open a vi editor and write a script like this.
`vi collect_header_info.sh`

```
#!/bin/bash
output="accession_2_organism.tab"
if [ -f ${output} ]; then
  rm ${output}
fi
for fasta in genome_assembly/*.fasta
do
  fasta_fn="${fasta##*/}"
  accession="${fasta_fn%.fasta}"
  header_sample="$(head -n1 ${fasta})"
  header_nonacc="${header_sample#* }"
  header_org="${header_nonacc%%,*}"
  header_org="${header_org% chromosome*}"
  header_org="${header_org% plasmid*}"
  echo "${accession}  ${header_org}"
done
```

```
chmod 755 collect_header_info.sh
./collect_header_info.sh
```

### Now calculate ANI
First place all fasta files of your genome assemblies together in a same directory.\
You don't have to create loads of new files, but you can simply create symbolic links.

```
cd ..
mkdir ani_input
```

```
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/KP1766/hybrid/unicycler/assembly.fasta ani_input/KP1766_hybrid.fasta
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/KP1768/hybrid/unicycler/assembly.fasta ani_input/KP1768_hybrid.fasta
ln -s /home/osboxes/genomics_tutorial/assembly_session_test/K_pneumoniae_ST307/assembly/NR5632/hybrid/unicycler/assembly.fasta ani_input/NR5632_hybrid.fasta
```

`vi link_type_strain_genomes.sh`

```
#!/bin/bash
for fasta in type_strain_genomes/genome_assembly/*.fasta
do
  fasta_fn="${fasta##*/}"
  accession="${fasta_fn%.fasta}"
  ln -s ${fasta} ani_input/${accession}.fasta
done
```
