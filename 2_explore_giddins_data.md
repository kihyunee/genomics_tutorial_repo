# This time, open the FireFox web browser in your linux 


# About the tutorial dataset

### Citation

__Successive emergence of ceftazidimeavibactam resistance through distinct genomic adaptations in blaKPC-2-harboring Klebsiella pneumoniae sequence type 307 isolates__\
Giddins MJ, Macesic N, Annavajhala MK, Stump S, Khan S, McConville TH, Mehta M, Gomez-Simmonds A, Uhlemann A-C.\
Department of Medicine, Division of Infectious Diseases, Columbia University Medical Center, New York, USA\
Antimicrob Agents Chemother 62:e02101-17, https://doi.org/10.1128/AAC.02101-17


### Read the publication by Giddins et al. in AAC 

Just visit https://doi.org/10.1128/AAC.02101-17 and read for a few minutes


### WGS isolates are

- ST307 Klebsiella pneumoniae isolates from a single patient who were receiving ceftazidime-avibactam treatment
- total 7 culture isolates obtained from blood, pancreatic fluid, BAL and tracheal aspirate
- antibiotic resistance phenotypes of the isolates determined for CAZ-AVI and meropenem
- 3 distinct phenotype groups (distinct resistance profiles)

### Sequencing platform
- Illumina MiSeq applied to all isolates
- ONT MinION applied to three isolates


# Visit NCBI BioProject, Get RunInfo csv file
According to the paper, their raw data can be found under PRJNA420753 (bioproject).\
Visit https://www.ncbi.nlm.nih.gov/bioproject/420753

Click on `SRA` under `Related information` panel on the right side.

You'll see 10 SRA entries in the new page.

Save runinfo csv file by clicking `Send to:` > `File` > (Format) `RunInfo` > `Create File`

![image](https://user-images.githubusercontent.com/49987638/144370206-c49c0154-2f38-46a1-9218-ee2762a6b90a.png)

A file will be downloaded, at:
```
/home/osboxes/Downloads/SraRunInfo.csv
```


# Some operation in linux command line

move the downloaded csv file to your directory


# Final prepared run accession table

