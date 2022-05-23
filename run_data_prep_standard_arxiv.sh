#!/bin/bash
python src/full_prep.py \
    --data_root dataset/arxiv \
    --task arxiv \
    --strategy standard \
    --partitions 150 --driver_memory 16g
