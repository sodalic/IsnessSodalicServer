#!/bin/bash

# Install conda
MINICONDA_PATH="$HOME/miniconda"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $MINICONDA_PATH && rm miniconda.sh
PATH="${MINICONDA_PATH}/bin:$PATH"
conda init bash
source $HOME/.bashrc
conda update -y -n base -c defaults conda
conda install -y -c conda-forge "python>3.6"
conda install -y -c omnia -c conda-forge -c irl narupa-server
#conda install -y -c omnia/label/cuda101 -c conda-forge openmm MDAnalysis MDAnalysisTests ase mpi4py
pip install --ignore-installed grpcio
PYTHON=$MINICONDA_PATH/bin/python
export PATH=$MINICONDA_PATH/bin:$PATH

#exec bash
#conda create -y -n narupa-dev "python>3.6"
#conda activate narupa-dev
#conda install -y -c omnia -c conda-forge -c irl narupa-server
git clone https://gitlab.com/intangiblerealities/narupa-applications/isness.git
cd isness
git checkout master  
narupa-omm-ase ./40-ALA.narupa2.xml -w
