# Create conda environment and install GToTree and IQTree
conda create --name gtotree
conda install -n gtotree -c conda-forge -c bioconda mamba
mamba install -n gtotree -c conda-forge -c bioconda gtotree
mamba install -n gtotree -c conda-forge -c bioconda iqtree

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
mkdir /scratch/wchorlian/genomes/psychromonas_genomes/iqtree

iqtree \
    -s "/scratch/wchorlian/genomes/psychromonas_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "8" \
    --prefix "/scratch/wchorlian/genomes/psychromonas_genomes/iqtree/psychromonas_iqtree"

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
    -t "8"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
mkdir /scratch/wchorlian/genomes/shewanella_genomes/iqtree

iqtree \
    -s "/scratch/wchorlian/genomes/shewanella_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "8" \
    --prefix "/scratch/wchorlian/genomes/shewanella_genomes/iqtree/shewanella_iqtree"

echo "Phylogenomic reconstruction complete."
