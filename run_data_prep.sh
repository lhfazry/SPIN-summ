#!/bin/bash
python src/full_prep.py \
    --data_root dataset/arxiv \
    --task arxiv \
    --partitions 100 --driver_memory 16g
