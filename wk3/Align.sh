#!/bin/bash
#SBATCH --job-name=bwa
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1GB
#SBATCH --time=0:10:00
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --mail-type=END
#SBATCH --mail-type=BEGIN


module purge
module load bwa/intel/0.7.17

cd /scratch/ycc520/ag_recitation/wk3/data/align
bwa index GCF_000001405.33_GRCh38.p7_chr20_genomic.fna
bwa mem GCF_000001405.33_GRCh38.p7_chr20_genomic.fna read_1.fastq read_2.fastq > ../../int/aligned_reads.sam