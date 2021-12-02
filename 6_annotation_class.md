# Prokka 

We'll run prokka on 
- all three Giddins et al. isolate genomes 
- all collected public ST307 genomes.

First collect them into the ./AMR_annotation/input_assembly directory.\
You don't have to create additional disk space burden. Instead create __*symbolic links*__ to each original assembly fasta files.\
- For convenience, among many assembly versions created for Giddins isolates, we'll use just the __*unicycler hybrid*__ assemblies.

There is a script prepared in advance to do this job, creating symbolic links.\
You can look at `vi ~/genomics_tutorial_repo/scripts/create_symbolic_links_to_ST307_genomes.sh` to see how the commands look like.

```
mkdir ~/genomics_tutorial/K_pneumoniae_ST307/AMR_annotation
cd ~/genomics_tutorial/K_pneumoniae_ST307/AMR_annotation
mkdir input_assembly
mkdir prokka_output

create_symbolic_links_to_ST307_genomes.sh input_assembly
```

Now run prokka on all input assemblies.

```
conda activate prokka
prokka -h
```

See many options prokka provides.

A single prokka run, on KP1766 as example, can be done by
```
prokka --cdsrnaolap --quiet --outdir prokka_output/KP1766 --prefix KP1766 --locustag KP1766 --noanno --cpus 1 input_assembly/KP1766.fasta

# check outputs
ls prokka_output/KP1766/
```

Use the script prepared in advance to do run prokka on all input assemblies.\
You can take a look at the prokka commands used in the script: `vi ~/genomics_tutorial_repo/scripts/run_prokka_on_input_assemblies_dir.sh`

```
run_prokka_on_input_assemblies_dir.sh prokka_output
```

The script will create each strain's own directory under `./prokka_output` directory and place the gff, faa, ffn, ... files inside it.


