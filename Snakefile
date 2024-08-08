include: "workflow/rules/fastqc.smk"
include: "workflow/rules/rnaseq_paired.smk"
include: "workflow/rules/rnaseq_not_paired.smk"


# configfile: "config/config.yaml"


rule all:
    input:
        # expand("results/sortmerna_files/unpaired/rRNA/{sample}.log", sample = sample_name),
        # expand("results/trimmomatic_files/unpaired/{sample}_fwd.fq.gz", sample = sample_name),
        # ("results/kallisto_files/unpaired/abundance.h5"),
        # 
        # Below I have the paired results
        # 
        expand("FASTQC/{sample}/{sample}_fastqc.html", sample=fastq_samples),
        # expand("resources/rna_paired/merged/{sample}_mergedF.fastq", sample=L1_F),
        # expand("results/sortmerna_files/rRNA/{sample}_rev.fq", sample=L1_F),
        # expand("results/trimmomatic_files/{sample}_fwd_p.fq.gz", sample=L1_F),
        # ("resources/kallisto/Homo_sapiens.GRCh38.cdna.all.release-100.idx"),
        # ("results/kallisto_files/abundance.h5"),
        # 
        # I comment the lines above so I can debug the rnaseq_not_paired pipeline
        # 
        # The lines below will perform fastqc in the filtered and trimmed RNA
        # 
        expand("FASTQC/sortmerna/filtered/{sample}_fwd/{sample}_fwd_fastqc.html", sample = filtered_rna_samples_fwd),
        expand("FASTQC/sortmerna/filtered/{sample}_rev/{sample}_rev_fastqc.html", sample = filtered_rna_samples_rev),
        expand("FASTQC/sortmerna/unpaired/filtered/{sample}/{sample}_fastqc.html", sample = unpaired_rna_samples),
        expand("FASTQC/trimmomatic/{sample}/{sample}_fwd_p_fastqc.html", sample = trimmed_fwd_paired_rna_samples),
        expand("FASTQC/trimmomatic/unpaired/{sample}/{sample}_fwd_fastqc.html", sample = trimmed_unpaired_rna_samples),
        # expand("FASTQC_rna_trimmed/{sample}/{sample}_fastqc.html", sample = trimmed_rna_samples),
        "results/kallisto_files/unpaired/abundance.h5",
        "results/kallisto_files/abundance.h5",
    shell:
        'echo "I just run subrules!"'
