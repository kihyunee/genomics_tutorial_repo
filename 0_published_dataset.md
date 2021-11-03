
# Individual dataset description


## Giddins et al. 2018 K. pneumoniae isolates from a patient among which ceftazidime-avibactam resistance and meropenem resistance evolved 

### Citation
- __
- 


## Gorrie et al. 2017 K. pneumoniae ICU infection isolates and the patient rectal carriage isolates compared

Most isolates were sequenced only using Illumina\
2 isolates did both ONT MinION and Illumina


### Citation

PRJEB6891
PRJNA351909



## Ludden et al. 2020 K. pneumoniae One Health surveillance including the isolates from BSI, patient stool, livestock fams, meat, hospital sewer and WWTP

### Citation
- __A One Health Study of the Genetic Relatedness of Klebsiella pneumoniae and Their Mobile Elements in the East of England__
- Clinical Infectious Diseases, Volume 70, Issue 2, 15 January 2020, Pages 219–226, https://doi.org/10.1093/cid/ciz174
- Catherine Ludden\*, Danesh Moradigaravand, Dorota Jamrozy, Theodore Gouliouris, Beth Blane, Plamena Naydenova, Juan Hernandez-Garcia, Paul Wood, Nazreen Hadjirin, Milorad Radakovic, Charles Crawley, Nicholas M Brown, Mark Holmes, Julian Parkhill, Sharon J Peacock
- Correspondence: \* London School of Hygiene & Tropical Medicine, UK; Wellcome Sanger Institute, UK

### Opt for
- *Epidemiology* session with One-Health aspect

### Original WGS data description
- Target pathogens: Various STs of Klepsiella pneumoniae from a region, in One-Health cross-sectional sampling scheme including the isolates from
- * blood cultures and stool cultures from BSI patients at a single hospital, May 2015 - Nov 2015
- * hospital wastewater culture, Sep 2014 - Dec 2015
- * raw and treated wastewater at 20 municipal wastewater treatment plants, Jun 2014 - Jan 2015
- * 10 cattle farms, 10 pig farms, 9 poultry, Aug 2014 - Apr 2015
- Sequencing platform: Illumina HiSeq2000
- N. isoaltes sequenced: 249

### Dataset links
__NCBI BioProject__ accession numbers
- PRJEB18814 --> samples from patients and hospital sewer [PRJEB18814 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB18814/)
- PRJEB19918 --> samples from patients and hospital sewer [PRJEB19918 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB19918/)
- PRJEB8771 --> samples from livestock [PRJEB8771 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB8771/)
- PRJEB8776 --> samples from livestock [PRJEB8776 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB8776/)
- PRJEB8766 --> samples from wastewater [PRJEB8766 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB8766/)
- PRJEB8770 --> samples from wastewater [PRJEB8770 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB8770/)

__Raw reads__ runinfo table in csv format, combined across six bioprojects; filtered to include only Klebsiella pneumoniae
- [NCBI SRA runinfo table csv file](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Ludden_2020/Ludden_2020_all_Kpn_SraRunInfo.csv)

__Genome assemblies__ list of assembly accessions combined across six bioprojects; filtered to include only Klebsiella pneumoniae
- [NCBI genome assembly accession list file](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Ludden_2020/Ludden_2020_all_Kpn_assembly_list.txt)




## Mounsey et al. 2021 E. coli fluoroquinolone resistant isolates surveillance in dairy farm and human UTI in the same region

### Citation
- __Limited phylogenetic overlap between fluoroquinolone-resistant Escherichia coli isolated on dairy farms and those causing bacteriuria in humans living in the same geographical region__
- Journal of Antimicrobial Chemotherapy, dkab310, https://doi.org/10.1093/jac/dkab310
- Oliver Mounsey, Hannah Schubert, Jacqueline Findlay, Katy Morley, Emma F Puddy, Virginia C Gould, Paul North, Karen E Bowker, O Martin Williams, Philip B Williams, David C Barrett, Tristan A Cogan, Katy M Turner, Alasdair P MacGowan, Kristen K Reyher, Matthew B Avison*
- Correspondence: \* School of Cellular & Molecular Medicine, University of Bristol, Bristol, UK

### Opt for
- *Epidemiology* session with One-Health aspect
- Assembly are not available
- Raw reads are available

### Original WGS data description
- Target pathogens: FQ-resistant E. coli isolates from dairy farms in South-West England; Collected in Jan 2017 - Dec 2018.
- Target pathogens (2): FQ-resistant E. coli isoaltes from human urinary tract infection samples in the same location; Collected in Sep 2017 and Dec 2018.
- Sequencing platform: Illumina HiSeq 2500
- N. isolates sequenced: 628

### Dataset links
__NCBI BioProject__ accession numbers
- PRJEB45949 --> [PRJEB45949 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB45949/) 

__Raw reads__ runinfo table in csv format
- 628 isolates: [NCBI SRA runinfo csv table](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Mounsey_2021/Mounsey_2021_SraRunInfo.csv)

__Genome assemblies__ not available

__NGS runs mapped to metadata__ 
- tab-delimited text file containing the table: [NGS run metadata table](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Mounsey_2021/Mounsey_2021_EraRunInfo.tsv)




## Royer et al. 2021 E. coli BSI multicenter surveillance

### Citation
- __Phylogroup stability contrasts with high within sequence type complex dynamics of Escherichia coli bloodstream infection isolates over a 12-year period
__
- Genome Medicine volume 13, Article number: 77, https://doi.org/10.1186/s13073-021-00892-0
- Guilhem Royer, Mélanie Mercier Darty, Olivier Clermont, Bénédicte Condamine, Cédric Laouenan, Jean-Winoc Decousser, David Vallenet, Agnès Lefort, Victoire de Lastours, Erick Denamur\* & COLIBAFI and SEPTICOLI groups
- Correspondence: \* Université de Paris, IAME, UMR 1137, INSERM, F-75018, Paris, France


### Opt for
- *Large scale epidemiology* session using already-assembled genomes
- Raw reads are not available

### Original WGS data description
- Target pathogen: E. coli from bloodstream infection cultures; all from Paris France; Collected in 2005 and 2016-2017.
- Sequencing platform: Illumina NextSeq
- N. isolates sequenced: 912 strains from 912 bloodstream infection patients 

### Dataset links
__NCBI BioProject__ accession numbers
- (1) 2005 isolates: PRJEB39260 --> [PRJEB39260 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB39260/) 
- (2) 2016-2017 isolates: PRJEB35745 --> [PRJEB35745 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB35745/) 

__Raw reads__ not available

__Genome assemblies__ assembly accession list txt
- (1) 2005 isolates: [NCBI assembly accession list file for 2005 isolates](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Royer_2021/PRJEB39260_assembly_accession_list.txt)
- (2) 2016-2017 isolates: [NCBI assembly accession list file for 2016-2017 isolates](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Royer_2021/PRJEB35745_assembly_accession_list.txt)

__Isolate metadata mapped__ to the genome assembly accessions
- tab-delimited text file containing the table: [isolate metadata table](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Royer_2021/TableS2_isolate_metadata.txt)



# Selection of dataset per session

## In illumina-only assembly session


## In nanopore-only or hybrid assembly session


## In small dataset session


## In large dataset session



