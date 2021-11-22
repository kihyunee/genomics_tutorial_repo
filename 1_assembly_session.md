
# Get WGS raw data for the practice

### Pick one of the following public WGS data examples for your practice

All examples that are recommended here are commonly,
- of clinical isolates with notable antibiotic resistance phenotypes
- sequenced using both illumina and nanopore approaches


(1) Acinetobacter baumannii Cl415

Publication:
> Cl415, a carbapenem-resistant Acinetobacter baumannii isolate containing four AbaR4 and a new variant of AbGRI2, represents a novel global clone 2 strain 
> Rebekah Liepa, Riti Mann, Marwan Osman, Monzer Hamze, Cindy Gunawan, Mohammad Hamidian
> Journal of Antimicrobial Chemotherapy, dkab399
> https://doi.org/10.1093/jac/dkab399

Isolate information:
> Acinetobacter baumannii Cl415
> Isolated from the blood sample of 71-year-old female at the ICU of El Youssef Hospital Centre in Akkar Governorate
> From Lebanon
> Collected in July 2017
> XDR phenotype
> Resistant to carbapenems (imipenem and meropenem), third-generation cephalosporins (cefotaxime, ceftazidime and ceftriaxone), kanamycin, neomycin, gentamicin, streptomycin, spectinomycin, chloramphenicol, nalidixic acid and ciprofloxacin

Data accessions:
> Illumina MiSeq raw data run accession: SRR14534402
> Nanopore MinION raw data run accession: SRR14534401



### Download the SRA Run rawdata for the selected isolate

Activate __*kingfisher*__ environment

```
conda activate kingfisher
kingfisher -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch
kingfisher -r {YOUR_RUN_ACCESSION} -m ena-ascp ena-ftp aws-http prefetch

# {YOUR_RUN_ACCESSION} should be replaced with the run accessions of the isolate that you picked.
# For example if you picked A. baumannii Cl415,
kingfisher -r SRR14534402 -m ena-ascp ena-ftp aws-http prefetch
kingfisher -r SRR14534401 -m ena-ascp ena-ftp aws-http prefetch

# If what you downloaded remain gzipped (file name ends with .gz) then extract them for the ease of downstream scripts
gzip -d *.fastq.gz

```
