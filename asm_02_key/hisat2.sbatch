#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0:30:00
#SBATCH --mem=16GB
#SBATCH --job-name=HISAT2
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out
module purge
module load hisat2/2.2.1
module load samtools/intel/1.11

# Index the reference genome for HISAT2

## Prepare gene model information
hisat2_extract_splice_sites.py chr17.gtf > genome.ss
hisat2_extract_exons.py chr17.gtf > genome.exon

## Index the genome
hisat2-build -p 4 chr17.fa hisat2_genome

mkdir result/hisat2
# Align
hisat2 -x hisat2_genome \
       -1 read_1.fastq \
       -2 read_2.fastq \
       -S result/hisat2/aligned_hisat2.sam

cd result/hisat2
# Convert to BAM
samtools view -S -b aligned_hisat2.sam > aligned_hisat2.bam
# Sort by coordinate
samtools sort aligned_hisat2.sam -o aligned_hisat2_sorted.bam
# Index the BAM
samtools index aligned_hisat2_sorted.bam
