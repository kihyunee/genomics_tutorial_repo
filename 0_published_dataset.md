
# Individual dataset description



## Lisotto et al. 2021 VRE and VSE nosocomial isolates collected from University Medical Center Groningen (UMCG)

### Citation
- __Long-read sequencing-based in silico phage typing of vancomycin-resistant Enterococcus faecium__
- BMC Genomics 22, 758 (2021)
- Paola Lisotto, Erwin C. Raangs, Natacha Couto, Sigrid Rosema, Mariëtte Lokate, Xuewei Zhou, Alexander W. Friedrich, John W. A. Rossen, Hermie J. M. Harmsen, Erik Bathoorn \* & Monika A. Chlebowicz-Fliss
- Correspondence: \* Department of Medical Microbiology and Infection Prevention, University of Groningen, University Medical Center Groningen, Netherlands

### Opt for
- *Illumina assembly* practice
- *Nanopore assembly* practice
- *Hybrid assembly* practice
- *Antibiotic resistance genes* annotation practice
- *Evolutionary genomics* practice (optionally) using publicly available closely related VRE/VSE genomes

### Original WGS data description
- Target pathogens: Enterococcus faecium isolates from patients of UMCG between 2014 and 2019
- * from nosocomial outbreaks, 
- * or from bloodstream infection surveillance
- Sequencing platform: Illumina MiSeq and ONT MinION
- N. isoaltes sequenced: 12

### Dataset links
__NCBI BioProject__ 
- PRJEB41626 --> [PRJEB41626 page](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB41626)

__Raw reads__ runinfo, strangely 23 runs are in PRJEB41626, 1 run lies separately in PRJEB25590
- RunInfo sample names are not automatically matched to the isolate metadata table provided as Table 1 in the published article.
- Thus I collated BioSample accession - sample titles - matched sample titles in runinfo csv - plus published Table 1 to create the isolate metadata table which include both the isolation source data and the accession numbers for MiSeq and MinION runs. 
- SRA runinfo csv files are not needed here anymore.

__Genome assemblies__ not available.

__NGS runs mapped to metadata__ metadata 
- [MinION and MiSeq run accessions and isolation source info mapped to each other in tsv file](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Lisotto_2021/run_isolate_metadata.tsv)




## Lam et al. 2019 K. pneumoniae ST15 isolates collected in Norwegian hospitals.

### Citation
- __Convergence of virulence and MDR in a single plasmid vector in MDR Klebsiella pneumoniae ST15__
- Journal of Antimicrobial Chemotherapy, Volume 74, Issue 5, May 2019, Pages 1218–1222, https://doi.org/10.1093/jac/dkz028
- Margaret M C Lam, Kelly L Wyres, Ryan R Wick, Louise M Judd, Aasmund Fostervold, Kathryn E Holt, Iren Høyland Löhr\*
- Correspondence: \* Department of Medical Microbiology, Stavanger University Hospital, Stavanger, Norway

### Opt for
- *Illumina assembly* practice
- *Antibiotic resistance genes* annotation practice
- *Evolutionary genomics* practice (optionally) using publicly available ST15 genomes

### Original WGS data description
- Target pathogens: ST15 K. pneumoniae isolates
- * One isoalte from a patient with cholangiocarcinoma and later bacteremia ; from Oslo hospital in 2014
- * One isolate from a patient with glioblastoma, neutropenic fever with pneumonia and bacteraemia; from Western Norway hospital in 2015 
- * Other genomes (n = 10) within Norwegian WGS surveillance belonging to ST15 were used
- Sequencing platform: Illumina reads are available for all isolates; ONT was performed on two focal strains but the raw reads are not available.
- N. isoaltes sequenced: 12

### Dataset links
__NCBI BioProject__ sadly 
- PRJEB27256 --> [PRJEB27256 page](https://www.ncbi.nlm.nih.gov/bioproject/420753)

__Raw reads__ runinfo table in csv format; filtered 12 entries that are relevant to this study because the bioproject contained a larger dataset from this umbrella project
- [Runinfo csv file for the subset of PRJEB27256 that are relevant](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Lam_2019/PRJEB27256_relevant_SraRunInfo.csv)

__Genome assemblies__ we're not going to use them.

__NGS runs mapped to metadata__ metadata 
- [MiSeq run accession mapped to isolate name and isolation source info](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Lam_2019/run_isolate_metadata.tsv)




## Giddins et al. 2018 K. pneumoniae ST307 isolates from a single patient, in which ceftazidime-avibactam resistance and meropenem resistance evolved

### Citation
- __Successive emergence of ceftazidimeavibactam resistance through distinct genomic adaptations in blaKPC-2-harboring Klebsiella pneumoniae sequence type 307 isolates
- Antimicrob Agents Chemother 62:e02101-17, https://doi.org/10.1128/AAC.02101-17
- Giddins MJ, Macesic N, Annavajhala MK, Stump S, Khan S, McConville TH, Mehta M, Gomez-Simmonds A, Uhlemann A-C.
- Correspondence: Department of Medicine, Division of Infectious Diseases, Columbia University Medical Center, New York, USA

### Opt for
- *Illumina assembly* practice
- *Nanopore assembly* practice
- *Hybrid assembly* practice
- *Antibiotic resistance genes* annotation practice
- *Evolutionary genomics* practice using publicly available ST307 genomes

### Original WGS data description
- Target pathogens: ST307 Klebsiella pneumoniae isolates from a single patient who were receiving ceftazidime-avibactam treatment.
- * seven culture isolates obtained from blood, pancreatic fluid, BAL and tracheal aspirate
- * antibiotic resistance phenotypes of the isolates determined for CAZ-AVI and meropenem
- Sequencing platform: Illumina MiSeq applied to all isolates; ONT MinION applied to three isolates
- N. isoaltes sequenced: 7

### Dataset links
__NCBI BioProject__ accession numbers
- PRJNA420753 --> [PRJNA420753 page](https://www.ncbi.nlm.nih.gov/bioproject/420753)

__Raw reads__ runinfo table in csv format
- [Runinfo csv file for 7 MiSeq + 3 MinION raw reads under PRJNA420753](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Giddin_2018/PRJNA420753_SraRunInfo.csv)

__Genome assemblies__ accession numbers for three hybrid assemblies are available but we're not going to use them.

__NGS runs mapped to metadata__ metadata 
- Phenotypic resistance profiles and isolation source of each isolate is presented in [Table 1 of the original manuscript](https://journals.asm.org/doi/10.1128/AAC.02101-17#T1)
- Sadly the Table 1 is provided as an _image_ so you have to parse the information manually, I did it: [Isolate metadata table in tsv format](https://github.com/kihyunee/genomics_tutorial/blob/main/datasets/Giddin_2018/Giddins_2018_isolate_metadata.tsv)




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



