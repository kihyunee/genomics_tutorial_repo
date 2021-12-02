# Identity confirmation using ANI

Genomes to be confirmed by ANI: unicycler hybrid assemblies

### Prepare the pyani input directory

```
cd ~/genomics_tutorial/K_pneumoniae_ST30/my_isolates
mkdir ANI_confirm
cd ANI_confirm
mkdir ANI_input
```

Copy the unicycler hybrid assembly fasta files into `ANI_input/`
```
cp ../final_assemblies_hyb/* ANI_input/
```

Create symbolic links to the type strain genome assemblies inside `ANI_input/`
```
create_symbolic_links_to_type_genomes.sh /home/osboxes/genomics_tutorial/K_pneumoniae_ST307/Klebsiella_type_strain_genomes/genome_assembly ANI_input
```

### Run pyani
Calculate ANI using pyani
```
average_nucleotide_identity.py -i ANI_input -o ANI_output
```

### Inspect the ANI values
```
head ANI_output/ANIm_percentage_identity.tab | cut -f1-6

ANICOL=$(cut -f1 ANI_output/ANIm_percentage_identity.tab | grep -n "KP1766" | cut -d ':' -f1)
cut -f1,${ANICOL} ANI_output/ANIm_percentage_identity.tab
cut -f1,${ANICOL} ANI_output/ANIm_alignment_coverage.tab
```


# MLST assignment
Genomes for which we want to do MLST assignment: Hybrid Unicycler assembiles + known ST307 public genomes.

```
cd ~/genomics_tutorial/K_pneumoniae_ST30/
mkdir ST_confirm
cd ST_confirm

mkdir MLST_input
mkdir MLST_output

cp ../my_isolates/final_assemblies_hyb/* MLST_input/
create_symbolic_links_to_type_genomes.sh /home/osboxes/genomics_tutorial/K_pneumoniae_ST307/ST307_public/genome_assembly MLST_input

conda activate mlst
mlst -h
```

Run on KP1766 
```
mlst --label KP1766 MLST_input/KP1766.hy_un.fasta > MLST_output/KP1766.MLST
```

Run on all genomes
```
run_mlst_on_dir.sh MLST_input MLST_output

# check results
cat MLST_output/*.MLST
```


# Extract the core genome

### Run CoreCruncher

### Run alignment per gene

### Concatenate the alignments 

# Recombination detection and phylogenetic analysis


