# Using Singularity to run bioinformatic programs on HPCs
---

## Recommended workflow for building singularity images

1. Set up virtual machine with Ubuntu >=18.04


2. Install Singularity and GO - see [Singularity installation documentation](https://docs.sylabs.io/guides/3.0/user-guide/installation.html)


3. Build a sandbox that you can log into via the terminal and troubleshoot the software installation, using a docker image as your starting OS.

```
    sudo singularity build --sandbox SANDBOX_NAME docker://ubuntu:20.04
    sudo singularity shell --writable SANDBOX_NAME
```
4. Document successful software installation steps in a definition file (`.def`)
    - Information on how to structure a `.def` file and the different sections can be found [here](https://docs.sylabs.io/guides/main/user-guide/definition_files.html#files).
    - If you have many similar or lightweight programs to install (e.g., sequence mapping or alignment tools), it may be more efficient to install them as different apps within the same Singularity image as discussed [here](https://docs.sylabs.io/guides/main/user-guide/definition_files.html#scif-app-sections)
    
    
5. Once ready, build your final Singularity `.sif` image from the definition file.

```
    sudo singularity build SINGULARITY.sif SINGULARITY.def
```

--- 
## Example Singularity definition files

### Toolkits

#### alignment_toolkit_20230303.def
    - mafft v7.505
    - trimal v1.4
    - pal2nal v14
    - cdhit v4.8.1
    - mummer v4.0.0rc1
    - fastani v1.33
    
#### bioinformatics_potpourri_20230304.def
    Programs:
        - bbmap
        - csvtk
        - faSomeRecords
        - fastp
        - gffread
        - seqkit
        - seqtk
        - trimmomatic
    Scripts:
        - fasta-splitter.pl
        - removesmalls.pl
    
#### search_toolkit_20230303.def
    - ncbi-blast v2.2.31
    - diamond v2.1.4
    - hmmer v3.3.2
    - hhsuite v3.3.0
    - mmseqs2 v14-7e284

#### mapping_toolkit_20230303.def
    - samtools v1.17
    - minimap2 v2.24
    - minimap2_dino v2.24 <- minimap2 modified for non-canonical dinoflagellate splice sites
    - bowtie2 v2.5.1
    - hisat2 v2.2.1
    - bwa v0.7.17
    - subread v2.0.4

#### phylogenetics_toolkit_20230303.def
    - iqtree2 v2.1.2
    - fasttree v2.1.11
    - physortR v1.0.8
    
#### selection_toolkit_20230303.def
    - ete3 toolkit v3.1.2
    - PAML v4.10.6

## Program-specific singularity images  

### checkv_20230309.def
    - checkv v1.0.1

### deepvirfinder_20230308.def
    - deepvirfinder (pulled from GitHub on 20230308)

### genomad_20230309.def
    - geNomad v1.5.0 

### masurca_v4.1.0.def
    - masurca v4.1.0

### vrhyme_20230309.def
    - vRhyme v1.1.0 
