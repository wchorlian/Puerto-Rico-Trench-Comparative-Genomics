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

### Download checkM2 database
checkm2 database --download

checkm2 predict \
  --threads 8 \
  --input /home/wchorlian/wchorlian/genomes/psychromonas_genomes \
  --extension fasta \
  --output-directory /home/wchorlian/wchorlian/genomes/psychromonas_genomes/checkm2_psychromonas_results

  checkm2 predict \
  --threads 8 \
  --input /home/wchorlian/wchorlian/genomes/shewanella_genomes \
  --extension fasta \
  --output-directory /home/wchorlian/wchorlian/genomes/shewanella_genomes/checkm2_shewanella_results

## Install QUAST and run assembly QC
mamba install -n quality_control -c conda-forge -c bioconda python=3.11 quast

quast.py \
  /home/wchorlian/wchorlian/genomes/psychromonas_genomes/*.fasta \
  --threads 8 \
  -o /home/wchorlian/wchorlian/genomes/psychromonas_genomes/quast_psychromonas_results

quast.py \
  /home/wchorlian/wchorlian/genomes/shewanella_genomes/*.fasta \
  --threads 8 \
  -o /home/wchorlian/wchorlian/genomes/shewanella_genomes/quast_shewanella_results

##Install GTDB-Tk and run classifications
mamba install -c conda-forge -c bioconda gtdbtk=2.7.2
export GTDBTK_DATA_PATH=/data_store/gtdbtk_files/release232 ###Set database path

gtdbtk classify_wf \
  --genome_dir /home/wchorlian/wchorlian/genomes/psychromonas_genomes \
  --extension fasta \
  --out_dir /home/wchorlian/wchorlian/genomes/psychromonas_genomes/gtdbtk_results \
  --cpus 8

gtdbtk classify_wf \
  --genome_dir /home/wchorlian/wchorlian/genomes/shewanella_genomes \
  --extension fasta \
  --out_dir /home/wchorlian/wchorlian/genomes/shewanella_genomes/gtdbtk_results \
  --cpus 8
