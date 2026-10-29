#Install bakta and run annotation
conda create --name bakta
conda activate bakta
conda install -n bakta -c conda-forge mamba
mamba install -n bakta -c conda-forge -c bioconda bakta=1.12.2 -y

bakta_db download \  ## Download light bakta database
  --output /home/wchorlian/databases/bakta_database_light \
  --type light

export BAKTA_DB=/home/wchorlian/databases/bakta_light/db-light ##Set database pathway

GENOME_DIR=/home/wchorlian/wchorlian/genomes/psychromonas_genomes
OUT_DIR="$GENOME_DIR/bakta_results"

mkdir -p "$OUT_DIR"

for genome in "$GENOME_DIR"/*.fasta; do
    [ -f "$genome" ] || continue

    name=$(basename "$genome" .fasta)

    echo "Annotating $name"

    bakta \
        --db "$BAKTA_DB" \
        --output "$OUT_DIR/$name" \
        --prefix "$name" \
        --threads 8 \
        "$genome" \
    || echo "FAILED: $name"
done

GENOME_DIR=/home/wchorlian/wchorlian/genomes/shewanella_genomes
OUT_DIR="$GENOME_DIR/bakta_results"

mkdir -p "$OUT_DIR"

for genome in "$GENOME_DIR"/*.fasta; do
    [ -f "$genome" ] || continue

    name=$(basename "$genome" .fasta)

    echo "Annotating $name"

    bakta \
        --db "$BAKTA_DB" \
        --output "$OUT_DIR/$name" \
        --prefix "$name" \
        --threads 8 \
        "$genome" \
    || echo "FAILED: $name"
done

If you use these results please cite Bakta: https://doi.org/10.1099/mgen.0.000685

nano combine_psychromonas_bakta_json.py  #Create python script to combine .json results for psychromonas

import json  #Paste script into text window and save using crtl + O and enter, and then close out using ctrl + X
import csv
from pathlib import Path

input_dir = Path(
    "/home/wchorlian/wchorlian/genomes/psychromonas_genomes/bakta_results"
)

output_csv = input_dir.parent / "psychromonas_genome_statistics.csv"

rows = []

for file in sorted(input_dir.rglob("*.json")):
    try:
        with open(file, "r", encoding="utf-8") as f:
            data = json.load(f)

        stats = data.get("stats", {})
        genome_info = data.get("genome", {})

        rows.append({
            "genome": file.parent.name,
            "json_file": file.name,
            "genus": genome_info.get("genus"),
            "species": genome_info.get("species"),
            "strain": genome_info.get("strain"),
            "complete": genome_info.get("complete"),
            "genome_size_bp": stats.get("size"),
            "gc_content_percent": (
                stats["gc"] * 100
                if stats.get("gc") is not None else None
            ),
            "n_ratio": stats.get("n_ratio"),
            "n50_bp": stats.get("n50"),
            "n90_bp": stats.get("n90"),
            "coding_ratio_percent": (
                stats["coding_ratio"] * 100
                if stats.get("coding_ratio") is not None else None
            ),
        })

    except (json.JSONDecodeError, OSError) as error:
        print(f"Error reading {file}: {error}")

if not rows:
    print(f"No readable JSON files found in {input_dir}")
else:
    columns = list(dict.fromkeys(
        key for row in rows for key in row
    ))

    if output_csv.exists():
        print(f"Output already exists: {output_csv}")
        print("Rename or move it before running again.")
    else:
        with open(output_csv, "x", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=columns)
            writer.writeheader()
            writer.writerows(rows)

        print(f"Processed {len(rows)} JSON files.")
        print(f"CSV saved to: {output_csv}")

nano combine_shewanella_bakta_json.py  #Create python script to combine .json results for shewanella

import json
import csv
from pathlib import Path

input_dir = Path(
    "/home/wchorlian/wchorlian/genomes/shewanella_genomes/bakta_results"
)

output_csv = input_dir.parent / "shewanella_genome_statistics.csv"

rows = []

for file in sorted(input_dir.rglob("*.json")):
    try:
        with open(file, "r", encoding="utf-8") as f:
            data = json.load(f)

        stats = data.get("stats", {})
        genome_info = data.get("genome", {})

        rows.append({
            "genome": file.parent.name,
            "json_file": file.name,
            "genus": genome_info.get("genus"),
            "species": genome_info.get("species"),
            "strain": genome_info.get("strain"),
            "complete": genome_info.get("complete"),
            "genome_size_bp": stats.get("size"),
            "gc_content_percent": (
                stats["gc"] * 100
                if stats.get("gc") is not None else None
            ),
            "n_ratio": stats.get("n_ratio"),
            "n50_bp": stats.get("n50"),
            "n90_bp": stats.get("n90"),
            "coding_ratio_percent": (
                stats["coding_ratio"] * 100
                if stats.get("coding_ratio") is not None else None
            ),
        })

    except (json.JSONDecodeError, OSError) as error:
        print(f"Error reading {file}: {error}")

if not rows:
    print(f"No readable JSON files found in {input_dir}")
else:
    columns = list(dict.fromkeys(
        key for row in rows for key in row
    ))

    if output_csv.exists():
        print(f"Output already exists: {output_csv}")
        print("Rename or move it before running again.")
    else:
        with open(output_csv, "x", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=columns)
            writer.writeheader()
            writer.writerows(rows)

        print(f"Processed {len(rows)} JSON files.")
        print(f"CSV saved to: {output_csv}")

