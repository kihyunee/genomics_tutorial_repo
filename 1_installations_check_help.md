

# Public data download

### Kingfisher for downloading fastq files from SRA
Installed in: _kingfisher_ environment
```
conda activate kingfisher
kingfisher -h
conda deactivate
```

### NCBI datasets for downloading NCBI genomes
Installed in: system wide
```
datasets -h
datasets download -h
datasets download genome -h
datasets download genome accession -h
```

# NGS read QC preprocessing

### fastp for short read QC preprocessing
Installed in: _base_ environment
```
conda activate base
fastp -h
conda deactivate
```

### filtlong for long read QC preprocessing
Intalled in: system wide
```
filtlong -h
```

# Assembly and basic inspectation of genome assemblies

### Spades for short read assembly
Installed in: _base_ environment
```
conda activate base
spades.py -h
conda deactivate
```

### Unicycler for short read assembly and hybrid assembly
Installed in: _unicycler_py35_ environment
```
conda activate unicycler_py35
unicycler -h
conda deactivate
```

### Flye for long read assembly (also used as the main component of trycycler workflow)
Installed in: _trycycler_ environment
```
conda activate trycycler
flye -h
conda deactivate
```

### Trycycler workflow for long read assembly and hybrid assembly
Installed in: _trycycler_ environment
```
conda activate trycycler
trycycler -h
conda deactivate
```

### Medaka for polishing assemblies using long reads
Installed in: _medaka_ environment
```
conda activate medaka
medaka -h
conda deactivate
```

### Polypolish for polishing assemblies using short reads
Installed in: system wide
```
polypolish -h
```

### Bandage for visualizing assembly graphs
Installed in: system wide
```
Bandage -h
```

### CheckM for quality evaluation of genome assemblies
Installed in: _checkm_ environment
```
conda activate checkm
checkm -h
conda deactivate
```

### pyani for ANI calculation - applicable to species-level identification
Installed in: _base_ environment
```
conda activate base
average_nucleotide_identity.py -h
conda deactivate
```

# Annotation of genes and MGEs

### Prokka for gene calling
Installed in: _prokka_ environment
```
conda activate prokka
prokka -h
conda deactivate
```

### Abricate searching for homologs of reference AMR genes provided in several public AMR gene databases
Installed in: _abricate_ environment
```
conda activate abricate
abricate -h
conda deactivate
```

### AMRFinder searching for homologs of reference AMR genes in NCBI's AMR gene collection
Installed in: _amrfinder_ environment
```
conda activate amrfinder
amrfinder -h
conda deactivate
```

### RGI searching for homologs of reference AMR genes in CARD's AMR gene collection
Installed in: _rgi_ environment
```
conda activate rgi
rgi -h
conda deactivate
```

### ISEScan searching for IS elements in the genomic contigs
Installed in: _isescan_ environment
```
conda activate isescan
isescan.py -h
conda deactivate
```

### Integron Finder searching for integrons in the genomic contigs
Installed in: **integron_finder** environment
```
conda activate integron_finder
integron_finder -h
conda deactivate
```

### Plasmid Finder searching for the genomic contigs originated from plasmids
Installed in: _plasmidfinder_ environment
```
conda activate plasmidfinder
plasmidfinder.py -h
conda deactivate
```

### Platon searching for the genomic contigs originated from plasmids
Installed in: _platon_ environment
```
conda activate platon
platon -h
conda deactivate
```

### mlst assigning MLST to given genome assemblies
Installed in: _mlst_ environment
```
conda activate mlst
mlst -h
conda deactivate
```
