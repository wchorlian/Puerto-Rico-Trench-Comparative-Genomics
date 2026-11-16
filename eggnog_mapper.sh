# Create conda environment to run eggnog
conda create -n eggnog python=3.11 -y
conda activate eggnog
conda install -c conda-forge -c bioconda eggnog-mapper -y

# Run eggnog-mapper on psychromonas faa files
screen -S psychromonas_eggnog

input_dir="/scratch/wchorlian/genomes/psychromonas_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/psychromonas_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"
mkdir -p "$output_dir"
for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue
    name=$(basename "$faa" .faa)
    echo "Processing $name"
    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done

# Run eggnog-mapper on shewanella faa files
screen -S shewanella_eggnog

input_dir="/scratch/wchorlian/genomes/shewanella_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/shewanella_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"
mkdir -p "$output_dir"
for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue
    name=$(basename "$faa" .faa)
    echo "Processing $name"
    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done

# Run eggnog-mapper on colwelia faa files
screen -S colwellia_eggnog

input_dir="/scratch/wchorlian/genomes/colwellia_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/colwellia_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"
mkdir -p "$output_dir"
for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue
    name=$(basename "$faa" .faa)
    echo "Processing $name"
    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done

# Run eggnog-mapper on moritella faa files
screen -S moritella_eggnog

input_dir="/scratch/wchorlian/genomes/moritella_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/moritella_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"
mkdir -p "$output_dir"
for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue
    name=$(basename "$faa" .faa)
    echo "Processing $name"
    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done

# Run eggnog-mapper on moritella faa files
screen -S photobacterium_eggnog

input_dir="/scratch/wchorlian/genomes/photobacterium_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/photobacterium_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"
mkdir -p "$output_dir"
for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue
    name=$(basename "$faa" .faa)
    echo "Processing $name"
    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done
