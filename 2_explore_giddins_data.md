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

Move to the ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates \
Create a subdirectory `run_info` there\
Go into `run_info/`
```
cd ~/genomics_tutorial/K_pneumoniae_ST307/my_isolates/
mkdir run_info
cd run_info
```

Move the downloaded csv file to the current directory
```
mv /home/osboxes/Downloads/SraRunInfo.csv .
```

Extract only the interestin (informative) columns in the csv file.
```
cut -d ',' -f1,12,20,29,30 SraRunInfo.csv
# See what are extracted?
# Save them in a new tab-delimited file
cut -d ',' -f1,12,20,29,30 SraRunInfo.csv | tr "," "\t" > minimal_runinfo.tsv
# Check file content
cat minimal_runinfo.tsv
```

Focus on the 3 isolates that have both MiSeq and MinION runs. Namely `KP1766`, `KP1768`, and `NR5632`\
And the only really interesting columns that you need to know are columns 1 (Run) and column 2 (LibraryName) of `minimal_runinfo.tsv`
```
grep "KP1766" minimal_runinfo.tsv | cut -f1,2 > run_library_name.tab
grep "KP1768" minimal_runinfo.tsv | cut -f1,2 >> run_library_name.tab
grep "NR5632" minimal_runinfo.tsv | cut -f1,2 >> run_library_name.tab

# Check what you created
cat run_library_name.tab
```

# FYI, all the above command line works can also be done in excel, more conveniently.

