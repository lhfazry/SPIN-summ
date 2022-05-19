#!/bin/bash
python src/full_prep.py \
    --data_root dataset/arxiv \
    --task arxiv \
    --partitions 500 --driver_memory 12g
