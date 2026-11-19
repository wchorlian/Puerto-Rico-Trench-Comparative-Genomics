# Create panaroo environment
conda create -n panaroo python=3.9 -y
conda activate panaroo
mamba install -c conda-forge -c bioconda panaroo=1.8.1 -y


# Run panaroo on colwellia genomes
screen -S colwellia_panaroo

mkdir -p /scratch/wchorlian/genomes/colwellia_genomes/panaroo_results

cd /scratch/wchorlian/genomes/colwellia_genomes/prodigal_results

for file in *.gff; do
    name="${file%.gff}"
    echo "$PWD/$file $(dirname "$PWD")/${name}.fna"
done > /scratch/wchorlian/genomes/colwellia_genomes/panaroo_results/panaroo_input_list.txt

panaroo \
    -i /scratch/wchorlian/genomes/colwellia_genomes/panaroo_results/panaroo_input_list.txt \
    -o /scratch/wchorlian/genomes/colwellia_genomes/panaroo_results \
    --clean-mode strict \
    -t 8


# Run panaroo on moritella genomes
screen -S moritella_panaroo

mkdir -p /scratch/wchorlian/genomes/moritella_genomes/panaroo_results

cd /scratch/wchorlian/genomes/moritella_genomes/prodigal_results

for file in *.gff; do
    name="${file%.gff}"
    echo "$PWD/$file $(dirname "$PWD")/${name}.fna"
done > /scratch/wchorlian/genomes/moritella_genomes/panaroo_results/panaroo_input_list.txt

panaroo \
    -i /scratch/wchorlian/genomes/moritella_genomes/panaroo_results/panaroo_input_list.txt \
    -o /scratch/wchorlian/genomes/moritella_genomes/panaroo_results \
    --clean-mode strict \
    -t 8


# Run panaroo on photobacterium genomes
screen -S photobacterium_panaroo

mkdir -p /scratch/wchorlian/genomes/photobacterium_genomes/panaroo_results

cd /scratch/wchorlian/genomes/photobacterium_genomes/prodigal_results

for file in *.gff; do
    name="${file%.gff}"
    echo "$PWD/$file $(dirname "$PWD")/${name}.fna"
done > /scratch/wchorlian/genomes/photobacterium_genomes/panaroo_results/panaroo_input_list.txt

panaroo \
    -i /scratch/wchorlian/genomes/photobacterium_genomes/panaroo_results/panaroo_input_list.txt \
    -o /scratch/wchorlian/genomes/photobacterium_genomes/panaroo_results \
    --clean-mode strict \
    -t 8


# Run panaroo on psychromonas genomes
screen -S psychromonas_panaroo

mkdir -p /scratch/wchorlian/genomes/psychromonas_genomes/panaroo_results

cd /scratch/wchorlian/genomes/psychromonas_genomes/prodigal_results

for file in *.gff; do
    name="${file%.gff}"
    echo "$PWD/$file $(dirname "$PWD")/${name}.fasta"
done > /scratch/wchorlian/genomes/psychromonas_genomes/panaroo_results/panaroo_input_list.txt

panaroo \
    -i /scratch/wchorlian/genomes/psychromonas_genomes/panaroo_results/panaroo_input_list.txt \
    -o /scratch/wchorlian/genomes/psychromonas_genomes/panaroo_results \
    --clean-mode strict \
    -t 8


# Run panaroo on shewanella genomes
screen -S shewanella_panaroo

mkdir -p /scratch/wchorlian/genomes/shewanella_genomes/panaroo_results

cd /scratch/wchorlian/genomes/shewanella_genomes/prodigal_results

for file in *.gff; do
    name="${file%.gff}"
    echo "$PWD/$file $(dirname "$PWD")/${name}.fasta"
done > /scratch/wchorlian/genomes/shewanella_genomes/panaroo_results/panaroo_input_list.txt

panaroo \
    -i /scratch/wchorlian/genomes/shewanella_genomes/panaroo_results/panaroo_input_list.txt \
    -o /scratch/wchorlian/genomes/shewanella_genomes/panaroo_results \
    --clean-mode strict \
    -t 8
