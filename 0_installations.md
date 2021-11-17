# Prepare a working directory for all WGS analysis stuffs

```
cd ~
mkdir genomics_tutorial
cd genomics_tutorial
mkdir installation
```


# System stuffs

## python

You can check that you have python3.8 installed in this VM.\
`python3 --version`

## Git

following this: https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/

```
sudo apt update
sudo apt install git
```

## Miniconda

```
cd ~/genomics_tutorial/installation
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
bash Miniconda3-py38_4.10.3-Linux-x86_64.sh
```
when the prompt asks you the location for miniconda installtaion, answer this:\
> /home/osboxes/genomics_tutorial/miniconda3
 
`rm Miniconda3-py38_4.10.3-Linux-x86_64.sh`

Add some channels:
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
```

# Tools for accessing public NGS/genome data

## Kingfisher for donwloading NGS raw reads

tool website: https://github.com/wwood/kingfisher-download

To have well-organized file structure, make sure you are in installation directory that you created above, and clone the kingfisher codes therein.

```
cd ~/genomics_tutorial/installation
git clone https://github.com/wwood/kingfisher-download
cd kingfisher-download
conda env create -n kingfisher -f kingfisher.yml
conda activate kingfisher
cd bin
export PATH=$PWD:$PATH
```
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

```
mkdir ~/genomics_tutorial/installation/ncbi_datasets
cd ~/genomics_tutorial/installation/ncbi_datasets
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/datasets
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/LATEST/linux-amd64/dataformat
chmod +x datasets dataformat
sudo cp datasets dataformat /usr/local/bin
```

# Tools for NGS reads quality control

## Fastp for quick quality control (filtering & trimming) of illumina reads

tool website: https://github.com/OpenGene/fastp

Make sure that you are inside the __*base*__ conda environment, not in any other particular conda environment.

```
conda deactivate
conda activate base
conda install -c bioconda fastp
```

## Filtlong for quality control (filtering & trimming) of long-read sequencing reads

tool website; https://github.com/rrwick/Filtlong

```
cd ~/genomics_tutorial/installation
git clone https://github.com/rrwick/Filtlong.git
cd Filtlong
make -j
```

If you have not installed any of __make__, __g++__, and/or __zlib__ previously, the above `make` command will __FAIL__.

In that case you have to install __make__, __g++__, and/or __zlib__ first.

```
sudo apt install make
sudo apt install g++
sudo apt-get install libz-dev
```

Now, do it again\
`make -j`

bin/filtlong -h


# Tools for genome assembly from WGS reads (short reads only, long reads only, and hybrid)

## Spades to be used in illumina-only assembly

tool website: https://github.com/ablab/spades

Create directory for installation file\
```
mkdir ~/genomics_tutorial/installation/spades
cd ~/genomics_tutorial/installation/spades
```

Download the package containing executable binary\
```
wget http://cab.spbu.ru/files/release3.15.3/SPAdes-3.15.3-Linux.tar.gz
tar -xzf SPAdes-3.15.3-Linux.tar.gz
cd SPAdes-3.15.3-Linux/bin
```

Make spades commands available from any location.

```
tail ~/.bashrc
echo "export PATH=$PWD:\$PATH" >> ~/.bashrc
tail ~/.bashrc
source ~/.bashrc
```

## Unicycler for both illumina-only and illumina + nanopore hybrid assemblies

tool website: https://github.com/rrwick/Unicycler

__*Note*__ that unicycler requires python version lower than 3.8 so it's better to create a separate conda environment for unicycler, in which python version 3.5 is employed.

```
conda create -n unicycler_py35 python=3.5
conda activate unicycler_py35
```

Then clone spades github directory and install it.

```
cd ~/genomics_tutorial/installation
git clone https://github.com/rrwick/Unicycler.git
cd Unicycler
python setup.py install
```

__*Note*__ here's another tricky thing with unicycler: unicycler needs __Spades version between 3.6.2 and 3.13.0__ (while the current version is 3.15.3 at the time of writing)\
So install spades 3.13.0 within the *unicycler_py35* environment.\
`conda install -c bioconda spades=3.13.0`\
This is not the end. When you call `unicycler` unicycler will call `spades 3.15.3` that you have installed in system-wide path (above) and will fail with a complain about 'too new version' of spades.

Solution: when running `unicycler` add this argument: `--spades_path /home/osboxes/miniconda3/envs/unicycler_py35/bin/spades.py`

__Other dependencies for Unicycler:__

In order to run Unicycler successfully, you need to finish installing these additional tools - installation guide for which will be given from here on - \
These tools are not only used in unicycler workflow; but are rather generally useful tools so we will install them system-wide (rather than in *unicycler_py35* environment).

- __Racon__
- __Pilon__
- __Bowtie2__
- __Samtools__
- __Blast+__


## Racon assembler (employed within unicycler workflow)

tool website: https://github.com/lbcb-sci/racon

_We will install **racon** system-wide, NOT WITHIN the unicycler conda environment_ 

`conda deactivate`


If you have not installed __*cmake*__ beforehand, you have to install it before you could go ahead for racon.

`sudo apt install cmake`

OK now get racon and install it.

```
cd ~/genomics_tutorial/installation
git clone --recursive https://github.com/lbcb-sci/racon.git racon
cd racon
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install
```

## Pilon for polishing sequences using short reads

tool website: https://github.com/broadinstitute/pilon/wiki

pilon better be installed within the _Unicycler_ conda environment (we made it as 'unicycler_py35' in a previous step)

```
conda activate unicycler_py35
conda install -c bioconda pilon
```

> or if the above conda approach does not work, install JRE
> and get the pilon jar file from https://github.com/broadinstitute/pilon/releases/download/v1.24/pilon-1.24.jar

Note that if you will need pilon in a workflow other than unicycler, you'll likely need to install pilon in that specific environment too.


## Bowtie2 aligner for mapping/aligning short reads to any reference sequences; system-wide installation

download the binary package from https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.4.4/bowtie2-2.4.4-linux-x86_64.zip/download

place the downloaded bowtie2-2.4.4-linux-x86_64.zip in `~/genomics_tutorial/installation/bowtie2`\
```
cd ~/genomics_tutorial/installation/bowtie2
unzip bowtie2-2.4.4-linux-x86_64.zip
cd bowtie2-2.4.4-linux-x86_64
sudo cp bowtie2* /usr/local/bin
```

## Samtools for manipulating read alignment outputs; install system-wide

tool website:https://github.com/samtools

Before compiling the samtools, you may have to install __*libncurses5-dev*__, __*liblzma-dev*__ and __*libbz2-dev*__ on your ubuntu:

```
sudo apt-get update -y
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y liblzma-dev
```

then

```
mkdir ~/genomics_tutorial/installation/samtools
cd ~/genomics_tutorial/installation/samtools
wget https://github.com/samtools/samtools/releases/download/1.14/samtools-1.14.tar.bz2
bzip2 -d samtools-1.14.tar.bz2
tar -xf samtools-1.14.tar
cd samtools-1.14/
./configure --prefix=/home/osboxes/genomics_tutorial/installation/samtools/samtools-1.14
make
make install

