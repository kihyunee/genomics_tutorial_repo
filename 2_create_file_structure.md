# ~/genomics_tutorial

We will use 
```
~/genomics_tutorial
(= /home/osboxes/genomics_tutorial)
```
as the very base directory for all project data.

In the VM image, there is already `~/genomics_tutorial` directory - the instructor created it beforehand.\
So you don't have to do it.


# Project directories

Let's pretend that the three isolates from Giddins et al. are your own project data.\
Think of these three isolates as your own data from the strains that you isolated.\
The project name is `K_pneumoniae_ST307`

```
cd ~/genomics_tutorial
mkdir K_pneumoniae_ST307
cd K_pneumoniae_ST307
```

There will be three different genome collections
- Three isolates which you have NGS raw data
- Klebsiella type strain genome assemblies from NCBI
- Klebsiella pneumoniae ST307 public genome assemblies from NCBI

Create subdirectory for each.
```
mkdir my_isolates
mkdir Klebsiella_type_strain_genomes
mkdir ST307_public_genomes
```

That's good for now.
