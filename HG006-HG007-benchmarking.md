## Objective
Use the HG006 and HG007 callsets to benchmark the Sentieon variant caller.

## Approach
- Download fastq files from SRA using sratoolkit fastq-dump
- Combine fastq files
- Upload to DNAnexus
- Run sentieon pipeline
- Benchmark against highconf callsets

# Upload files to precisionFDA
The following tree steps are in the script `get_asian_parents_50X.sh`

## Dowload fastq
```
## HG006 - Father
fastq-dump --gzip --split-files -A SRR2831544
fastq-dump --gzip --split-files -A SRR2831545

## HG007 - Mother
fastq-dump --gzip --split-files -A SRR2831471
fastq-dump --gzip --split-files -A SRR2831471
```

## Combine fastq files
```
## HG006 - Father
cat SRR2831544_1.fastq.gz SRR2831545_1.fastq.gz > HG006_HiSeq50X_R1.fastq.gz
cat SRR2831544_1.fastq.gz SRR2831545_1.fastq.gz > HG006_HiSeq50X_R1.fastq.gz

## HG007
cat SRR2831470_1.fastq.gz SRR2831471_1.fastq.gz > HG007_HiSeq50X_R1.fastq.gz
cat SRR2831470_1.fastq.gz SRR2831471_1.fastq.gz > HG007_HiSeq50X_R1.fastq.gz
```

## Upload to precisionFDA
Upload using the pfda commanline tool.
See https://precision.fda.gov/app_assets/new for instructions.
Issue with python workstation packages, specifically PyOpenSSL, setup virtual environment with required packages for uploading files to precitionFDA.

```
for i in HG*fastq.gz;
  do
    ./pfda upload-file ${i}
```


# Haplotyper callset
Using on-line application.
The license for Sentieon expired so using GATK4.
Will generate callsets using GIAB DNAnexus.

- mapped reads using BWA-MEM app
- variant calling using gatk4-haplotypecallerspark-hs37d


# Run benchmarking
GATK and Sentieon 50X calls not ready.
For meeting running comparison on FreeBayes calls from 100X.

Next steps
- Upload trio harmonized HG006 and HG007 callsets
- Sentieon variant calls HG006 --in-progress
  - Upload calls to precisionFDA
  - run benchmarking
- Sentieon variant calls HG007 --in-progress uploading
  - Upload calls to precisionFDA
  - run benchmarking
- GATK HG006 --in-progress
  - run benchmarking
- GATK HG007
  - align and call variants
  - run benchmarking