# Add the path to samtools binaries to the system environment PATH.

echo "export PATH=$PWD/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

## Blast+ (NCBI) for local alignment searching; install system-wide

```
mkdir ~/genomics_tutorial/installation/ncbi_blast
cd ~/genomics_tutorial/installation/ncbi_blast
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.12.0+-x64-linux.tar.gz
tar -xzf ncbi-blast-2.12.0+-x64-linux.tar.gz
cd ncbi-blast-2.12.0+/bin
echo "export PATH=$PWD:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

## Trycycler, a long read assembly workflow

tool website: https://github.com/rrwick/Trycycler/wiki

Install trycycler in the conda environment __trycycler__

```
conda deactivate          #(if you were in unicycler_py35 environment)
conda create --name trycycler
conda activate trycycler
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install trycycler
```

## Flye long-read assembler (will be used alone and also as a main workhorse of Trycycler workflow)

tool website: https://github.com/fenderglass/Flye

Install flye within the conda environment __trycycler__\
Remember that you are installing __*flye*__ inside trycycler environment so even when you'll use it alone, do activate `conda activate trycycler` before starting.

`conda install flye`


## Miniasm + Minipolish, a long read assembly workflow (will be used alone and also as a main workhorse of Trycycler workflow)

tool website: https://github.com/rrwick/Minipolish

Install minipolish within the conda environment __trycycler__

```
mkdir ~/genomics_tutorial/installation/minipolish
cd ~/genomics_tutorial/installation/minipolish
git clone https://github.com/rrwick/Minipolish.git
pip3 install ./Minipolish
cp Minipolish/miniasm_and_minipolish.sh /home/osboxes/miniconda3/envs/trycycler/bin/
cp Minipolish/minipolish-runner.py /home/osboxes/miniconda3/envs/trycycler/bin/
```


## any2fasta, a mini script that can convert genome assembly graph to sequence fasta 

tool website: https://github.com/tseemann/any2fasta

```
cd /usr/local/bin
sudo wget https://raw.githubusercontent.com/tseemann/any2fasta/master/any2fasta
sudo chmod +x any2fasta
```

## Medaka, polishing the assemblies using long reads (can be used after Trycycler workflow or after Flye, or in any case when you have both assembly and long reads from the same strain)

For medaka, create it's own conda environment __medaka__

```
conda deactivate
conda create -n medaka -c conda-forge -c bioconda medaka
```


## Polypolish, polishing the assemblies using short reads (can be used in any hybrid assembly workflow)

Install system-wide.

```
mkdir ~/genomics_tutorial/installation/polipolish
cd ~/genomics_tutorial/installation/polipolish
wget https://github.com/rrwick/Polypolish/releases/download/v0.4.3/polypolish-linux-x86_64-musl-v0.4.3.tar.gz
tar -xzf polypolish-linux-x86_64-musl-v0.4.3.tar.gz
sudo cp polypolish /usr/local/bin/
```

## BWA, short read mapping (alignment) tool (is used within Polipolish process, but also have general utility!)

tool website: https://github.com/lh3/bwa

Install system wide.

```
cd ~/genomics_tutorial/installation/
git clone https://github.com/lh3/bwa.git
cd bwa
make
sudo cp bwa qualfa2fq.pl xa2multi.pl /usr/local/bin/
```


## Bandage, a tool for visualization of assembly graphs. You will want use it if you want to visually comprehend how your reads (short or long or hybrid) were connected to each other in your assembly.

tool website: https://github.com/rrwick/Bandage

Install system wide.

```
mkdir ~/genomics_tutorial/installation/bandage
cd ~/genomics_tutorial/installation/bandage
wget https://github.com/rrwick/Bandage/releases/download/v0.8.1/Bandage_Ubuntu_static_v0_8_1.zip
unzip Bandage_Ubuntu_static_v0_8_1.zip
sudo cp Bandage /usr/local/bin/
```


# Tools for basic, general-purpose gene annotation

## Prokka, a tool combining the identification of protein-coding genes, rRNAs, tRNAs, etc. plus (optionally) functional annotations

Install prokka in its own conda environment __prokka__

```
conda create --name prokka
conda activate prokka
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install prokka
```


# Tools for AMR gene annotation

## Abricate, a tool providing uniform annotation using various public ARG DBs, notably using nucleotide sequences for both the references and the query assembly.

tool website: https://github.com/tseemann/abricate

```
conda create -n abricate
conda activate abricate
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install abricate
abricate --check
abricate --list
```

## AMRFinderPlus, an NCBI tool for identification of ARGs uinsg its own curated databases

tool website: https://github.com/ncbi/amr/wiki/Installing-AMRFinder

Install AMRFinderPlus in its own conda environment __*amrfinder*__

```
conda create -n amrfinder
conda activate amrfinder
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install ncbi-amrfinderplus
```

## RGI, a tool powered by the famous CARD database

tool website: https://github.com/arpcard/rgi

Install RGI in its own conda environment __*rgi*__

```
# check what versions of rgi are out there in conda channels
conda search --channel conda-forge --channel bioconda --channel defaults rgi

# make a new conda environment and install rgi
conda create --name rgi 
conda activate rgi
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda install --channel conda-forge --channel bioconda --channel defaults rgi=5.1.1
```

Get CARD database for use in rgi

```
wget https://card.mcmaster.ca/latest/data
tar -xvf data ./card.json
rgi load --card_json /path/to/card.json
```

