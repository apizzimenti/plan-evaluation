#!/bin/bash

state = $1
echo $state

for map in  "congress" "state_senate" "state_house"
do
    echo $map
    for county_aware in 0 1
    do
        [ $county_aware == 1 ] && county_aware_str="county_aware" || county_aware_str="neutral"
        echo $county_aware_str
        sbatch -o logs/$state.$map.$county_aware_str.run_ensemble.%x.%A_%a.txt run_chain.slurm $state $map 100000 $county_aware
        sleep 1
    done
done