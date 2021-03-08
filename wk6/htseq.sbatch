#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=5:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=htseq
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out

module purge
module load htseq/0.13.5
module load samtools/intel/1.11

samtools index result/Aligned.sortedByCoord.out.bam
time htseq-count --format=bam \
	         result/Aligned.sortedByCoord.out.bam \
	         GRCh38/Homo_sapiens.GRCh38.103.gtf
