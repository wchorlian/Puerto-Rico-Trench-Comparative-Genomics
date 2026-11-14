

# Run eggnog-mapper on colwelia faa files
input_dir="/scratch/wchorlian/genomes/colwellia_genomes/prodigal_results"
output_dir="/scratch/wchorlian/genomes/colwellia_genomes/eggnog_results"
data_dir="/data_store/eggnog_db"

mkdir -p "$output_dir"

for faa in "$input_dir"/*.faa; do
    [ -e "$faa" ] || continue

    name=$(basename "$faa" .faa)

    emapper.py \
        -i "$faa" \
        --itype proteins \
        --data_dir "$data_dir" \
        -o "$name" \
        --output_dir "$output_dir" \
        --cpu 8
done
