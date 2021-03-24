#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0:30:00
#SBATCH --mem=16GB
#SBATCH --job-name=star
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out
module purge
module load star/intel/2.7.6a
module load samtools/intel/1.11

# Index the reference genome for STAR
STAR --runThreadN 4 \
--runMode genomeGenerate \
--genomeSAindexNbases 11 \
--genomeDir star_ref \
--genomeFastaFiles chr17.fa \
--sjdbGTFfile chr17.gtf \
--sjdbOverhang 99

# Align
STAR --genomeDir star_ref \
--runThreadN 4 \
--readFilesIn read_1.fastq read_2.fastq \
--outFileNamePrefix ./result/STAR/ \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard
