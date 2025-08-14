#!/bin/bash
#----------------------------------------------------
# Slurm job script
# for UCCS Incline nodes
#
#   *** Job on Normal Queue ***
#
#       This sample script specifies (for example):
#         2 nodes (capital N)
#         128 tasks/node (--ntasks-per-node)
#         1 OpenMP threads per MPI task (so a total
#               of 128 threads per node)
#
# Last revised: 20250813
#
# Notes:
#
#   -- Launch this script by executing
#      "sbatch run_XXX.slurm" on Incline login node.
#
#   -- In most cases it's best to keep
#      ( MPI ranks per node ) x ( threads per rank )
#      to a number no more than 128 (total cores).
#
#   -- If you're running out of memory, try running
#      fewer tasks and/or threads per node to give each
#      process access to more memory.
#
#----------------------------------------------------

#SBATCH -J test                # Job name
#SBATCH -o log_runs/test.o%j   # Name of stdout output file
#SBATCH -e log_runs/test.e%j   # Name of stderr error file
#SBATCH -p compute             # Queue (partition) name
#SBATCH --ntasks-per-node=128  # MPI tasks per node
#SBATCH -N 2                   # Total # of nodes
#SBATCH -t 02:00:00            # Run time (hh:mm:ss)

# Other commands must follow all #SBATCH directives...

pwd
date
cat run_test.slurm
cat ./MPI_programs/hello_MPI.cpp
git --git-dir .git show

export OMP_NUM_THREADS=1

# Launch MPI code...

mpirun ./MPI_programs/hello_loop

# ---------------------------------------------------

