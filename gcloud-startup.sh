gcloud beta compute instances create anuma-cmd4 --zone us-east1-b --source-machine-image projects/dauntless-graph-293915/global/machineImages/nvidia-gpu-sc-2 \
--metadata startup-script='#!/bin/bash
narupa-omm-ase ./IsnessSodalicServer/isness/40-ALA.narupa2.xml -w
EOF'