# Generate list of genomes retained for phylogenomic analysis
find "$(realpath "/scratch/wchorlian/genomes/psychromonas_genomes")" \
    -maxdepth 1 \
    -type f \
    -name "*.fasta" \
    | sort \
    > "/scratch/wchorlian/genomes/psychromonas_genomes/genomes.list"

# Extract and align conserved bacterial single-copy genes
# using GToTree and the bacterial HMM set.
GToTree \
    -f "/scratch/wchorlian/genomes/psychromonas_genomes/genomes.list" \
    -H Bacteria \
    -B \
    -o "/scratch/wchorlian/genomes/psychromonas_genomes/gtotree" \
    -t "8"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
iqtree \
    -s "/scratch/wchorlian/genomes/psychromonas_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "${THREADS}" \
    --prefix "/scratch/wchorlian/genomes/psychromonas_genomes/JS1_iqtree"

echo "Phylogenomic reconstruction complete."


# Generate list of genomes retained for phylogenomic analysis
find "$(realpath "/scratch/wchorlian/genomes/shewanella_genomes")" \
    -maxdepth 1 \
    -type f \
    -name "*.fasta" \
    | sort \
    > "/scratch/wchorlian/genomes/shewanella_genomes/genomes.list"

# Extract and align conserved bacterial single-copy genes
# using GToTree and the bacterial HMM set.
GToTree \
    -f "/scratch/wchorlian/genomes/shewanella_genomes/genomes.list" \
    -H Bacteria \
    -B \
    -o "/scratch/wchorlian/genomes/shewanella_genomes/gtotree" \
    -t "${THREADS}"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
iqtree \
    -s "/scratch/wchorlian/genomes/shewanella_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "${THREADS}" \
    --prefix "/scratch/wchorlian/genomes/shewanella_genomes/JS1_iqtree"

echo "Phylogenomic reconstruction complete."
