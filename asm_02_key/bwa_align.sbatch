#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0:30:00
#SBATCH --mem=8GB
#SBATCH --job-name=bwa
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out
module purge
module load bwa/intel/0.7.17
module load samtools/intel/1.11

# Index the reference genome for BWA
bwa index chr17.fa

mkdir result/BWA
# Align
bwa mem chr17.fa \
	read_1.fastq read_2.fastq > result/BWA/aligned_bwa.sam

cd result/BWA

# Convert to BAM
samtools view -S -b aligned_bwa.sam > aligned_bwa.bam
# Sort by coordinate
samtools sort aligned_bwa.sam -o aligned_bwa_sorted.bam
# Index the BAM
samtools index aligned_bwa_sorted.bam
