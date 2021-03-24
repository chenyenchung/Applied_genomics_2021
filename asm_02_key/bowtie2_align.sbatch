#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0:30:00
#SBATCH --mem=8GB
#SBATCH --job-name=bowtie2
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out
module purge
module load bowtie2/2.4.2
module load samtools/intel/1.11

# Index the reference genome for Bowtie2
bowtie2-build chr17.fa chr17_bowtie2

# Align
bowtie2 -x chr17_bowtie2 \
	-1 read_1.fastq \
	-2 read_2.fastq \
	-S result/bowtie2/aligned_bowtie2.sam

cd result/bowtie2

# Convert to BAM
samtools view -S -b aligned_bowtie2.sam > aligned_bowtie2.bam
# Sort by coordinate
samtools sort aligned_bowtie2.sam -o aligned_bowtie2_sorted.bam
# Index the BAM
samtools index aligned_bowtie2_sorted.bam
