# Create Conda environment to run quality control on genomes
conda create --name quality_control
conda info --envs
conda list
conda activate quality_control

## Install mamba to install CHECKM2 and run genome QC
conda install -n quality_control -c conda-forge mamba
mamba install -n quality_control -c conda-forge -c bioconda checkm2
conda list checkm2

screen -S checkm2_psychromonas
screen -S checkm2_shewanella
screen -S checkm2_colwellia
screen -S checkm2_moritella
screen -S checkm2_photobacterium

### Download checkM2 database
checkm2 database --download

checkm2 predict \
  --threads 8 \
  --input /scratch/wchorlian/genomes/psychromonas_genomes \
  --extension fasta \
  --output-directory /scratch/wchorlian/genomes/psychromonas_genomes/checkm2_psychromonas_results

  checkm2 predict \
  --threads 8 \
  --input /scratch/wchorlian/genomes/shewanella_genomes \
  --extension fasta \
  --output-directory /scratch/wchorlian/genomes/shewanella_genomes/checkm2_shewanella_results

checkm2 predict \
  --threads 8 \
  --input /scratch/wchorlian/genomes/colwellia_genomes \
  --extension fna \
  --output-directory /scratch/wchorlian/genomes/colwellia_genomes/checkm2_colwellia_results

checkm2 predict \
  --threads 8 \
  --input /scratch/wchorlian/genomes/moritella_genomes \
  --extension fna \
  --output-directory /scratch/wchorlian/genomes/moritella_genomes/checkm2_moritella_results

checkm2 predict \
  --threads 8 \
  --input /scratch/wchorlian/genomes/photobacterium_genomes \
  --extension fna \
  --output-directory /scratch/wchorlian/genomes/photobacterium_genomes/checkm2_photobacterium_results

## Install QUAST and run assembly QC
mamba install -n quality_control -c conda-forge -c bioconda python=3.11 quast

screen -S quast_psychromonas
screen -S quast_shewanella
screen -S quast_colwellia
screen -S quast_moritella
screen -S quast_photobacterium

quast.py \
  /scratch/wchorlian/genomes/psychromonas_genomes/*.fasta \
  --threads 8 \
  -o /scratch/wchorlian/genomes/psychromonas_genomes/quast_psychromonas_results

quast.py \
  /scratch/wchorlian/genomes/shewanella_genomes/*.fasta \
  --threads 8 \
  -o /scratch/wchorlian/genomes/shewanella_genomes/quast_shewanella_results

quast.py \
  /scratch/wchorlian/genomes/colwellia_genomes/*.fna \
  --threads 8 \
  -o /scratch/wchorlian/genomes/colwellia_genomes/quast_colwellia_results

quast.py \
  /scratch/wchorlian/genomes/moritella_genomes/*.fna \
  --threads 8 \
  -o /scratch/wchorlian/genomes/moritella_genomes/quast_moritella_results

quast.py \
  /scratch/wchorlian/genomes/photobacterium_genomes/*.fna \
  --threads 8 \
  -o /scratch/wchorlian/genomes/photobacterium_genomes/quast_photobacterium_results

##Install GTDB-Tk and run classifications
mamba install -c conda-forge -c bioconda gtdbtk=2.7.2
export GTDBTK_DATA_PATH=/data_store/gtdbtk_files/release232 ###Set database path

screen -S gtdbtk_psychromonas
screen -S gtdbtk_shewanella
screen -S gtdbtk_colwellia
screen -S gtdbtk_moritella
screen -S gtdbtk_photobacterium

gtdbtk classify_wf \
  --genome_dir /scratch/wchorlian/genomes/psychromonas_genomes \
  --extension fasta \
  --out_dir /scratch/wchorlian/genomes/psychromonas_genomes/gtdbtk_results \
  --cpus 8

gtdbtk classify_wf \
  --genome_dir /scratch/wchorlian/genomes/shewanella_genomes \
  --extension fasta \
  --out_dir /scratch/wchorlian/genomes/shewanella_genomes/gtdbtk_results \
  --cpus 8

gtdbtk classify_wf \
  --genome_dir /scratch/wchorlian/genomes/colwellia_genomes \
  --extension fna \
  --out_dir /scratch/wchorlian/genomes/colwellia_genomes/gtdbtk_results \
  --cpus 8

gtdbtk classify_wf \
  --genome_dir /scratch/wchorlian/genomes/moritella_genomes \
  --extension fna \
  --out_dir /scratch/wchorlian/genomes/moritella_genomes/gtdbtk_results \
  --cpus 8

gtdbtk classify_wf \
  --genome_dir /scratch/wchorlian/genomes/photobacterium_genomes \
  --extension fna \
  --out_dir /scratch/wchorlian/genomes/photobacterium_genomes/gtdbtk_results \
  --cpus 8
