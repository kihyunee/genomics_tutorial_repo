# Read published study and go to the bioproject introduced in the study

For example, there was a study of AMR pathogen MRSA using genomics, published recently.

> https://doi.org/10.1186/s13073-021-00992-x
> 
> **Drivers of methicillin-resistant Staphylococcus aureus (MRSA) lineage replacement in China**
> 
> Hongbin Chen et al. 

Open the link and read the full text for a minute.

This study produced illumina WGS data of ~ 200 MRSA isolates, focussing on _S. aureus_ ST59 and ST239.\
All isoaltes came from bloodstream infection, hospital-acquired pneumonia, or intra-abdominal infection.\
All isoaltes were collected in China, from 1994 to 2016.

They says the NGS raw reads of their WGS isolates were deposited to NCBI with the BioProject ID PRJNA491594.\
Let's see if there are actually data.

(1) Go to www.ncbi.nlm.nih.gov/bioproject

(2) Enter search term "PRJNA491594"

(3) Indeed, there are 204 BioSamples and 204 SRA Experiments under this BioProject.

![image](https://user-images.githubusercontent.com/49987638/144363852-5d62eb36-c76d-4bf2-a3bc-ebceab27e0c9.png)


If you decide to download and analyze these genomes - for any reason -

(1) Click on `SRA` under the `Related information` section on the right side panel.

(2) Now the page shows you the list of SRA runs 

![image](https://user-images.githubusercontent.com/49987638/144364044-9e66e41f-5c1a-4791-8bd5-6e2bab6802a0.png)

(3) Get SRA RunInfo.csv table for these 204 runs by clicking `Send to:` > `File` > (Format) `RunInfo` > `Create File`

(4) Open the downloaded file `SraRunInfo.csv` in microsoft excel.

(5) Judge which columns are useful to you. Column A `Run` is enough to get the sequence reads fastq files.
But other columns contain useful information, like, column T `Model`, column AD `SampleName`, ...

(6) To perform any meaningful analysis, however, you need better isolate information (metadata) including clinical information, isolation source, date, etc.

(7) These type of inforamtion can be found in BioSample section of the NCBI. Go to https://www.ncbi.nlm.nih.gov/bioproject/PRJNA491594

This time click on `BioSample` under `Related information` in the right side panel.

Click one entry, for example, then you'll see that there are at least minimal isolate information: collection date, isolation source, geographic location, ...

![image](https://user-images.githubusercontent.com/49987638/144364973-21a1ca14-8d4f-4984-bc8e-c1c82d2d18b7.png)

(8) You may feel that these metadata are still not enough. Then, typically you may try to look for the metadata in the supplementary files of the published study.

Go to the published paper's __supplementary information__ section, and you can find a more detailed clinical metadata of the isolates.

https://static-content.springer.com/esm/art%3A10.1186%2Fs13073-021-00992-x/MediaObjects/13073_2021_992_MOESM1_ESM.xls

(9) Good. You are now ready to utilize these 204 Chinese MRSA genome sequences in your own genomcis study.


# NCBI bioproject - some large umbrella projects

There are some large-scale genomic surveillance projects to watch major pathogens in some genomics-intensive countries like UK and USA.

Data from these projects are sometimes made available under 'umbrella projects'.

For example UK's Public Health England pathogen sequencing data are deposited into the umbrella bioproject `PRJNA248064`

Go to https://www.ncbi.nlm.nih.gov/bioproject/248064 and you'll find there are 
- 101693 biosamples
- 101318 SRA experiments
- 93277 genome assemblies 

(as of 2021-12-02)


# NCBI biosample and SRA - search for the raw NGS data and minimal metadata for the organism of your interest

If you are interested in collecting WGS raw data for `Enterococcus faecium`,

Go to https://www.ncbi.nlm.nih.gov/biosample/
- Enter the query term `"Enterococcus faecium"[Organism]`
- The search retrieves ~ 27,500 biosamples.

Go to https://www.ncbi.nlm.nih.gov/sra/
- Enter the query term `"Enterococcus faecium"[Organism]`
- The search retrieves ~ 24,100 SRA runs.


# NCBI assemblies for the organism of your interest

You may want to collect assembled genomes instead of raw NGS reads for `Enterococcus faecium`

Go to https://www.ncbi.nlm.nih.gov/assembly
- Enter the query term `"Enterococcus faecium"[Organism]`
- The search retrieves ~ 14,000 assembly accessions.
- `Send to:` > `File` and you can download the accession numbers for all these assemblies.

NCBI provides Entrez `E-utilities` that you can install in your server, and perform the searches you did above in command-line interface.


# Enterobase

Enterobase gives extremely large number of whole genome data for a handful of gastrointestinal pathogens.

Visit https://enterobase.warwick.ac.uk/ 

One remarkable thing about enterobase genome records is that it successully compiled isolate metadata for most of the strains.

For example, go to Salmonella DB https://enterobase.warwick.ac.uk/species/senterica/search_strains

Search `Collection Year` `equals` `2016`

![image](https://user-images.githubusercontent.com/49987638/144368301-9e026b3f-3b1b-4b7f-9169-a1db008cdf97.png)

See most strains have some value, rather than 'missing' or 'NA' for `Source`, `Collection Date`, `Location`, `Serovar`, ... 

