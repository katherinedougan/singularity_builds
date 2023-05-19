#!/bin/bash

sudo singularity build --sandbox sandbox docker://ubuntu:22.04
sudo singularity shell --writable sandbox/

# To build from .def file:
# sudo singularity build singularity_image.sif singularity.def

# To build from sandbox:
# sudo singularity build singularity_image.sif sandbox/
