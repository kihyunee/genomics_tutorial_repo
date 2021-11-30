# Obtain public genome assemblies in the focal species

Search ST307 Klebsiella pneumoniae publicly available genomes.
(1) Go to www.ncbi.nlm.nih.gov/biosample\
(2) Search term: "st307"[Attributes] AND "Klebsiella pneumoniae"[Organism]\
(3) On the right side panel, 'Find related data' > 'Assembly' > 'Find items'\
(4) Total 34 assembly entries retrieved. Save the accession numbers by clicking 'Send to:' > 'File' > Format 'ID List (text)' > 'Create File'\
(5) assembly_result.txt will be downloaded.

Do not leave the page, but again, collect sample information (isolate metadata) for these 34 assemblies.\
(1) 'Find related data' > 'BioSample' > 'Find items'\
(2) Now we came to the list of 34 biosamples.\
(3) 'Send to:' > 'File' > Format 'Full (text)' > 'Create File'\
(4) biosample_result.txt will be downloaded.


```
mkdir ~/genomics_tutorial/annotation_session_test
cd ~/genomics_tutorial/annotation_session_test
mkdir prep_public_ST307
cd prep_public_ST307
mv /home/osboxes/Downloads/assembly_result.txt .
mv /home/osboxes/Downloads/biosample_result.txt .

cut -f3 assembly_result.txt | sed '1d' > refseq_acc_list.txt
/home/osboxes/genomics_tutorial/script/batch_datasets_asm.sh refseq_acc_list.txt

```


# Assign MLST



# Select the genomes in the focal ST for in-depth comparison



# Annotate genes, ARGs, mobile genetic elements in the public genomes



# Create pan-genome of the focal ST



# Create phylogenetic tree using the core genome



# Inspect the antibiotic resistance genes in your isolates and public genomes



