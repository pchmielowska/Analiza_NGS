# Project NGS -- SNP variant detectio

### Data
Data: https://www.ncbi.nlm.nih.gov/sra/SRX025959[accn] <br>
Submitted by: University of Michigan<br>
Project: “Pooled linkage analysis for discovery of Saccharomyces cerevisiae functional mutations by whole genome sequencing”<br>

SRA:SRP003355, Whole Genome Sequencing<br>
Experiments: 3 (3 samples)<br>
Runs: 3 (3.8Gbp; 2.5Gb)<br>
Organism: Saccharomyces cerevisiae<br>
Layout: PAIRED<br>
The purpose of this experiment was to identify mutated genes in vac6 and vac22 yeast mutants. <br>


### Steps of analysis:
1 Acquiring raw data - SRA repositorium<br>
2 Quality control - fastq<br>
3 Trimming - trimmomatic<br>
4 Quality control - fastq<br>
5 Comparison to the reference genome - hisat2<br>
6 Detection of polymorphisms - bcftools<br>
7 Biological sense and analysis of results<br>

### Steps in detail description:
1. Acquiring raw data - SRA repositorium
Downloading 1,000,000 reads SRA:SRP003355 using command: fastq-dump. Output: 3 .fastq files.
That can be found in projekt_NGS/original_files folder.

2. Quality control - fastq
Doing quality control using fastqc command. Results: There was no adapters; Per base sequence quality could be improved for all files. 
That can be found in results/quality_control folder. 
HTML based report also can be found in results/quality_control and .guality_control2 folder.

3. Trimming - trimmomatic
Trimmomatic tool was used to improve the quality, with two parameters: SlIDINGWINDOW (4:20) - scan the read with a 4-base wide sliding window, cutting when the average quality per base drops below 20 and MINLEN (20) - drop reads below the 20 bases long. 
Output: fastq unpaired and paired files. That can be found in results/trimming folder.

4. Quality control
Redoing quality control using fastqc command to check if the quality is improved. 
Output file, htmls were produced, that can be found in results/quality_control2 folder.

After the data is cleaned up, the next step is to align, the reads to a reference genome if it is available or conduct de novo assembly.
Most NGS applications require reads mapping to a reference genome prior to conducting further analysis.
The purpose of this mapping process is to locate origins of the reads in the genome

5. Comparison to the reference genome
Mapping was done using Hisat2 tool, because  is a fast and sensitive alignment program for mapping next-generation sequencing reads (whole-genome, transcriptome, and exome sequencing data) against the general human population (as well as against a single reference genome) . At first index files were created using a reference genome. 

Samtools with command view tool, used to convertion .sam files to .bam files (BAM files has less memory, approximately 27% of the original SAM file). Samtools command falgstat used- counted the number of alignments for each FLAG type,  sorts commnad to sort files and scommand stats – produces comprehensive statistics from alignment files.

Output file, BAM and stats files were produced, that can be found in results/mapping.

6. Detection of polymorphisms
For polymorphisms used bcftools, because this program can generated VCF or BCF containing genotype likelihoods for one or multiple alignment (BAM or CRAM) files. Mpileup - multi-way pileup producing genotype likelihoods. 

Output file, vcf was produced, that can be found in results/variant_detection_and_annotation folder.

7. Biological sense and analysis of results
- snpeff - for snpeff R64-1-1.105 database annotation.That can be found in results/variant_detection_and_annotation folder
- vcftoolz - comparison between samples. That can be found in  results/vcftoolz folder.

