#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=5:00:00
#SBATCH --mem=126GB
#SBATCH --job-name=star
#SBATCH --mail-type=END
#SBATCH --account=class
#SBATCH --mail-user=ycc520@nyu.edu
#SBATCH --output=slurm_%j.out

module purge
module load star/intel/2.7.6a


#mdkr star_ref

time STAR --runThreadN 16 \
--runMode genomeGenerate \
--genomeDir star_ref \
--genomeFastaFiles  GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
--sjdbGTFfile GRCh38/Homo_sapiens.GRCh38.103.gtf \
--limitGenomeGenerateRAM 124544990592\
--sjdbOverhang 99

time STAR --genomeDir star_ref \
--runThreadN 16 \
--readFilesIn data/SRR2015713_1.fastq data/SRR2015713_2.fastq \
--outFileNamePrefix ./result/ \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard
