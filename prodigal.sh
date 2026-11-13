#Install Prodigal and run predictions
conda create --name prodigal
conda activate prodgial
conda install -n prodigal -c conda-forge mamba
mamba install -n prodigal -c conda-forge -c bioconda prodigal

# Create shewanella prodigal output directory
mkdir -p shewanella_genomes/prodigal_results

# Run prodigal on each shewanella genome
for file in shewanella_genomes/*.fasta; do
    name=$(basename "$file" .fasta)
    prodigal -i "$file" \
        -o "shewanella_genomes/prodigal_results/${name}.gff" \
        -a "shewanella_genomes/prodigal_results/${name}.faa" \
        -d "shewanella_genomes/prodigal_results/${name}_cds.fna" \
        -f gff -p single
done

# Create psychromonas prodigal output directory
mkdir -p psychromonas_genomes/prodigal_results

# Run prodigal on each psychromonas genome
for file in psychromonas_genomes/*.fasta; do
    name=$(basename "$file" .fasta)
    prodigal -i "$file" \
        -o "psychromonas_genomes/prodigal_results/${name}.gff" \
        -a "psychromonas_genomes/prodigal_results/${name}.faa" \
        -d "psychromonas_genomes/prodigal_results/${name}_cds.fna" \
        -f gff -p single
done

# Create colwellia prodigal output directory
mkdir -p colwellia_genomes/prodigal_results

# Run prodigal on each colwellia genome
for file in colwellia_genomes/*.fna; do
    name=$(basename "$file" .fna)
    prodigal -i "$file" \
        -o "colwellia_genomes/prodigal_results/${name}.gff" \
        -a "colwellia_genomes/prodigal_results/${name}.faa" \
        -d "colwellia_genomes/prodigal_results/${name}_cds.fna" \
        -f gff -p single
done

# Create moritella prodigal output directory
mkdir -p moritella_genomes/prodigal_results

# Run prodigal on each moritella genome
for file in moritella_genomes/*.fna; do
    name=$(basename "$file" .fna)
    prodigal -i "$file" \
        -o "moritella_genomes/prodigal_results/${name}.gff" \
        -a "moritella_genomes/prodigal_results/${name}.faa" \
        -d "moritella_genomes/prodigal_results/${name}_cds.fna" \
        -f gff -p single
done

# Create photobacterium prodigal output directory
mkdir -p photobacterium_genomes/prodigal_results

# Run prodigal on each moritella genome
for file in photobacterium_genomes/*.fna; do
    name=$(basename "$file" .fna)
    prodigal -i "$file" \
        -o "photobacterium_genomes/prodigal_results/${name}.gff" \
        -a "photobacterium_genomes/prodigal_results/${name}.faa" \
        -d "photobacterium_genomes/prodigal_results/${name}_cds.fna" \
        -f gff -p single
done
