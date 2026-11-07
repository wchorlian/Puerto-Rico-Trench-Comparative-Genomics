# Create conda environment and install GToTree and IQTree
conda create --name gtotree
conda install -n gtotree -c conda-forge -c bioconda mamba
mamba install -n gtotree -c conda-forge -c bioconda gtotree
mamba install -n gtotree -c conda-forge -c bioconda iqtree

# Generate list of psychromonas genomes retained for phylogenomic analysis
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

# Generate list of shewanella genomes retained for phylogenomic analysis
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

# Generate list of colwellia genomes retained for phylogenomic analysis
find "$(realpath "/scratch/wchorlian/genomes/colwellia_genomes")" \
    -maxdepth 1 \
    -type f \
    -name "*.fna" \
    | sort \
    > "/scratch/wchorlian/genomes/colwellia_genomes/genomes.list"

# Extract and align conserved bacterial single-copy genes
# using GToTree and the bacterial HMM set.
GToTree \
    -f "/scratch/wchorlian/genomes/colwellia_genomes/genomes.list" \
    -H Bacteria \
    -B \
    -o "/scratch/wchorlian/genomes/colwellia_genomes/gtotree" \
    -t "8"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
mkdir /scratch/wchorlian/genomes/colwellia_genomes/iqtree

iqtree \
    -s "/scratch/wchorlian/genomes/colwellia_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "8" \
    --prefix "/scratch/wchorlian/genomes/colwellia_genomes/iqtree/colwellia_iqtree"

# Generate list of moritella genomes retained for phylogenomic analysis
find "$(realpath "/scratch/wchorlian/genomes/moritella_genomes")" \
    -maxdepth 1 \
    -type f \
    -name "*.fna" \
    | sort \
    > "/scratch/wchorlian/genomes/moritella_genomes/genomes.list"

# Extract and align conserved bacterial single-copy genes
# using GToTree and the bacterial HMM set.
GToTree \
    -f "/scratch/wchorlian/genomes/moritella_genomes/genomes.list" \
    -H Bacteria \
    -B \
    -o "/scratch/wchorlian/genomes/moritella_genomes/gtotree" \
    -t "8"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
mkdir /scratch/wchorlian/genomes/moritella_genomes/iqtree

iqtree \
    -s "/scratch/wchorlian/genomes/moritella_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "8" \
    --prefix "/scratch/wchorlian/genomes/moritella_genomes/iqtree/moritella_iqtree"

# Generate list of moritella genomes retained for phylogenomic analysis
find "$(realpath "/scratch/wchorlian/genomes/photobacterium_genomes")" \
    -maxdepth 1 \
    -type f \
    -name "*.fna" \
    | sort \
    > "/scratch/wchorlian/genomes/photobacterium_genomes/genomes.list"

# Extract and align conserved bacterial single-copy genes
# using GToTree and the bacterial HMM set.
GToTree \
    -f "/scratch/wchorlian/genomes/photobacterium_genomes/genomes.list" \
    -H Bacteria \
    -B \
    -o "/scratch/wchorlian/genomes/photobacterium_genomes/gtotree" \
    -t "8"

# Infer maximum-likelihood phylogeny using ModelFinder
# and 1,000 ultrafast bootstrap replicates.
mkdir /scratch/wchorlian/genomes/photobacterium_genomes/iqtree

iqtree \
    -s "/scratch/wchorlian/genomes/photobacterium_genomes/gtotree/Aligned_SCGs.faa" \
    -m MFP \
    -B 1000 \
    -T "8" \
    --prefix "/scratch/wchorlian/genomes/photobacterium_genomes/iqtree/photobacterium_iqtree"
