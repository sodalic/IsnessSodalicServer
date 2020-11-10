#!/bin/bash

#export INSTANCE_NAME="my-new-instance"
#gcloud compute instances create $INSTANCE_NAME 

gcloud beta compute instances create gpu-isness-server-sc-p100-2 \
    --zone="us-east1-b" \
    --machine-type="n1-standard-8" \
    --accelerator="type=nvidia-tesla-p100,count=1" \
    --source-machine-image="gpu-isness-server-sc-p100-1" \
    --service-account="669110238078-compute@developer.gserviceaccount.com" 

#gcloud beta compute ssh --zone "us-east1-b" "gpu-isness-server-sc-p100-2" --project "dauntless-graph-293915" 

#narupa-omm-ase ./IsnessSodalicServer/isness/40-ALA.narupa2.xml -w