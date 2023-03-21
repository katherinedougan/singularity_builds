#!/bin/bash

singularity build --sandbox sandbox docker://ubuntu:22.04
singularity shell --writable sandbox/
