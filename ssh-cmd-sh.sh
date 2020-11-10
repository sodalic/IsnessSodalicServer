#!/bin/bash
gcloud beta compute ssh --zone "us-east1-b" "gpu-isness-server-sc-p100-2" --project "dauntless-graph-293915" --command="narupa-omm-ase ./IsnessSodalicServer/isness/40-ALA.narupa2.xml -w"

narupa-omm-ase ./IsnessSodalicServer/isness/40-ALA.narupa2.xml -w