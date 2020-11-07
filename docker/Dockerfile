FROM ubuntu:18.04

SHELL [ "/bin/bash", "--login", "-c" ]
RUN apt update
RUN apt-get install -y wget
RUN apt-get install -y git

# Install cuda from the nvidia repository
# TODO: installing the "cuda" package comes with hundreds of packages as
#       dependencies. Find the minimum package list to install.
RUN apt-get install -y software-properties-common
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
RUN mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install cuda-10-1


ENV MINICONDA_PATH="$HOME/miniconda"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p $MINICONDA_PATH && rm miniconda.sh
ENV PATH="${MINICONDA_PATH}/bin:$PATH"
RUN conda init bash
RUN source $HOME/.bashrc
RUN conda update -y -n base -c defaults conda
RUN conda install -y -c conda-forge "python>3.6"
RUN conda install -y -c omnia -c conda-forge -c irl narupa-server
#conda install -y -c omnia/label/cuda101 -c conda-forge openmm MDAnalysis MDAnalysisTests ase mpi4py
RUN pip install --ignore-installed grpcio
ENV PYTHON=$MINICONDA_PATH/bin/python
RUN export PATH=$MINICONDA_PATH/bin:$PATH
RUN git clone --branch master https://gitlab.com/intangiblerealities/narupa-applications/isness.git
CMD [ "narupa-omm-ase",  "./isness/40-ALA.narupa2.xml",  "-w"]
# ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

#docker image build \
#  --build-arg username=$joe \
#  --build-arg uid=1000 \
#  --build-arg gid=1 \
#  --file Dockerfile \
#  --tag isness_server:isness_server \
#  ../
