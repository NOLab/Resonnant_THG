# Resonnant_THG
Matlab code to study resonant THG
Code used to generate the simulation data from the article "Resonant third harmonic generation in biological pigments" by  Stella Dees et al.

First step: run the simulation using the code from the folder "_Fig3", the post-process the data using the scripts in "Psot-Processing"

The simulation code is paralelized using a parfor loop, with a default parpool of 12 (can be modified in "ResTHG2024.m")
