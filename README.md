# Using Singularity to run bioinformatic programs on HPCs
---

## Recommended workflow for building singularity images

1. Set up virtual machine with Ubuntu >=18.04


2. Install Singularity and GO (see ##)


3. Build a sandbox that you can log into via the terminal and troubleshoot the software installation, using a docker image as your starting OS.

```
    sudo singularity build --sandbox SANDBOX_NAME docker://ubuntu:20.04
    sudo singularity shell --writable SANDBOX_NAME
```
4. Document successful software installation steps in a definition file (`.def`)
    - Descriptions of the different build sections for a definition file: https://docs.sylabs.io/guides/main/user-guide/definition_files.html#files
    - If you have many similar apps, it may be useful to install them as apps (see https://docs.sylabs.io/guides/main/user-guide/definition_files.html#scif-app-sections)
    
    
5. Once ready, build your final Singularity `.sif` image from the definition file.

```
    sudo singularity build SINGULARITY.sif SINGULARITY.def
```

--- 
## Example Singularity definition files

### alignment_toolkit_03032023.def
    - mafft v7.505
    - trimal v1.4
    - pal2nal v14
    - cdhit v4.8.1
    - mummer v4.0.0rc1
    - fastani v1.33
    
### bioinformatics_potpourri_04032023.def
    Programs:
        - bbmap
        - csvtk
        - faSomeRecords
        - fastp
        - gffread
        - seqkit
        - seqtk
        - seq
        - trimmomatic
    Scripts:
        - fasta-splitter.pl
        - removesmalls.pl
    
### search_toolkit_03032023.def
    - ncbi-blast v2.2.31
    - diamond v2.1.4
    - hmmer
    - hhsuite v3.3.0
    - mmseqs2 v14-7e284

### mapping_toolkit_03032023.def
    - samtools v1.17
    - minimap2 v2.24
    - minimap2_dino v2.24 <- minimap2 modified for non-canonical dinoflagellate splice sites
    - bowtie2 v2.5.1
    - hisat2 v2.2.1
    - bwa v0.7.17
    - subread v2.0.4

### phylogenetics_toolkit_03032023.def
    - iqtree2 v2.1.2
    - fasttree v2.1.11
    - physortR v1.0.8
    
### selection_toolkit_03032023.def
    - ete3 toolkit v3.1.2
    - PAML v4.10.6

### orthofinder_v2.3_04032023.def
    - orthofinder2 v#

### masurca_v2.3_04032023.def
    - masurca v#
