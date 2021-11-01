# Download WGS reads from NCBI SRA / EBI ERA
## Background
*Download what?*

\
__(1) Starting from the published articles that described WGS data that are closely relevant to your question__\
In the papers of interest you have to identify two things:

\
(a) Data accession number\
If you can find the project accession (PRJNA*, PRJEB*, SRP*, ERP*), that's good enough.\
Go to NCBI website, search within "BioProject" the PRJ* identifier.\
Click on the linked '*SRA Experiments*' under '*Project Data:*' section.\
Click on the '*Send to:*' > select '*File*' > select '*RunInfo*' as format > click on '*Create File*' button.\
Now you've secured the list of run accessions. Open the downloaded csv file. You'll find the run accesions at the first column.\

\
(b) Metadata table that matches run accessions to the sample names to the clinical phenotypes\
This has to be secured manually, as these information is provided in different forms depending on the articles. Sometimes, or quite often, you are not going to find it eventually.
Good luck with this.

\
__(2) Based on the taxon of interest__\


## Install kingfisher

Create genomics_tutorial directory if you don't already have it.

``mkdir genomics_tutorial``

From now on every data files used in this tutorial will be organized under that directory. First go into that directory.

``cd genomics_tutorial``

Now make 'installation' directory.

``mkdir installation``

Go to 'installation' directory and start installing Kingfisher

__Kingfisher__ is a great tool made to help researchers conveniently download fastq files for the public SRA/ERA records.

Website: https://github.com/wwood/kingfisher-download

Citation: Not published

``cd installation``

I assume that you have __git__ [(git)](https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/) and __conda__ [(conda)](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html) installed on your linux.

``git clone https://github.com/wwood/kingfisher-download``\
``cd kingfisher-download``\
``conda env create -n kingfisher -f kingfisher.yml``\
``conda activate kingfisher``\
``cd bin``\
``export PATH=$PWD:$PATH``\
``kingfisher -h``


# Download WGS assemblies from NCBI GenBank / RefSeq assemblies

