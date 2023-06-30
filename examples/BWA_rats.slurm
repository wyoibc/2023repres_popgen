#!/bin/bash

#SBATCH --job-name BWA_rat
#SBATCH -A inbreh
#SBATCH -t 0-72:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=0G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sharrin2@uwyo.edu
#SBATCH -e errs_outs/err_BWA_rat_%A_%a.err
#SBATCH -o errs_outs/std_BWA_rat_%A_%a.out
#SBATCH --array=1-33


# load modules necessary
module load gcc/12.2.0 bwa/0.7.17 samtools/1.16.1

# Set working directory to where the trimmed_reads are
cd /project/getpop/ratsnakes/trimmed_fq

# Reference genome path
REF=/project/getpop/ref/ratsnake_genome_files/ratsnake_scaffold/P_alleghaniensis_concatenate_ragtag.scaffolds.fasta


OUT_DIR=/project/getpop/ratsnakes/rat_bwa_out

# use a loop to find all the files in trimmed_reads that end
#     in fastq.gz and assign them to a bash array

for x in *
do   
  dirs=(${dirs[@]} "${x}")
done


## For whichever SLURM_ARRAY_TASK_ID index a job is in, get the sample 
##     name to simplify the trimmomatic call below
## here, I subtract 1 from the $SLURM_ARRAY_TASK_ID because bash indexing starts at zero
##   I think it's less confusing to subtract 1 here than to remember to do it when 
##   specifying the number of jobs for the array

sample=${dirs[($SLURM_ARRAY_TASK_ID-1)]}


# go into directory
cd $sample

# To get the output filename, we'll do a bit of extra manipulation:
# First, strip off the stuff at the beginnig we don't want

SAMP_ID=$(echo $sample | cut -d '_' -f 3)

# strip off the .fastq.gz and add on a .sam as the output
# outname=${SAMP_ID}.sam

echo "Working on slurm job $SLURM_ARRAY_TASK_ID: sample $SAMP_ID"


# Run bwa on each file using the mem algorithm, then pipe output to samtools to convert to bam and sort the bam file
bwa mem -M -t 24 $REF paired*R1* paired*R2* | samtools view - -b | samtools sort - -o $OUT_DIR/${SAMP_ID}_sort.bam


# index the BAM files
samtools index -@ 24 $OUT_DIR/${SAMP_ID}_sort.bam

echo "completed slurm job $SLURM_ARRAY_TASK_ID: sample $SAMP_ID"
