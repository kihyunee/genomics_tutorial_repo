# Prepare a working directory for all WGS analysis stuffs

`cd ~`\
`mkdir genomics_tutorial`\
`cd genomics_tutorial`\
`mkdir installation`


# System stuffs

## python

You can check that you have python3.8 installed in this VM.\
`python3 --version`

## Git

following this: https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/

`sudo apt update`\
`sudo apt install git`

## Miniconda

`cd ~/genomics_tutorial/installation`\
`wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh`\
`bash Miniconda3-py38_4.10.3-Linux-x86_64.sh`\
when the prompt asks you the location for miniconda installtaion, answer this:\
> /home/osboxes/genomics_tutorial/miniconda3
> 
`rm Miniconda3-py38_4.10.3-Linux-x86_64.sh`

Add some channels:\
`conda config --add channels defaults`\
`conda config --add channels bioconda`\
`conda config --add channels conda-forge`


# Tools for accessing public NGS/genome data

## Kingfisher for donwloading NGS raw reads

tool website: https://github.com/wwood/kingfisher-download

To have well-organized file structure, make sure you are in installation directory that you created above, and clone the kingfisher codes therein.
`cd ~/genomics_tutorial/installation`\
`git clone https://github.com/wwood/kingfisher-download`\
`cd kingfisher-download`\
`conda env create -n kingfisher -f kingfisher.yml`\
`conda activate kingfisher`\
`cd bin`\
`export PATH=$PWD:$PATH`\
The last line _export PATH ..._ added kinfisher executable's location to the PATH, but this is a temporary solution because when you restart your VM you'll not have that updated PATH anymore.

To make new PATH the default setting, add that line to the ~/.bashrc file.

`echo "export PATH=$PWD:\$PATH" >> ~/.bashrc`\
To enact this new setting\
`source ~/.bashrc`\
Now you can call __kingfisher__ command anywhere. 

HOWEVER, one more thing.

Note that kingfisher was installed in a __*conda environment 'kingfisher'*__\
When you start to use kingfisher:\
`conda activate kingfisher`\
When you are not using kingfisher anymore:\
`conda deactivate`


## NCBI dataset tool for downloading public genome assemblies

tool website: https://www.ncbi.nlm.nih.gov/datasets/docs/v1/quickstarts/command-line-tools/

This tool can be downloaded from NCBI FTP in executable binary format.

`mkdir ~/genomics_tutorial/installation/ncbi_datasets`\
`cd ~/genomics_tutorial/installation/ncbi_datasets`\
`wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/datasets`\
`wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/dataformat`\
`chmod +x datasets dataformat`\
`sudo cp datasets dataformat /usr/local/bin/`


## Fastp for quick quality check, filter, trimming of illumina reads

tool website: https://github.com/OpenGene/fastp

Make sure that you are inside the __*base*__ conda environment, not in any other particular conda environment.

`conda deactivate`\
`conda activate base`\
`conda install -c bioconda fastp`


