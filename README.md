# Reproducible RNA-seq analysis

This portfolio project analyzes publicly available human obesity-related paired-end RNA-seq data. It uses the nf-core/rnaseq workflow with Salmon transcript quantification and quality-control reporting. The data are not personal or privately collected data.

## What the workflow does

The analysis includes:

- Input validation and FASTQ quality control
- Adapter and quality trimming with Trim Galore
- Transcriptome preparation and Salmon indexing
- Salmon pseudo-alignment and transcript quantification
- Transcript-to-gene mapping with `tx2gene`
- Gene- and transcript-level abundance tables
- SummarizedExperiment objects for downstream R analysis
- DESeq2-based quality-control summaries
- A combined MultiQC HTML report

## My work

I prepared and ran this analysis across Linux/Ubuntu, WSL, Docker containers, Nextflow, R/Bioconductor, Salmon, DESeq2, and MultiQC. The repository records the commands, resource limits, input format, reference versions, provenance, and reproducibility setup. The large raw data, references, temporary files, and generated results are kept outside GitHub.

## Software

- Nextflow 26.04.6
- nf-core/rnaseq 3.26.0
- Docker
- R/Bioconductor, including DESeq2 and SummarizedExperiment
- Salmon and MultiQC

## Reproduce the analysis

Start Docker Desktop, then run from a Linux/WSL terminal:

```bash
./run_rnaseq.sh
```

The script uses `-resume` and `NXF_OFFLINE=true`. Offline mode avoids downloading optional nf-core institutional profiles during the run. Update the paths in `run_rnaseq.sh` and provide the required FASTQ and reference files on a new machine.

The sample sheet format is:

```text
sample,fastq_1,fastq_2,strandedness
```

## Data provenance and credits

FASTQ files were retrieved from the European Nucleotide Archive (ENA):

- Run accession: [SRR37730139](https://www.ebi.ac.uk/ena/browser/view/SRR37730139)
- ENA search: [SRR37730139](https://www.ebi.ac.uk/ena/browser/search?query=SRR37730139)

The human GRCh38 annotation was obtained from [GENCODE human release 45](https://www.gencodegenes.org/human/release_45.html), Ensembl 111. The GTF and transcript FASTA were matched, and the FASTA headers were normalized to transcript IDs so they agree with the GTF `transcript_id` values.

The normalized transcript FASTA can be recreated from the downloaded GENCODE file with:

```bash
gzip -cd gencode.v45.transcripts.fa.gz | awk '/^>/{sub(/\|.*/, "")} {print}' | gzip -c > gencode.v45.transcripts.enst.fa.gz
```

When presenting this work, retain the ENA accession, cite the original study listed on the ENA record, and credit GENCODE and the software below.

## Recommended citations

- nf-core/rnaseq: Ewels et al., *Nature Biotechnology* (2020), [doi:10.1038/s41587-020-0439-x](https://doi.org/10.1038/s41587-020-0439-x)
- nf-core/rnaseq release: [Zenodo record](https://doi.org/10.5281/zenodo.1400710)
- GENCODE: Frankish et al., *Nucleic Acids Research* (2023), [doi:10.1093/nar/gkac1071](https://doi.org/10.1093/nar/gkac1071)
- Salmon: Patro et al., *Nature Methods* (2017), [doi:10.1038/nmeth.4197](https://doi.org/10.1038/nmeth.4197)
- MultiQC: Ewels et al., *Bioinformatics* (2016), [doi:10.1093/bioinformatics/btw354](https://doi.org/10.1093/bioinformatics/btw354)

## Results

The completed MultiQC report is available online through GitHub Pages at the link shown in the repository's **About** section. A copy is also stored at `docs/multiqc_report.html`.

The report summarizes quality control for the public ENA run `SRR37730139`. Generated outputs are kept separate from the source code so the repository remains small and reproducible.

Additional Salmon tables are under `results_final/salmon/`.

## Before removing the analysis computer

The GitHub repository preserves the workflow, configuration, sample-sheet template, provenance, citations, and browser-viewable MultiQC report. The public FASTQ data can be downloaded again from ENA using accession `SRR37730139`, and the GENCODE references can be downloaded again from release 45. If you want to preserve the complete local analysis, copy `results_final/` to external storage as well; `nf_work/` is temporary and does not need to be retained after the successful run.
