# AF3_Benchmarks
# AlphaFold3 Benchmark Testing on TACC Supercomputers

This repository contains scripts and configurations for benchmarking AlphaFold3 on the **Frontera** and **Lonestar6** supercomputers at the Texas Advanced Computing Center (TACC). The goal is to determine optimal GPU/CPU configurations and workflows for running AlphaFold3 efficiently based on input token size and job requirements.

---

## Repository Overview

This repository is organized to store:
- Input files for AlphaFold3 jobs.
- Submission scripts for running benchmarks on Frontera and Lonestar6.
- Output logs and performance metrics for analysis.

---

## Repository Structure
.
├── Frontera/
│ ├── inputs/ # Input data (e.g. configuration templates)
│ ├── outputs/ # Benchmark results (logs, timing files, metrics)
│ └── scripts/ # Job submission scripts (SLURM) 
│
├── Lonestar6/
│ ├── inputs/ # Input data
│ ├── outputs/ # Benchmark results
│ └── scripts/ # Job submission scripts
│
└── README.md # This document