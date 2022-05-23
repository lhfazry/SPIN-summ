#!/bin/bash
python src/full_prep.py \
    --data_root dataset/arxiv \
    --task arxiv \
    --strategy dancer \
    --partitions 150 --driver_memory 16g
