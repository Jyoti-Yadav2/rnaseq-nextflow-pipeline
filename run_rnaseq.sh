#!/usr/bin/env bash
set -euo pipefail

PROJECT=/mnt/d/rnaseq_run
CONFIG=/home/nextflow_jyoti/rnaseq_run/low_mem.config

NXF_OFFLINE=true nextflow run nf-core/rnaseq \
  -c "$CONFIG" \
  -work-dir "$PROJECT/nf_work" \
  --input "$PROJECT/samplesheet.csv" \
  --outdir "$PROJECT/results_final" \
  --gtf "$PROJECT/references/genes.gtf.gz" \
  --transcript_fasta "$PROJECT/references/gencode.v45.transcripts.enst.fa.gz" \
  --pseudo_aligner salmon \
  -profile docker \
  -resume
