# Reproducible RNA-seq analysis

This project runs nf-core/rnaseq with Salmon pseudo-alignment for paired-end RNA-seq data.

This is an analysis of publicly available human obesity-related RNA-seq data. No personal or privately collected data are included in this repository.

## Software

- Nextflow 26.04.6
- nf-core/rnaseq 3.26.0
- Docker

## Run

Start Docker Desktop, confirm `docker info` shows a Server section, then run:

```bash
./run_rnaseq.sh
```

The script uses `-resume` and `NXF_OFFLINE=true`. Offline mode prevents the optional nf-core custom-profile download from making the run fail when GitHub is unavailable.

## Inputs

The sample sheet must contain:

```text
sample,fastq_1,fastq_2,strandedness
```

References used for this analysis:

- GTF: `references/genes.gtf.gz`
- Transcript FASTA: `references/gencode.v45.transcripts.enst.fa.gz`

The transcript FASTA headers were normalized to transcript IDs only so they match the GTF `transcript_id` values.

## Data provenance and credits

The FASTQ files were retrieved from the European Nucleotide Archive (ENA):

- Run accession: [SRR37730139](https://www.ebi.ac.uk/ena/browser/view/SRR37730139)
- ENA project search: [SRR37730139](https://www.ebi.ac.uk/ena/browser/search?query=SRR37730139)

The human GRCh38 annotation was obtained from GENCODE release 45 (Ensembl 111):

- [GENCODE human release 45](https://www.gencodegenes.org/human/release_45.html)
- Annotation source: `gencode.v45.annotation.gtf.gz`
- Transcript reference source: `gencode.v45.transcripts.fa.gz`

Please retain these accessions and links when presenting results. Cite the original ENA study associated with `SRR37730139`, the GENCODE release used for the annotation, and the software papers listed below.

## Recommended citations

- nf-core/rnaseq: Ewels et al., *Nature Biotechnology* (2020), [doi:10.1038/s41587-020-0439-x](https://doi.org/10.1038/s41587-020-0439-x)
- nf-core/rnaseq pipeline release: [Zenodo record](https://doi.org/10.5281/zenodo.1400710)
- GENCODE: Frankish et al., *Nucleic Acids Research* (2023), [doi:10.1093/nar/gkac1071](https://doi.org/10.1093/nar/gkac1071)
- Salmon: Patro et al., *Nature Methods* (2017), [doi:10.1038/nmeth.4197](https://doi.org/10.1038/nmeth.4197)
- MultiQC: Ewels et al., *Bioinformatics* (2016), [doi:10.1093/bioinformatics/btw354](https://doi.org/10.1093/bioinformatics/btw354)

Check the ENA record for the original study authors and publication citation before using the analysis in a presentation or portfolio.

## Outputs

The final report is:

```text
results_final/multiqc/multiqc_report.html
```

Additional Salmon tables are under `results_final/salmon/`.

Large input data, references, Nextflow work files, generated results, and local logs are excluded by `.gitignore`. Keep a copy of the exact input checksums and software versions when publishing this project.
