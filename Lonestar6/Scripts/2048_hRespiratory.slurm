#!/bin/bash
#----------------------------------------------------------------------
#SBATCH -J RNASyncVirus           # Job name
#SBATCH -o RNASyncVirus.o%j       # Name of stdout output file
#SBATCH -e RNASyncVirus.e%j       # Name of stderr error file
#SBATCH -p gpu-h100                # Queue (partition) name
#SBATCH -N 1                       # Total # of nodes
#SBATCH -t 01:00:00                # Run time (hh:mm:ss)
#SBATCH -A TACC-SCI                # Allocation name
#SBATCH --mail-user=maddux.a.taukave.castro@gmail.com
#SBATCH --mail-type=all
#----------------------------------------------------------------------

# Load required modules
module load tacc-apptainer
module use /scratch/tacc/apps/bio/alphafold3/modulefiles
module load alphafold3/3.0.1-ctr.lua
module load remora
module list

# Set environment variable definitions to point to your input, output, and model parameters directories:
# - DO modify these variables
export AF3_INPUT_DIR=$SCRATCH/input
export AF3_OUTPUT_DIR=$SCRATCH/output/protein_512/full_a100
export AF3_MODEL_PARAMETERS_DIR=$HOME/af3_weights

# Set starting time
echo "Starting at: "
date

# Run the container
remora apptainer exec \
     --nv \
     --bind $AF3_INPUT_DIR:/root/af_input \
     --bind $AF3_OUTPUT_DIR:/root/af_output \
     --bind $AF3_MODEL_PARAMETERS_DIR:/root/models \
     --bind $AF3_DATABASES_DIR:/root/public_databases \
     $AF3_IMAGE \
     python ${AF3_CODE_DIR}/run_alphafold.py \
     --json_path=/root/af_input/Protein_RNA_SyncVirus.json \
     --model_dir=/root/models \
     --db_dir=/root/public_databases \
     --output_dir=/root/af_output

# Set ending time
echo "Ending at: "
date

